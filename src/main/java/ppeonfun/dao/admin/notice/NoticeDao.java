package ppeonfun.dao.admin.notice;

import java.util.HashMap;
import java.util.List;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.util.Paging;

public interface NoticeDao {

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
	public List<HashMap<String, Object>> selectAll(Paging paging);

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
	public void insertBoardFile(BoardFile bf);

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




}
