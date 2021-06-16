package ppeonfun.service.user.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.CommunityAnswer;
import ppeonfun.dto.Member;
import ppeonfun.dto.Message;
import ppeonfun.dto.MyPage;
import ppeonfun.util.Paging;

public interface MypageService {

	/**
	 * 해당 회원번호의 프로필 사진을 가져온다.
	 * @param mNo	회원번호
	 * @return		프로필 사진 정보를 담은 Mypage 객체
	 */
	public MyPage getProfileImg(int mNo);

	
	/**
	 * 해당 회원번호의 프로필 사진을 변경한다.
	 * @param mNo 	회원번호
	 * @param file	새 프로필 이미지 파일 
	 */
	public void updateMypageFile(int mNo, MultipartFile file);


	/**
	 * 해당 회원번호의 프로필 사진을 삭제한다.
	 * @param 		회원번호
	 */
	public void deleteProfileImg(int mNo);


	/**
	 * 해당 회원번호의 소개글을 수정한다.
	 * @param introduce
	 * @param mNo
	 */
	public void updateMyIntroByNo(String introduce, int mNo);


	/**
	 * 해당 회원번호의 기본 정보를 조회한다.
	 * @param mNo	회원번호
	 * @return		기본 정보가 담긴 DTO
	 */
	public Member getMemberInfo(int mNo);


	/**
	 * 회원의 수정된 기본 정보를 업데이트한다.
	 * @param member	수정된 기본 정보가 담긴 DTO	
	 */
	public void updateMemberInfo(Member member);


	/**
	 * 사이트 / 카카오 가입 정보를 조회한다.
	 * @param mNo	회원번호
	 * @return		가입 정보(사이트 / 카카오)
	 */
	public String getSocialInfo(int mNo);


	/**
	 * 입력값과 테이블의 컬럼값이 일치하는지 비교한다.
	 * @param member	비밀번호 암호화 값이 담긴 DTO
	 * @return			일치하면 true, 일치하지 않으면 false
	 */
	public boolean checkPassword(Member member);


	/**
	 * 비밀번호를 변경한다.
	 * @param member	새 비밀번호가 담긴 DTO
	 */
	public void updatePassword(Member member);


	/**
	 * 회원번호로 회원의 이메일 주소를 조회한다.
	 * @param mNo	회원번호
	 * @return		이메일
	 */
	public String getEmailBymNo(int mNo);

	
	/**
	 * 회원이 참여중인 프로젝트가 있는지 조회한다.
	 * @param mNo	회원번호
	 * @return		참여중이면 true, 아니면 false
	 */
	public boolean checkProjectByNo(int mNo);

	
	/**
	 * 회원의 탈퇴 신청을 업데이트한다.
	 * @param mNo	회원번호
	 */
	public void updateDeleteState(int mNo);

	/**
	 * 전체 펀딩의 페이징 객체를 생성한다.
	 * @param curPage		현재 페이지
	 * @param mNo 			회원번호
	 * @param categoryArr	카테고리 목록
	 * @return				페이지에 따른 페이징
	 */
	public Paging getPaymPaging(int curPage, int mNo, String[] categoryArr);


	/**
	 * 페이징이 적용된 전체 펀딩 목록을 조회한다.
	 * @param paging		페이징 정보
	 * @param mNo			회원번호
	 * @param categoryArr	카테고리 목록
	 * @return				페이징에 따른 목록
	 */
	public List<Map<String, Object>> getMyFundingListAll(Paging paging, int mNo, String[] categoryArr);

	
	/**
	 * 회원의 카테고리별 결제 완료 금액을 조회한다.
	 * @param mNo	회원번호
	 * @return		카테고리별 결제 금액
	 */
	public List<HashMap<String, Object>> getPaymentSum(int mNo);


	/**
	 * 회원의 카테고리별 환불 금액을 조회한다.
	 * @param mNo	회원번호
	 * @return		카테고리별 환불 금액
	 */
	public List<HashMap<String, Object>> getPaybackSum(int mNo);


	/**
	 * 회원이 좋아요한 프로젝트 목록의 페이징을 생성한다.
	 * @param curPage 		현재 페이지
	 * @param mNo			회원번호
	 * @param categoryArr 	카테고리 목록
	 * @return				페이징 정보 객체
	 */
	public Paging getFavoritePaging(int curPage, int mNo, String[] categoryArr);
	
	
	/**
	 * 회원이 좋아요한 프로젝트 목록을 조회한다.
	 * @param paging 		페이징 정보 객체
	 * @param mNo			회원번호
	 * @param categoryArr 	카테고리 목록
	 * @return				좋아요한 프로젝트 목록
	 */
	public List<HashMap<String, Object>> getMyFavoriteList(Paging paging, int mNo, String[] categoryArr);


	/**
	 * 펀딩 커뮤니티의 페이징 객체를 생성한다.
	 * @param curPage	현재 페이지
	 * @param mNo		회원 번호
	 * @return			페이징 정보 객체
	 */
	public Paging getFundCommPaging(int curPage, int mNo);


	/**
	 * 회원이 펀딩 커뮤니티에 작성한 글 목록을 조회한다.
	 * @param paging	페이징 정보 객체
	 * @param mNo		회원 번호
	 * @return			작성한 글 목록 
	 */
	public List<HashMap<String, Object>> getMyFundCommList(Paging paging, int mNo);


	/**
	 * 회원이 펀딩 커뮤니티에 작성한 글의 답변을 조회한다.
	 * @param mNo		회원번호
	 * @param comNo		커뮤니티 질문 번호
	 * @return			답변 DTO
	 */
	public CommunityAnswer getCommentAnswerBycomNo(int mNo, int comNo);


	/**
	 * 회원이 게시판에 작성한 글의 수로 페이징을 생성한다.
	 * @param curPage	현재 페이지
	 * @param mNo		회원번호
	 * @return			페이징 정보 객체
	 */
	public Paging getMyBoardPaging(int curPage, int mNo);


	/**
	 * 회원이 작성한 게시글 목록을 조회한다.
	 * @param paging	페이징 정보 객체
	 * @param mNo		회원번호
	 * @return			게시글 목록
	 */
	public List<HashMap<String, Object>> getMyBoardList(Paging paging, int mNo);

	
	/**
	 * 메시지 목록의 페이징 객체를 생성한다.
	 * @param curPage	현재 페이지
	 * @param mNo		회원번호
	 * @return			페이징 정보 객체
	 */
	public Paging getMessagePaging(int curPage, int mNo);


	/**
	 * 회원이 참여중인 대화 목록을 조회한다.
	 * @param paging	페이징 정보 객체
	 * @param mNo		회원번호
	 * @return			대화 목록
	 */
	public List<HashMap<String, Object>> getChatList(Paging paging, int mNo);


	/**
	 * 대화의 최근 메시지 내용을 조회한다.
	 * @param chatNoList	채팅방 번호 리스트
	 * @return				최근 메시지
	 */
	public List<HashMap<String, Object>> getMessageList(List<Integer> chatNoList);


	/**
	 * 대화 상세 내용을 조회한다.
	 * @param crNo	채팅방 번호
	 * @return		대화 상세 내용
	 */
	public List<HashMap<String, Object>> getDetailMsg(int crNo);


	


}
