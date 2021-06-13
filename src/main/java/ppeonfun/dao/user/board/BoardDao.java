package ppeonfun.dao.user.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.dto.Comments;
import ppeonfun.dto.Commentss;
import ppeonfun.dto.Member;
import ppeonfun.dto.Recommend;
import ppeonfun.util.Paging;


@Repository("user.BoardDao")
public interface BoardDao {
    /** 전체 게시글 수 
     *  
     * @return 계산된 페이징 
     */
	public int selectCntAll(Paging inDate);
	/** 페이징이 적용된 게시글 보여주기
	 * 
	 * @param paging - 페이징이 적용된 게시글
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<HashMap<String, Object>> selectPageList(Paging paging);
	/** 게시판 상세보기
	 * 
	 * @param board bNo로 가진 board
	 * @return 
	 */
	public HashMap<String, Object> selectView( Board board);
	/** 첨부파일을 포함한 게시판 상세보기
	 * 
	 * @param board -board dto를 가진 객체
	 * @return boardfile을 포함한 조회된 파일 객체
	 */
	public BoardFile selectviewfile(Board board);
	/** 게시판 조회수 보여주기 
	 * 
	 * @param board 조회수 증가,감소가 적용된 board
	 */
	public void hit(Board board);
	/**  글쓰기 등록
	 * 
	 * @param board 제목,내용을 포함한 board
	 */
	public void insertAll(Board board);
	/** 파일업로드가 포함된 글쓰기 등록
	 * 
	 * @param filelist boardno,fileup,filename을포함한 파일리스트
	 */
	public void insertFile(BoardFile filelist);
	/** fileno을 이용한 파일 조회
	 * 
	 * @param boardfile - 조회할 파일 번호
	 * @return - 조회된 파일 정보 객체
	 */
	public BoardFile selectByFileno(BoardFile boardfile);

	/** 수정 내용 보여주기
	 * 
	 * @param board -boardno를 가진 객체
	 * @return
	 */
	public HashMap<String, Object> selectUpdate(Board board);
	/** boardno를 이용한 첨부파일 조회
	 * 
	 * @param boardfile - 조회할 게시글 번호
	 * @return 조회된 파일정보 객체
	 */
	public HashMap<String, Object> selectByBoardno(BoardFile boardfile);
	
	public void update(Board board);
	
	public void filedelete(Board board);
	
	public void insertfile(BoardFile filelist);
	
	public void delete(Board board);
	
	public void deletefile(Board board);
	
	public int selectCntRecommend(Recommend recommend);
	
	public int selectTotalCntRecommend(Recommend recommend);
	
	public void deleteRecommend(Recommend recommend);
	
	public void insertRecommend(Recommend recommend);
	
	public List<HashMap<String, Object>> selectBycomment(Board board);
	
	public void insertComments(Comments comments);
	
	public void deleteComments(Comments comments);
	
	public int countCommnets(Comments comments);
	
	public List<Comments> selectComments(int bNo);
	
	public 	List<HashMap<String, Object>> selectcmtlist(Comments comments);
	
	public void commentUpdate(Comments comments);
	
	public List<HashMap<String, Object>> selectupdatecommentlist(Comments comments);
	
//	public List<HashMap<String, Object>> selectCommentsslist(Board board);
	
	public List<HashMap<String, Object>> selectCommentCno(List<Integer> commentsslistbno);
	
	public List<Integer> selectCommentsslist(Board board);
	
	public void commentssinsert(Commentss commentss);
	
	public void commentssDelete(Commentss commentss);
	
	public int countCommnetss(Commentss commentss);
	
	public void commentssUpdate(Commentss commentss);
	
	
}
