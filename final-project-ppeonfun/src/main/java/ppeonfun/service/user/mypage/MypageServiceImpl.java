package ppeonfun.service.user.mypage;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dao.user.mypage.MypageDao;
import ppeonfun.dto.Board;
import ppeonfun.dto.CommunityAnswer;
import ppeonfun.dto.Member;
import ppeonfun.dto.Message;
import ppeonfun.dto.MyPage;
import ppeonfun.util.Paging;

@Service("user.MypageService")
public class MypageServiceImpl implements MypageService {

	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);
	
	@Autowired private MypageDao mypageDao;
	@Autowired private ServletContext context;
	
	@Override
	public MyPage getProfileImg(int mNo) {
		logger.info("***** MypageServiceImpl getProfileImg START *****");
		return mypageDao.selectMypageBymNo(mNo);
	}

	@Override
	public void updateMypageFile(int mNo, MultipartFile file) {
		logger.info("***** MypageServiceImpl updateMypageFile START *****");
		
		//기존에 존재하는 파일명 가져오기
		MyPage stored = mypageDao.selectMypageBymNo(mNo);
		logger.info("기존에 저장된 파일명:{}", stored.getMyStoredName());
		
		//기존 파일이 upload 경로에 있으면 파일 삭제 (기본 이미지이면 pass)
		String storedPath = context.getRealPath("upload/profile");
		String prePath = (storedPath + "\\" + stored.getMyStoredName());
		File prefile = new File(prePath);
		if(prefile.exists()) {
			prefile.delete();
			logger.info("이전 업로드 파일 삭제 완료");
		}
		
		//기존 파일 삭제 후 또는 기본 이미지 파일일 때 updateMypageFile(mNo, file) 수행
		File upfile = new File(storedPath);
		if(!upfile.exists()) { upfile.mkdir(); }
		
		//원본 파일명
		String originName = file.getOriginalFilename();
		logger.info("새 원본 파일명:{}", originName);
		
		//확장자 추출
		int lastDot = originName.lastIndexOf('.');
		String ext = originName.substring(lastDot+1);
		originName = originName.substring(0, lastDot);

		//원본 파일 이름이 35byte 초과 시 substring
		if(originName.getBytes().length > 35) {
			originName = originName.substring(0,10);
			logger.info("새 원본 파일명 substring:{}", originName);
		} 
 		String uid = UUID.randomUUID().toString().split("-")[3];

		//저장할 파일명
		String storedName = (originName + uid + "." + ext);
		logger.info("새로 저장할 파일명:{}", storedName);

		//경로에 파일 저장 및 DB 기록
		File dest = new File(upfile, storedName);
			try {
				file.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			MyPage mypage = new MyPage();
			mypage.setMyNo(mNo);
			mypage.setMyOriginName(originName);
			mypage.setMyStoredName(storedName);
			mypage.setMySize(Math.round(file.getSize()));
			mypage.setMyContentType(ext);

			mypageDao.updateMypage(mypage);
	}

	@Override
	public void deleteProfileImg(int mNo) {
		logger.info("***** MypageServiceImpl deleteProfileImg START *****");
		
		//기존에 존재하는 파일명 가져오기
		MyPage stored = mypageDao.selectMypageBymNo(mNo);
		logger.info("기존에 저장된 파일명:{}", stored.getMyStoredName());
		
		//upload 경로에 있는 기존 파일 삭제
		String storedPath = context.getRealPath("upload/profile");
		String prePath = (storedPath + "\\" + stored.getMyStoredName());
		File prefile = new File(prePath);
		if(prefile.exists()) {
			prefile.delete();
			logger.info("이전 업로드 파일 삭제 완료");
		}
		
		//mypage 테이블에 파일명 기본이미지로 업데이트
		MyPage mypage = new MyPage();
		mypage.setMyNo(mNo);
		mypage.setMyOriginName("member.png");
		mypage.setMyStoredName("member.png");
		mypage.setMySize(15080);
		mypage.setMyContentType("png");

		mypageDao.updateMypage(mypage);
	}

	@Override
	public void updateMyIntroByNo(String introduce, int mNo) {
		MyPage mypage = new MyPage();
		mypage.setMyNo(mNo);
		mypage.setMyIntroduce(introduce);
		
		mypageDao.updateMypageIntro(mypage);
	}

	@Override
	public Member getMemberInfo(int mNo) {
		return mypageDao.selectMemberByNo(mNo);
	}

	@Override
	public void updateMemberInfo(Member member) {
		mypageDao.updateMemberInfo(member);
	}

	@Override
	public String getSocialInfo(int mNo) {
		return mypageDao.selectMsocialByNo(mNo);
	}

	@Override
	public boolean checkPassword(Member member) {
		int cnt = mypageDao.selectCntmPw(member);
		
		if(cnt > 0) return true;
		else return false;
	}

	@Override
	public void updatePassword(Member member) {
		mypageDao.updatePwByNo(member);
	}

	@Override
	public String getEmailBymNo(int mNo) {
		return mypageDao.selectmEmailBymNo(mNo);
	}
	
	@Override
	public boolean checkProjectByNo(int mNo) {
		//서포터로 참여중인 프로젝트 개수 조회
		int bySupport = mypageDao.selectCntProjectBySupport(mNo);
		
		//메이커로 참여중인 프로젝트 개수 조회
		int byMaker = mypageDao.selectCntProjectByMaker(mNo);
		
		if((bySupport + byMaker) > 0 ) { return true; }
		else { return false; }
	}
	
	@Override
	public void updateDeleteState(int mNo) {
		mypageDao.updateDeleteStateBymNo(mNo);
	}

	@Override
	public Paging getPaymPaging(int curPage, int mNo, String category) {
		int totalCount = mypageDao.selectCntPayment(mNo, category);
		
		if( totalCount > 0 ) {
			Paging paging = new Paging(totalCount, curPage, 6);
			paging.setCategory(category);
			
			return paging;
		} else {
			return null;
		}
	}

	@Override
	public List<Map<String, Object>> getMyFundingListAll(Paging paging, int mNo) {
		return mypageDao.selectMyFundingListAll(paging, mNo);
	}

	@Override
	public List<HashMap<String, Object>> getPaymentSum(int mNo) {
		return mypageDao.selectPaymSumByNo(mNo);
	}

	@Override
	public List<HashMap<String, Object>> getPaybackSum(int mNo) {
		return mypageDao.selectPaybSumByNo(mNo);
	}

	@Override
	public Paging getFavoritePaging(int curPage, int mNo, String category) {
		int totalCount = mypageDao.selectCntFavorite(mNo, category);
		
		if(totalCount > 0) {
			Paging paging = new Paging(totalCount, curPage, 6);
			paging.setCategory(category);
			
			return paging;
		} else {
			return null;
		}
	}

	@Override
	public List<HashMap<String, Object>> getMyFavoriteList(Paging paging, int mNo) {
		return mypageDao.selectAllMyFavoriteList(paging, mNo);
	}

	@Override
	public Paging getFundCommPaging(int curPage, int mNo, String category) {
		int totalCount = mypageDao.selectCntFundComm(mNo, category);
		
		if(totalCount > 0 ) {
			Paging paging = new Paging(totalCount, curPage, 5);
			paging.setCategory(category);
			
			return paging;
		} else {
			return null;
		}
	}

	@Override
	public List<HashMap<String, Object>> getMyFundCommList(Paging paging, int mNo) {
		return mypageDao.selectAllMyFundCommList(paging, mNo);
	}

	@Override
	public CommunityAnswer getCommentAnswerBycomNo(int mNo, int comNo) {
		return mypageDao.selectCommAnsBycomNo(mNo, comNo);
	}

	@Override
	public Paging getMyBoardPaging(int curPage, int mNo) {
		int totalCount = mypageDao.selectCntMyBoard(mNo);
		
		if(totalCount > 0) {
			return new Paging(totalCount, curPage);
		} else {
			return null;
		}
	}

	@Override
	public List<HashMap<String, Object>> getMyBoardList(Paging paging, int mNo) {
		return mypageDao.selectAllBoardBymNo(paging, mNo);
	}

	@Override
	public Paging getMessagePaging(int curPage, int mNo) {
		int totalCount = mypageDao.selectCntChatBymNo(mNo);
		
		if(totalCount > 0 ) {
			return new Paging(totalCount, curPage, 4);
		} else {
			return null;
		}
	}

	@Override
	public List<HashMap<String, Object>> getChatList(Paging paging, int mNo) {
		
		//회원이 참여중인 채팅방 번호를 조회한다.
		List<Integer> chatNoList = mypageDao.selectChatNoBymNo(mNo);
		logger.info("채팅방 번호 목록:{}", chatNoList);
		
		//회원번호가 다르면서 채팅방 번호가 같은 목록 조회(상대방 정보 까지 조회)
		List<HashMap<String, Object>> msgList = null;
		if(chatNoList != null) {
				msgList = mypageDao.selectAllMyChatList(paging, chatNoList, mNo);
		} 
		return msgList;
	}

	@Override
	public List<HashMap<String, Object>> getMessageList(List<Integer> chatNoList) {
		List<HashMap<String, Object>> msgList = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> msgMap = null;
		for(int i = 0; i < chatNoList.size(); i++) {
			msgMap = mypageDao.selectMessageBycrNo(chatNoList.get(i));
			msgList.add(msgMap);
		}
		return msgList;
	}

	@Override
	public List<HashMap<String, Object>> getDetailMsg(int crNo) {
		return mypageDao.selectAllMessageContent(crNo);
	}

	@Override
	public Paging getMyOpenpjPaging(int curPage, int mNo, String category) {
		int totalCount = mypageDao.selectCntMyOpenProject(mNo, category);
		
		if(totalCount > 0 ) {
			Paging paging = new Paging(totalCount, curPage, 6);
			paging.setCategory(category);
			
			return paging;
		} else {
			return null;
		}
	}

	@Override
	public List<HashMap<String, Object>> getMyOpenpjList(Paging paging, int mNo) {
		return mypageDao.selectAllMyOpenProject(paging, mNo);
	}

	@Override
	public void insertMessage(int mNo, Message inData) {
		mypageDao.insertMessage(mNo, inData);
	}


}
