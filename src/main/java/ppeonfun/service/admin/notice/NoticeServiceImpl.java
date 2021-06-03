package ppeonfun.service.admin.notice;

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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dao.admin.notice.NoticeDao;
import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.util.Paging;

@Service("admin.NoticeService")
public class NoticeServiceImpl implements NoticeService {
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);

	@Autowired
	NoticeDao noticeDao;
	
	@Autowired
	ServletContext context;
	
	@Override
	public Paging getPaging(int cPage, String category, String search) {

		int curPage = 0;
		if(cPage != 0) {
			curPage = cPage;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("search", search);
		
		int totalCount = noticeDao.selectCntAll(map);
		
//		logger.info("검색기준과 검색어를 활용해 얻어온 총 공지사항 수 : {}", totalCount);
			
		Paging paging = new Paging(totalCount, curPage);
			
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> getList(Paging paging, String category, String search) {
		//연결 확인
//		logger.info("/admin/notice/list NoticeServiceImpl 요청 완료");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("category", category);
		map.put("search", search);
		
		//전체 공지사항 목록 가져오기
		List<HashMap<String, Object>> nlist = noticeDao.selectAll(map);
		
		return nlist;
	}

	@Override
	@Transactional
	public void write(Board board, List<MultipartFile> fileList) {
		//글쓰기 수행
		noticeDao.insertNotice(board);
		
		//글쓰기 수행 후 신규 공지사항의 bNo값 얻어오기
//		logger.info("신규 공지사항 작성 후 board 객체 값 : {}", board);
		
		//첨부파일 저장 수행
		String storedPath = context.getRealPath("resources/upload");
		
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		for( MultipartFile file : fileList ) {
			
			if( file.getSize() <= 0 ) {
				return;
			}
				
			String filename = file.getOriginalFilename();
				
			String uid = UUID.randomUUID().toString().split("-")[4];
			
			filename += uid;
			
			File dest = new File( stored, filename );
				
			try {
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
				
			BoardFile bf = new BoardFile();
			bf.setbNo(board.getbNo());
			bf.setBfOriginName(file.getOriginalFilename());
			bf.setBfStoredName( filename );
			bf.setBfSize((int) file.getSize());
			bf.setBfContentType(file.getContentType());
			
			
			noticeDao.insertBoardFiles( bf );
		
		} // for문 end (다중 첨부파일)
		
	} // write method end

	@Override
	@Transactional
	public HashMap<String, Object> getView(int bNo) {
		//상세보기시 조회수 1 증가시키기
		noticeDao.updatebHit(bNo);
		//게시글 전체 정보 얻어오기
		return noticeDao.selectByBoardno(bNo);
	}

	@Override
	public List<BoardFile> getFiles(int bNo) {
		return noticeDao.selectFilesByBoardno(bNo);
	}

	@Override
	public BoardFile getFile(int bfFileno) {
		return noticeDao.selectBybfFileno(bfFileno);
	}
	
	@Override
	public Board getViewForUpdate(int bNo) {
		return noticeDao.selectOneByBoardno(bNo);
	}

	@Override
	@Transactional
	public void updateBoardAndFiles(Board board, List<MultipartFile> flist) {
		//글 수정 메소드 호출
		noticeDao.updateBoard(board);
		
		String storedPath = context.getRealPath("resources/upload");
		
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		for( MultipartFile file : flist ) {
			
			if( file.getSize() <= 0 ) {
				return;
			}

			noticeDao.deleteBoardFiles(board);
				
			String filename = file.getOriginalFilename();
				
			String uid = UUID.randomUUID().toString().split("-")[4];
			
			filename += uid;
			
			File dest = new File( stored, filename );
				
			try {
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
				
			BoardFile bf = new BoardFile();
			bf.setbNo(board.getbNo());
			bf.setBfOriginName(file.getOriginalFilename());
			bf.setBfStoredName( filename );
			bf.setBfSize((int) file.getSize());
			bf.setBfContentType(file.getContentType());
			
			
			noticeDao.insertBoardFiles( bf );
		
		} // for문 end
		
	} // updateBoardAndFiles end

	@Override
	public void deleteBoard(Board board) {
		//해당 공지사항 삭제하기 전에 첨부파일 삭제
		noticeDao.deleteBoardFiles(board);
		
		//해당 공지사항 삭제
		noticeDao.deleteByBoardno(board);
	}

} // Class end
