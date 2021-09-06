package ppeonfun.dao.admin.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.dto.Comments;
import ppeonfun.dto.Commentss;
import ppeonfun.dto.Recommend;

@Repository("admin.BoardDao")
public interface BoardDao {
	
	/**
	 * 해당 검색어가 포함된 총 공지사항 수 (없을 경우 전체 공지사항 수)
	 * 
	 * @param category - 사용자가 입력한 검색어
	 * @return
	 */
	public int selectCntAll(HashMap<String, String> map);

	/**
	 * 관리자 로그인 -> 공지사항 관리 메뉴 클릭 시
	 * 바로 공지사항 리스트를 보여준다
	 * 
	 * @return 전체 공지사항 리스트
	 */
	public List<HashMap<String, Object>> selectAll(HashMap<String, Object> map);
	
	/**
	 * 공지사항 리스트에서 추천수 탭을 누르면 추천수 정렬이 된다
	 * 
	 * @param map - 페이징, 검색기준, 검색어가 모두 들어있는 객체
	 * @return
	 */
	public List<HashMap<String, Object>> selectAllByArray(HashMap<String, Object> map);
	
	/**
	 * 신규 작성요청된 공지사항을 DB에 삽입한다
	 * 
	 * @param board - 신규 작성될 요청 제목, 내용이 들어있는 객체
	 */
	public void insertNotice(Board board);

	/**
	 * 바로 위 신규 작성된 공지사항의 첨부파일 정보를 저장한다
	 * 
	 * @param bf - 신규 공지사항의 다중 첨부파일 정보 객체
	 */
	public void insertBoardFiles(BoardFile bf);

	/**
	 * 게시글 상세보기 시 조회수를 1 증가시킨다
	 * 
	 * @param bNo - 조회수를 1 증가시킬 게시글의 번호
	 */
	public void updatebHit(int bNo);

	/**
	 * 게시판에서 제목 클릭 시 얻어온 게시글 번호 (bNo)로
	 * 해당 게시글의 모든 정보를 얻어온다 (상세보기)
	 * 
	 * @param bNo - 조회하고자 하는 게시글의 게시글 번호
	 * @return 게시글 번호가 일치하는 행의 모든 정보
	 */
	public HashMap<String, Object> selectByBoardno(int bNo);

	/**
	 * 공지사항 상세보기 시 보여줄 첨부파일 리스트를 얻어온다
	 * 
	 * @param bNo - 해당 글의 첨부파일 리스트를 얻어올 게시글 번호
	 * @return 게시글 번호가 일치하는 첨부파일들의 리스트
	 */
	public List<BoardFile> selectFilesByBoardno(int bNo);
	
	/**
	 * 해당 게시글의 총 추천수를 얻어온다
	 * 
	 * @param bNo - 추천수를 조회할 게시글 번호
	 * @return 게시글의 추천 수
	 */
	public int selectCntRecommend(int bNo);
	
	/**
	 * 상세보기에서 첨부파일 다운로드를 위해 파일번호로 해당 파일의 전체 데이터를 얻어온다
	 * 
	 * @param bfFileno - 조회할 파일의 파일번호
	 * @return 파일번호가 일치하는 파일 전체 정보
	 */
	public BoardFile selectBybfFileno(int bfFileno);

	/**
	 * 상세보기 -> 수정 클릭 시 해당 공지사항의 정보를 얻어온다
	 * 
	 * @param bNo - 수정할 공지사항의 글 번호
	 * @return 글 번호에 해당하는 공지사항의 전체 정보
	 */
	public Board selectOneByBoardno(int bNo);

	/**
	 * 수정된 공지사항을 기존의 데이터에 덮어씌운다
	 * 
	 * @param board - 수정된 제목과 내용을 담고있는 객체
	 */
	public void updateBoard(Board board);

	/**
	 * 공지사항 수정 시에 해당 글의 첨부파일을 삽입하기 전에 전부 삭제한다
	 * 
	 * @param board - 첨부파일을 삭제할 글 번호가 담겨있는 객체
	 */
	public void deleteBoardFiles(Board board);

	/**
	 * 상세보기에서 삭제버튼을 누르면 해당 공지사항을 삭제한다
	 * 
	 * @param bNo - 삭제할 공지사항의 글 번호
	 */
	public void deleteByBoardno(Board board);

	/**
	 * 로그인 한 회원이 해당 글을 이미 추천했는지 안했는지 확인
	 * Alt shift R
	 * 
	 * @param rec - 추천 여부를 확인하기 위한 회원 번호와 글 번호 정보
	 * @return 해당 회원이 해당 글을 추천했을 경우 1 반환, 안했을 경우 0 반환
	 */
	public int selectCntRec(Recommend rec);

	/**
	 * 로그인 한 회원이 해당 글을 추천하지 않았을 경우 
	 * Recommend 테이블에 해당 데이터를 삽입한다
	 * 
	 * @param rec - 해당 글의 글 번호와 로그인 한 회원 번호가 담긴 객체
	 */
	public void insertRec(Recommend rec);

	/**
	 * 로그인 한 회원이 해당 글을 이미 추천했을 경우
	 * Recommend 테이블에 해당 데이터를 삭제한다
	 * 
	 * @param res - 해당 글의 글 번호와 로그인 한 회원의 번호가 담긴 객체
	 */
	public void deleteRec(Recommend rec);

	/**
	 * 해당 게시글의 총 추천수를 조회한다
	 * 
	 * @param rec - 총 추천수를 조회하기 위한 글 번호를 가지고있는 객체
	 * @return 해당 게시글의 총 추천 수
	 */
	public int selectRecByBno(Recommend rec);

	/**
	 * 새로 작성한 댓글을 DB에 삽입한다
	 * 
	 * @param cmt - 새로 작성한 댓글 정보가 담겨있는 객체
	 */
	public void insertCmt(Comments cmts);
	
	/**
	 * 댓글 수정 폼을 열었다가 취소할 경우 기존의 데이터를 보여준다
	 * 
	 * @param cmts - 수정 취소 할 댓글 번호가 담겨있는 객체
	 * @return 댓글 번호가 일치하는 댓글의 모든 데이터
	 */
	public HashMap<String, Object> selectOneComments(Comments cmts);

	/**
	 * 해당 글의 모든 댓글을 불러온다
	 * 
	 * @param bNo - 조회한 글의 글 번호
	 * @return 글 번호에 해당하는 모든 댓글 리스트
	 */
	public List<HashMap<String, Object>> selectComments(int bNo);

	/**
	 * 댓글 내용을 수정하기 위해 입력폼을 출력할 때 기존의 정보를 보여준다 
	 * 
	 * @param cmt - 기존의 댓글 정보를 불러올 댓글 번호
	 * @return 댓글 번호가 일치하는 모든 정보를 얻어온다
	 */
	public HashMap<String, Object> selectCmt(Comments cmts);

	/**
	 * 댓글 리스트에서 수정한 본인의 댓글을 기존 정보에 덮어씌운다
	 * 
	 * @param cmt - 수정할 기준이 될 댓글 번호와 내용을 담고있는 객체
	 */
	public void updateCmt(Comments cmts);

	/**
	 * 해당 댓글을 삭제할 때 대댓글이 있다면 c_delete_state = N, 없다면 데이터 삭제를 하기 위해
	 * 대댓글의 존재여부를 확인한다
	 * 
	 * @param cmts - 댓글 번호를 가지고있는 객체
	 * @return 대댓글이 있을 경우 false, 없을 경우 true를 반환한다
	 */
	public int selectCntCmtss(Comments cmts);

	/**
	 * 해당 댓글 번호의 전체 정보를 삭제한다
	 * -> 댓글 번호에 해당하는 전체 데이터 중 c_delete_state 컬럼 값을 'N' 으로 바꿔서
	 * 삭제 상태로 바꾼다
	 * 
	 * @param cmt - 컬럼값을 바꿀 댓글의 댓글 번호를 담고있는 객체
	 */
	public void updateCmtForDelete(Comments cmts);

	/**
	 * 해당 댓글이 대댓글을 가지고 있지 않을 경우 해당 댓글 데이터를 삭제한다
	 * 
	 * @param cmts - 삭제할 댓글 번호를 가지고 있는 객체
	 */
	public void deleteCmt(Comments cmts);

	/**
	 * 해당 글이 갖고있는 댓글들에 달린 대댓글 리스트를 얻어온다
	 * 
	 * @param object 해당 댓글 번호(Object object)
	 * @return 댓글 번호에 해당하는 모든 대댓글 리스트
	 */
	public List<HashMap<String, Object>> selectAllCommentss(int bNo);

	/**
	 * "답글 쓰기" 버튼 클릭 후 입력한 내용을 DB에 삽입한다
	 * 
	 * @param cmtss - 새로 입력한 대댓글의 부모인 댓글 번호, 대댓글을 작성한 회원 번호, 
	 * 					대댓글 내용을 담고있는 객체
	 */
	public void insertCmtCmt(Commentss cmtss);

	/**
	 * 대댓글 수정한 후 수정된 대댓글 데이터를 출력하기 위해 요청한다
	 * 
	 * @param cmtss - 대댓글 번호가 담겨있는 객체
	 * @return 대댓글 번호가 일치하는 모든 데이터
	 */
	public Commentss selectOneCommentss(Commentss cmtss);
	
	/**
	 * 얻어온 대댓글 번호와 일치하는 대댓글 데이터를 삭제한다
	 * 
	 * @param csNo - 대댓글 번호를 담고있는 변수
	 */
	public void deleteCmtCmt(int csNo);
	
	/**
	 * 대댓글 수정 폼에서 입력한 내용을 기존 대댓글 데이터에 덮어씌운다
	 * 
	 * @param cmtss - 기준이 될 대댓글 번호와 수정한 내용을 담고있는 객체
	 */
	public void updateCmtCmt(Commentss cmtss);

	/**
	 * 게시글을 삭제할 때 PK와 FK로 연결되어있는 데이터를 먼저 삭제해야하기
	 * 때문에 해당 대댓글을 전부 삭제한다
	 * 
	 * @param board - 게시글 번호를 담고있는 객체
	 */
	public void deleteAllCommentssByBno(Board board);

	/**
	 * 글을 삭제할 때 해당 게시글 번호를 가진 모든 댓글을 삭제한다
	 * 
	 * @param board - 게시글 번호를 가지고있는 객체
	 */
	public void deleteAllCommentsByBno(Board board);

	/**
	 * 공지사항 상세보기에서 등록순 혹은 최신순을 누를때 마다 기준이 나뉘어서 오름차순, 내림차순
	 * 정렬이 된 댓글 리스트를 보여준다
	 * 
	 * @param bNo - 해당하는 정렬 기준이 적용된 댓글들의 글 번호
	 * @param standard - 정렬 분류를 할 기준 값
	 * @return standard의 값에 따라 정렬이 된 댓글 리스트
	 */
	public List<HashMap<String, Object>> selectCommentsListForArray(HashMap<String, Object> map);

	/**
	 * 공지사항 상세보기에서 등록순 혹은 최신순을 누를때 마다 기준이 나뉘어서 오름차순, 내림차순
	 * 정렬이 된 대댓글 리스트를 보여준다
	 * 
	 * @param bNo - 해당하는 정렬 기준이 적용된 대댓글을 갖고있는 댓글들의 글 번호
	 * @param standard - 정렬 분류를 할 기준 값
	 * @return standard의 값에 따라 정렬이 된 대댓글 리스트
	 */
	public List<HashMap<String, Object>> selectCommentssListForArray(HashMap<String, Object> map);

	public int selectCntCmts(int bNo);

	public int selectCntCmtssBybNo(int bNo);



}
