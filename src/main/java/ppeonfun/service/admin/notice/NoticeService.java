package ppeonfun.service.admin.notice;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.dto.Comments;
import ppeonfun.dto.Recommend;
import ppeonfun.util.Paging;

public interface NoticeService {

	/**
	 * 공지사항 목록에 적용할 페이징 정보를 얻어온다
	 * 
	 * @param cPage - 현재 페이지 정보
	 * @return 얻어온 현재 페이지 값을 기준으로 받은 paging정보 객체
	 */
	public Paging getPaging(int cPage, String category, String search);

	/**
	 * 관리자 로그인 -> 공지사항 관리 메뉴 클릭 시
	 * 바로 공지사항 리스트를 보여준다
	 * 
	 * @return 전체 공지사항 리스트
	 */
	public List<HashMap<String, Object>> getList(Paging paging, String category, String search);

	/**
	 * 공지사항 목록에서 추천수를 누르면 추천수 정렬이 된 리스트를 보여준다
	 * 
	 * @param paging - 페이지네이션에 적용할 페이징 객체
	 * @param category - 검색기준( 제목+내용, 제목, 내용 )
	 * @param search - 검색어
	 * @return
	 */
	public List<HashMap<String, Object>> getArrayList(Paging paging, String category, String search, int orderby);

	/**
	 * 
	 * 
	 * @param board
	 * @param fileList
	 */
	public void write(Board board, List<MultipartFile> fileList);

	/**
	 * 게시판에서 제목 클릭 시 얻어온 게시글 번호 (bNo)로
	 * 해당 게시글의 모든 정보를 얻어온다 (상세보기)
	 * 
	 * @param bNo - 조회하고자 하는 게시글의 게시글 번호
	 * @return 게시글 번호가 일치하는 행의 모든 정보
	 */
	public HashMap<String, Object> getView(int bNo);

	/**
	 * 공지사항 상세보기 시 보여줄 첨부파일 리스트를 얻어온다
	 * 
	 * @param bNo - 해당 글의 첨부파일 리스트를 얻어올 게시글 번호
	 * @return 게시글 번호가 일치하는 첨부파일들의 리스트
	 */
	public List<BoardFile> getFiles(int bNo);

	/**
	 * 해당 게시글의 총 추천수를 얻어온다
	 * 
	 * @param bNo - 추천수를 조회할 게시글 번호
	 * @return 게시글의 추천 수
	 */
	public int getRecommend(int bNo);
	
	/**
	 * 상세보기에서 첨부파일 다운로드를 위해 파일번호로 해당 파일의 전체 데이터를 얻어온다
	 * 
	 * @param bfFileno - 조회할 파일의 파일번호
	 * @return 파일번호가 일치하는 파일 전체 정보
	 */
	public BoardFile getFile(int bfFileno);
	
	/**
	 * 상세보기 -> 수정 클릭 시 해당 공지사항의 정보를 얻어온다
	 * 
	 * @param bNo - 수정할 공지사항의 글 번호
	 * @return 글 번호에 해당하는 공지사항의 전체 정보
	 */
	public Board getViewForUpdate(int bNo);

	/**
	 * 공지사항 수정 페이지에서 입력된 값들을 기존의 데이터에 덮어씌운다
	 * 
	 * @param board - 수정된 제목과 내용이 담겨있는 객체
	 * @param mtfRequest - 수정된 다중 첨부파일이 담겨있는 객체
	 */
	public void updateBoardAndFiles(Board board, List<MultipartFile> flist);

	/**
	 * 상세보기에서 삭제 클릭 시 해당 공지사항을 삭제한다
	 * 
	 * @param bNo - 삭제할 글 번호
	 */
	public void deleteBoard(Board board);

	/**
	 * 해당 회원이 해당 글을 추천했는지 안했는지 알아온다
	 * 
	 * @param rec - recommend 테이블에서 조회할 회원 번호와 게시글 번호
	 * @return 있을 경우 true, 없을 경우 false
	 */
	public boolean checkRecommend(Recommend rec);

	/**
	 * 해당 게시글의 총 추천수를 조회한다
	 * 
	 * @param rec - 총 추천수를 조회하기 위한 글 번호를 가지고있는 객체
	 * @return 해당 게시글의 총 추천 수
	 */
	public int getRecommend(Recommend rec);

	/**
	 * 새로 작성한 댓글을 DB에 삽입한다
	 * 
	 * @param cmt - 새로 작성한 댓글 정보가 담겨있는 객체
	 */
	public void writeCmt(Comments cmt);
	
	/**
	 * 로그인 한 회원이 해당 글을 추천했는지 안했는지 여부를 알아온다
	 * 
	 * @param recommend - 해당 글 번호와 로그인한 회원의 회원 번호
	 * @return 해당 글을 추천했을 경우 true, 아닐 경우 false
	 */
	public boolean chkRecommended(Recommend recommend);

	/**
	 * 해당 글의 모든 댓글을 불러온다
	 * 
	 * @param bNo - 조회한 글의 글 번호
	 * @return 글 번호에 해당하는 모든 댓글 리스트
	 */
	public List<HashMap<String, Object>> getCommentList(int bNo);

	/**
	 * 댓글 내용을 수정하기 위해 입력폼을 출력할 때 기존의 정보를 보여준다 
	 * 
	 * @param cmt - 기존의 댓글 정보를 불러올 댓글 번호
	 * @return 댓글 번호가 일치하는 모든 정보를 얻어온다
	 */
	public HashMap<String, Object> getCommentForUpdate(Comments cmt);

	/**
	 * 댓글 리스트에서 수정한 본인의 댓글을 기존 정보에 덮어씌운다
	 * 
	 * @param cmt - 수정할 기준이 될 댓글 번호와 내용을 담고있는 객체
	 */
	public void updateCmt(Comments cmt);

	/**
	 * 해당 댓글 번호의 전체 정보를 삭제한다
	 * 
	 * @param cmt - 삭제할 댓글의 댓글 번호를 담고있는 객체
	 */
	public void deleteCmt(Comments cmt);

}
