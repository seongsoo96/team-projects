package ppeonfun.service.user.board;

import java.io.File; 
import java.io.IOException;
import java.util.HashMap;
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
		//총 게시글 수 조회
		int totalCount = boardDao.selectCntAll();
		
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
		   String storedPath = context.getRealPath("upload");
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
		   String storedPath = context.getRealPath("upload");
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




}
