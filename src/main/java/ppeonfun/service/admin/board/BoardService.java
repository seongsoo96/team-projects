package ppeonfun.service.admin.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.util.Paging;

public interface BoardService {
	/**
	 * 공지사항 목록에 적용할 페이징 정보를 얻어온다
	 * 
	 * @param cPage - 현재 페이지 정보
	 * @return 얻어온 현재 페이지 값을 기준으로 받은 paging정보 객체
	 */
	public Paging getPaging(int cPage, String category, String search);

	/**
	 * 공지사항 리스트에서 추천수 탭을 누를 시 현재 상태에 따른 정렬방식을 얻어온다
	 * ( 추천수 기준 내림차순 정렬, 추천수 기준 오름차순 정렬 )
	 * 
	 * @param paging - 추천수가 적용된 리스트에 적용할 페이징 객체
	 * @param category - 검색 기준(제목+내용, 제목, 내용)
	 * @param search - 검색어
	 * @param orderby - 3가지 상태를 나타내는 값 
	 * ( 정렬 미적용: 1, 추천수 내림차순: 2, 추천수 오름차순: 3
	 * @return
	 */
	public List<HashMap<String, Object>> getArrayList(Paging paging, String category, String search, int orderby);

	/**
	 * 관리자 로그인 -> 공지사항 관리 메뉴 클릭 시
	 * 바로 공지사항 리스트를 보여준다
	 * 
	 * @return 전체 공지사항 리스트
	 */
	public List<HashMap<String, Object>> getList(Paging paging, String category, String search);

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
	 * 
	 * 
	 * @param bNo
	 * @return 
	 */
	public List<Integer> getRecommend(int bNo);

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



}
