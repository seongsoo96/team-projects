package ppeonfun.service.user.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dao.user.board.BoardDao;
import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.dto.Comments;
import ppeonfun.dto.Commentss;
import ppeonfun.dto.Recommend;
import ppeonfun.service.user.main.MainServiceImpl;
import ppeonfun.util.Paging;

@Service("user.BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
 
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Autowired private BoardDao boardDao;
	
	@Autowired ServletContext context;

	@Override
	public Paging getPaging(Paging inDate) {
		logger.info("inDate 값 확인 : {}",inDate);
		//총 게시글 수 조회
		int totalCount = boardDao.selectCntAll(inDate);
		
		//페이징 계산
		Paging paging = new Paging(totalCount,inDate.getCurPage());
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> list(Paging paging) {
		return boardDao.selectPageList(paging);
	}

	@Override
	public HashMap<String, Object> view(Board board) {
		//조회수 증가,감소
		boardDao.hit(board);
		
		return boardDao.selectView(board);
	}

	@Override
	public BoardFile viewfile(Board board) {
		return boardDao.selectviewfile(board);
	}
	@Override
	public void insertfile(Board board, MultipartFile fileupload) {
		
		//제목 입력 안하고 등록했을 때 설정
		if("".equals(board.getbTitle())) {
			board.setbTitle("(제목없음)");
		}
		
		boardDao.insertAll(board);
		
		if( fileupload.getSize() <=0 ) {
			   logger.info("파일의 크기가0, 처리중단");
			   return;
		   }
		//파일이 저장될 경로(real path)
		   String storedPath = context.getRealPath("/resources/upload");
		   logger.info("realPath upload : {}",storedPath);
		   //폴더가 존재하지 않으면 생성하기
		   File stored = new File(storedPath);
		   if(!stored.exists()) {
			   stored.mkdir();
		   }
		   
		   //저장될 파일의 이름 생성하기
		   String filename = fileupload.getOriginalFilename(); //원본 파일명
		   
		   //UUID값 생성
		   String uid = UUID.randomUUID().toString().split("-")[4];
		   logger.info(uid);
		   
		   String fileup = fileupload.getOriginalFilename(); //기본 파일명
		   //원본파일이름에 UUID추가하기 ( 파일명이 중복되지않도록 설정)
		   fileup += uid;
		   logger.info(filename);
		   
		   //저장될 파일 정보 객체
		   File dest = new File(stored, fileup);
		   
		   try {
			//업로드된 파일을 저장하기
			   fileupload.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}   
		   logger.info("filename: {}" , filename);
		   
		   
		   
		   BoardFile filelist = new BoardFile();
		   filelist.setbNo( board.getbNo() );
		   filelist.setBfOriginName(filename);
		   filelist.setBfStoredName(fileup);
		   filelist.setBfContentType(fileupload.getContentType());
		  
		   boardDao.insertFile(filelist);
		   
	}
	@Override
	public BoardFile getFile(BoardFile boardfile) {
		return boardDao.selectByFileno(boardfile);
	}

	@Override
	public HashMap<String, Object> updateByview(Board board) {
		return boardDao.selectUpdate(board);
	}

	@Override
	public HashMap<String, Object> updateByfile(BoardFile boardfile, MultipartFile fileupload) {
		logger.info("수정된 파일 {}",boardfile );
		
		return boardDao.selectByBoardno(boardfile);
	}

	@Override
	public void update(Board board, MultipartFile fileupload, boolean isfile) {
		
		boardDao.update(board);
		
		if(!isfile) {
			 //파일 삭제
			boardDao.filedelete(board);
			
		}
		//파일처리
		if( fileupload.getSize() <=0 ) {
			logger.info("파일의 크기가0, 처리중단");
			return;
		}
		
		
		//파일이 저장될 경로(real path)
		   String storedPath = context.getRealPath("/resources/upload");
		   logger.info("realPath upload : {}",storedPath);
		   //폴더가 존재하지 않으면 생성하기
		   File stored = new File(storedPath);
		   if(!stored.exists()) {
			   stored.mkdir();
		   }
		   
		   //저장될 파일의 이름 생성하기
		   String filename = fileupload.getOriginalFilename(); //원본 파일명
		   
		   //UUID값 생성
		   String uid = UUID.randomUUID().toString().split("-")[4];
		   logger.info(uid);
		   
		   String fileup = fileupload.getOriginalFilename(); //기본 파일명
		   //원본파일이름에 UUID추가하기 ( 파일명이 중복되지않도록 설정)
		   fileup += uid;
		   logger.info(filename);
		   
		   //저장될 파일 정보 객체
		   File dest = new File(stored, fileup);
		   
		   try {
			//업로드된 파일을 저장하기
			   fileupload.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}   
		   BoardFile filelist = new BoardFile();
		   filelist.setbNo( board.getbNo() );
		   filelist.setBfOriginName(filename);
		   filelist.setBfStoredName(fileup);
		   filelist.setBfContentType(fileupload.getContentType());  
		   
		   boardDao.insertfile(filelist);
	}
	@Override
	public void delete(Board board) {
		boardDao.delete(board);
	}

	@Override
	public void deletefile(Board boarde) {
		boardDao.deletefile(boarde);
	}

	@Override
	public boolean isrecommend(Recommend recommend) {
		
		int cnt = boardDao.selectCntRecommend(recommend);
		
		if(cnt>0) {//추천했음
			  return true;
		}else {//추천하지 않았을 때 
			return false;
		}
	}

	@Override
	public int getTotalCntRecommend(Recommend recommend) {
		return boardDao.selectTotalCntRecommend(recommend);
	}

	@Override
	public boolean recommend(Recommend recommend) {
		if(isrecommend(recommend)) {//추천한 상태
			boardDao.deleteRecommend(recommend);
			
			return false;
		}else {//추천하지 않은 상태
			boardDao.insertRecommend(recommend);
			
			return true;
		}
	}

	@Override
	public List<HashMap<String, Object>> getCommentList(Board board) {
		
		logger.info("board객체에 내용 확인 : {}",board);
		return boardDao.selectBycomment(board);
	}

	@Override
	public void insertComments(Comments comments) {
		boardDao.insertComments(comments);
	}

	@Override
	public boolean deleteComments(Comments comments) {
		boardDao.deleteComments(comments);
		
		if(boardDao.countCommnets(comments)>0) {
			return false;
		}else {
			return true;
		}
	}


	@Override
	public 	List<HashMap<String, Object>> getCommentlist(Comments comments) {
		return boardDao.selectcmtlist(comments);
	}

	

	@Override
	public void updateComment(Comments comments) {
		boardDao.commentUpdate(comments);
	}

	@Override
	public List<HashMap<String, Object>> getupdatecommentlist(Comments comments) {
		return boardDao.selectupdatecommentlist(comments);
	}

//	@Override
//	public List<HashMap<String, Object>> getCommentssList(Board board) {
//		return boardDao.selectCommentsslist(board);
//	}

	@Override
	public List<Integer> getCommentssList(Board board) {
		return boardDao.selectCommentsslist(board);
	}
	@Override
	public List<HashMap<String, Object>> getcommentNolist(List<Integer> commentsslistbno) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", commentsslistbno);
		
		logger.info("@#@#@#@#@#@#@# {}",commentsslistbno);
		
//		for(int i=0; i<commentsslistbno.size(); i++) {
//			
//			HashMap<String, Object> element= (HashMap<String, Object>) iter.next();
//			logger.info("element조회 : {}",element);
//		}
		
		return boardDao.selectCommentCno(commentsslistbno);
	}

	@Override
	public void insertCommentsS(Commentss commentss) {
		boardDao.commentssinsert(commentss);
		
	}

	@Override
	public boolean deleteCommentss(Commentss commentss) {
		
		boardDao.commentssDelete(commentss);
		
		if(boardDao.countCommnetss(commentss)>0) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void updateCommentss(Commentss commentss) {
		boardDao.commentssUpdate(commentss);
	} 









}
