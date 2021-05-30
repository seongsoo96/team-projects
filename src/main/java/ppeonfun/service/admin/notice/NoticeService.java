package ppeonfun.service.admin.notice;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.util.Paging;

public interface NoticeService {

	/**
	 * 공지사항 목록에 적용할 페이징 정보를 얻어온다
	 * 
	 * @param cPage - 현재 페이지 정보
	 * @return 얻어온 현재 페이지 값을 기준으로 받은 paging정보 객체
	 */
	public Paging getPaging(int cPage, String category, String keyword);

	/**
	 * 관리자 로그인 -> 공지사항 관리 메뉴 클릭 시
	 * 바로 공지사항 리스트를 보여준다
	 * 
	 * @return 전체 공지사항 리스트
	 */
	public List<HashMap<String, Object>> getList(Paging paging);

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



}
