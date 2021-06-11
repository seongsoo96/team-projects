package ppeonfun.dao.admin.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;

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
	 * orderby 상태에 따라 추천수 정렬을 오름차순, 내림차순 상태로 나눠서 받아온다
	 * 
	 * @param map - 페이징, 검색 기준, 검색어, orderby 기준이 담겨있는 객체
	 * @return orderby에 따라 추천수 정렬을 오름차순/내림차순으로 구분하여 받아온 게시글 목록
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



}
