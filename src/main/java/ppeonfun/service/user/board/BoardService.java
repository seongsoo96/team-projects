package ppeonfun.service.user.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.dto.Member;
import ppeonfun.dto.Recommend;
import ppeonfun.util.Paging;

public interface BoardService {
   /** 게시글 목록을 위한 페이징 객체
    * 
    * @param inDate  현재 페이지를 저장하고 있는 paging객체
    * @return 페이징 계산이 완료된 paging 객체
    */
	public Paging getPaging(Paging inDate);
	/** 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징이 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
//	public List<Board> list(Paging paging);
	
	public List<HashMap<String, Object>> list(Paging paging);
	/** 게시판 보여주기
	 * 
	 * @param board -bNo가 포함된 board
	 * @return 
	 */
	public HashMap<String, Object> view(Board board);
	
	public BoardFile viewfile(Board board);
    /**  파일업로드를 첨부한 파일 
     * 
     * @param board boardno를 가진 객체
     * @param fileupload 파일업로드에 필요한 정보를 가진 객체
     */
    public void insertfile(Board board, MultipartFile fileupload);
    /** 파일번호를 이용하여 업로드된 파일 정보 조회
     * @param boardfile 파일번호,다운로드시켜줄 파일 번호
     * @return 조회된 파일정보객체
     */
    public BoardFile getFile(BoardFile boardfile);
    /** 게시글 +첨부파일 처리
     * ㄴ
     * @param board boardno를 가진 객체
     * @return 
     */
    public HashMap<String, Object> updateByview(Board board);
    /**  게시글 번호를 이용하여 업로드된 파일의 정보 조회
     * 
     * @param boardfile 게시글번호를 가진 dto
     * @return 조회된 파일 정보 객체
     */
    public HashMap<String, Object> updateByfile(BoardFile boardfile,MultipartFile fileupload);
    
    public void update(Board board, MultipartFile fileupload, boolean isfile);
    /** board list에 값 지우기
     * 
     * @param board -dto 객체
     */
    public void delete(Board board);
    /** 업로드된 파일 지우기
     * 
     * @param board - boardfile값을 포함한 board
     */
    public void deletefile(Board board);
    /** 추천수 상태 확인
     * 
     * @param recommend - bNo,mNo을 가진 recommend
     * @return true-추천 상태 , false - 비추천 상태 
     */
	public boolean isrecommend(Recommend recommend);
	/** 총 게시글 추천 수
	 * 
	 * @param recommend  bNo,mNo을 가진 recommend
	 * @return 총 추천수
	 */
	public int getTotalCntRecommend(Recommend recommend);
	/** 추천상태 확인 후 토글 넣고 빼는 작업
	 * 
	 * @param recommend -추천 대상 정보
	 * @return true-추천 false-추천 취소
	 */
	public boolean recommend(Recommend recommend);
}
