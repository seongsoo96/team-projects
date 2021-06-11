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
import ppeonfun.dto.Comments;
import ppeonfun.dto.Commentss;
import ppeonfun.dto.Recommend;
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
		
		logger.info("검색기준과 검색어를 활용해 얻어온 총 공지사항 수 : {}", totalCount);
			
		Paging paging = new Paging(totalCount, curPage);
			
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> getList(Paging paging, String category, String search) {
		//연결 확인
		logger.info("/admin/notice/list NoticeServiceImpl 요청 완료");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("category", category);
		map.put("search", search);
		
		//전체 공지사항 목록 가져오기
		List<HashMap<String, Object>> nlist = noticeDao.selectAll(map);
		
		return nlist;
	}
	
	@Override
	public List<HashMap<String, Object>> getArrayList(Paging paging, String category, String search, int orderby) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("category", category);
		map.put("search", search);
		map.put("orderby", orderby);
		
		//전체 공지사항 목록 가져오기
		List<HashMap<String, Object>> alist = noticeDao.selectAllByArray(map);
		
		return alist;
	}

	@Override
	@Transactional
	public void write(Board board, List<MultipartFile> fileList) {
		//글쓰기 수행
		noticeDao.insertNotice(board);
		
		//글쓰기 수행 후 신규 공지사항의 bNo값 얻어오기
		logger.info("신규 공지사항 작성 후 board 객체 값 : {}", board);
		
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
	public int getRecommend(int bNo) {
		return noticeDao.selectCntRecommend(bNo);
	}

	@Override
	public BoardFile getFile(int bfFileno) {
		return noticeDao.selectBybfFileno(bfFileno);
	}
	
	@Override
	public boolean checkRecommend(Recommend rec) {
		int res = noticeDao.selectCntRec(rec);
		if( res == 1 ) {
			noticeDao.deleteRec(rec);
			return true;
		} else {
			noticeDao.insertRec(rec);
			return false;
		}
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
	@Transactional
	public void deleteBoard(Board board) {
		//해당 공지사항의 대댓글 삭제
		noticeDao.deleteAllCommentssByBno(board);
		
		//해당 공지사항의 댓글 삭제
		noticeDao.deleteAllCommentsByBno(board);
		
		//해당 공지사항 삭제하기 전에 첨부파일 삭제
		noticeDao.deleteBoardFiles(board);
		
		//해당 공지사항 삭제
		noticeDao.deleteByBoardno(board);
	}

	@Override
	public int getRecommend(Recommend rec) {
		return noticeDao.selectRecByBno(rec);
	}
	
	@Override
	public void writeCmt(Comments cmts) {
		noticeDao.insertCmt(cmts);
	}

	@Override
	public boolean chkRecommended(Recommend recommend) {
		int res = noticeDao.selectCntRec(recommend);
		if( res == 1 ) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public HashMap<String, Object> getComments(Comments cmts) {
		return noticeDao.selectOneComments(cmts);
	}

	@Override
	public List<HashMap<String, Object>> getCommentsList(int bNo) {
		return noticeDao.selectComments(bNo);
	}

	@Override
	public List<HashMap<String, Object>> getCommentssList(int bNo) {
		//여기서 for-each문 돌려서 해당 댓글 하나하나의 댓글번호로 대댓글 리스트 얻어오기
		List<HashMap<String, Object>> cclist = noticeDao.selectAllCommentss(bNo);
		
		logger.info("조회값으로 넣은 모든 댓글에 해당하는 모든 대댓글 리스트 : {}", cclist);
		
		return cclist;
	}

	@Override
	public HashMap<String, Object> getCommentForUpdate(Comments cmts) {
		return noticeDao.selectCmt(cmts);
	}

	@Override
	public void updateCmt(Comments cmts) {
		noticeDao.updateCmt(cmts);
	}

	@Override
	public void deleteCmt(Comments cmts) {
		//해당 댓글번호를 가지고있는 대댓글의 수를 조회한다
		int res = noticeDao.selectCntCmtss(cmts);
		
		if( res == 0 ) {
			//해당 댓글이 대댓글을 가지고 있지 않을 경우 댓글 자체를 삭제한다
			noticeDao.deleteCmt(cmts);
		}
		//해당 댓글이 대댓글을 가지고 있을 경우 c_delete_state = N 으로 변경한다
		noticeDao.updateCmtForDelete(cmts);
	}

	@Override
	public void writeCmtCmt(Commentss cmtss) {
		noticeDao.insertCmtCmt(cmtss);
	}
	
	@Override
	public void updateCmtCmt(Commentss cmtss) {
		noticeDao.updateCmtCmt(cmtss);
	}

	@Override
	public Commentss getOneCommentss(Commentss cmtss) {
		return noticeDao.selectOneCommentss(cmtss);
	}

	@Override
	public void deleteCmtCmt(int csNo) {
		noticeDao.deleteCmtCmt(csNo);
	}

	@Override
	public List<HashMap<String, Object>> getCommentsListForArray(int bNo, String standard) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("bNo", bNo);
		map.put("standard", standard);
		return noticeDao.selectCommentsListForArray(map);
	}


} // Class end
