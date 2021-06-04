package ppeonfun.controller.admin.notice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.dto.Comments;
import ppeonfun.dto.Recommend;
import ppeonfun.service.admin.notice.NoticeService;
import ppeonfun.util.Paging;


@Controller("admin.NoticeController")
@RequestMapping(value="/admin/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value="/list")
	public String list(
			@RequestParam(value="curPage", defaultValue="0") int cPage
			, @RequestParam(value="category", defaultValue="") String category
			, @RequestParam(value="search", defaultValue="") String search
			, Model model) {
//		logger.info("/admin/notice/list [GET] 요청 완료");
		logger.info("얻어온 category : {}", category);
		logger.info("얻어온 search : {}", search);
		
		//카테고리, 검색어 기반 페이징 적용 (없을 시 defaulValue로 전체 글 페이징 적용)
		Paging paging = noticeService.getPaging(cPage, category, search);
		
		logger.info("검색 후 paging값 확인 : {}", paging);
		
		//model값으로 paging객체 설정
		model.addAttribute("paging", paging);
		
		//공지사항 리스트 얻어오기
		List<HashMap<String, Object>> nlist = noticeService.getList(paging, category, search);
		
		//model값으로 공지사항 리스트 설정
		model.addAttribute("nlist", nlist);
		
		//viewName 설정
		return "admin/notice/noticeList";
	}
	
	@RequestMapping(value="/array")
	public String array(
			@RequestParam(value="curPage", defaultValue="0") int cPage
			, @RequestParam(value="category", defaultValue="") String category
			, @RequestParam(value="search", defaultValue="") String search
			, @RequestParam(value="orderby", defaultValue="true") boolean orderby
			, Model model) {
		Paging paging = noticeService.getPaging(cPage, category, search);
		model.addAttribute("paging", paging);
		
		logger.info("/admin/notice/array 에서 얻어온 orderby 값 : {}", orderby);
		
		// orderby를 클릭할 때마다 값을 true와 false 번갈아가게 하여
		// ASC와 DESC상태를 번갈아 보여준다
		if(orderby) {
			List<HashMap<String, Object>> alist = noticeService.getArrayList(paging, category, search, orderby);
			model.addAttribute("alist", alist);
			orderby = false;
			logger.info("/admin/notice/array 이후 orderby 값 : {}", orderby);
			model.addAttribute("orderby", orderby);
			
		} else if(!orderby){
			List<HashMap<String, Object>> alist = noticeService.getArrayList(paging, category, search, orderby);
			model.addAttribute("alist", alist);
			orderby = true;
			logger.info("/admin/notice/array 이후 orderby 값 : {}", orderby);
			model.addAttribute("orderby", orderby);
		}
		
		return "admin/notice/noticeArrayList";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeForm() {
//		logger.info("/admin/notice/write [GET] 요청 완료");
		
		//viewName writeForm.jsp 지정
		return "admin/notice/noticeWrite";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write( Board board, MultipartHttpServletRequest mtfRequest, HttpSession session, Model model) {
//		logger.info("/admin/notice/write [POST] 요청 완료");
		
		//얻어온 다중 파일 리스트에 담기 - 완료
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
		int mNo = (Integer)session.getAttribute("mNo");
		board.setmNo(mNo);
		
		//얻어온 값 확인 - 완료
		logger.info("얻어온 board값 확인 : {}", board);
		logger.info("얻어온 다중 파일 정보 확인 : {}", fileList);
		
		//글 쓰기 수행
		noticeService.write(board, fileList);
		
		return "redirect:/admin/notice/list";
	}
	
	@RequestMapping(value="/view")
	public String view(int bNo, HttpSession session, Model model) {
//		logger.info("/admin/notice/view [GET] 요청 완료");
//		logger.info("얻어온 게시글 번호 확인 : {}", bNo);
		
		//해당하는 게시글 번호의 모든 정보 가져오기
		HashMap<String, Object> viewBoard = noticeService.getView(bNo);
		
		//얻어온 게시글 정보 확인하기
//		logger.info("얻어온 게시글 정보 확인하기 : {}", viewBoard);
		
		//model값으로 게시글 정보 설정
		model.addAttribute("viewBoard", viewBoard);
		
		//첨부파일 리스트 얻어오기
		List<BoardFile> flist = noticeService.getFiles(bNo);
		
//		logger.info("얻어온 첨부파일 정보 확인하기 : {}", flist);
		
		//model값으로 첨부파일 정보 설정
		model.addAttribute("flist", flist);
		
		//해당 게시글의 추천수 얻어오기
		int rec = noticeService.getRecommend(bNo);
		
		//model값으로 추천수 정의
		model.addAttribute("rec", rec);
		
		//로그인 한 유저가 해당 글을 추천했는지 안했는지 확인
		int mNo = (int) session.getAttribute("mNo");
		Recommend recommend = new Recommend();
		recommend.setbNo(bNo);
		recommend.setmNo(mNo);
		boolean chkRec = noticeService.chkRecommended(recommend);
		
		//model값으로 추천여부 정의
		model.addAttribute("chkRec", chkRec);
		
		//해당 글의 댓글 불러오기
		List<Comments> clist = noticeService.getCommentList(bNo);
		
		//model값으로 댓글 정의
		model.addAttribute("clist", clist);
		
		//viewName 지정
		return "admin/notice/noticeView";
	}
	
	@RequestMapping(value="/download")
	public String download( 
			@RequestParam(value="fileno") int bfFileno
			, Model model ) {
		
		//특정 파일번호로 해당 파일의 전체 정보를 얻어온다
		BoardFile bf = noticeService.getFile(bfFileno);
		
		//model값으로 download할 파일정보 설정
		model.addAttribute("bf", bf);
		
		return "down";
	}
	
	@RequestMapping(value="/recommend")
	public String recommend (Recommend rec, HttpSession session, Model model) {
		int mNo = (int) session.getAttribute("mNo");
		rec.setmNo(mNo);
		
		//recommend 테이블에 값 넣기
		boolean checkRec = noticeService.checkRecommend(rec);
		
		logger.info("얻어온 checkRec의 값 : {}", checkRec);
		
		model.addAttribute("chkrec", checkRec);
		
		//해당 게시글의 총 추천수를 얻어와야 한다
		int totalRec = noticeService.getRecommend(rec);
		
		logger.info("해당 게시글의 총 조회수 : {}", totalRec);
		
		model.addAttribute("rec", totalRec);
		
		return "admin/notice/noticeRecResult";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updateForm( int bNo, Model model ) {
		//가져온 값 확인 - 완료
//		logger.info("얻어온 bNo값 확인 : {}", bNo);
		
		//얻어온 값으로 전체 공지사항 정보 얻어오기
		Board board = noticeService.getViewForUpdate(bNo);
		
		//얻어온 board 객체 정보 확인
//		logger.info("얻어온 board 전체 정보 확인 : {}", board);
		
		//model값으로 공지사항 객체 설정
		model.addAttribute("board", board);
		
		//해당 게시글의 첨부파일 불러오기
		List<BoardFile> flist = noticeService.getFiles(bNo);
		
		//model값으로 첨부파일 리스트 설정
		model.addAttribute("flist", flist);
		
		//viewName 설정
		return "admin/notice/noticeUpdate";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update( Board board, MultipartHttpServletRequest mtfRequest) {
		logger.info("얻어온 board객체 정보 확인 {}", board);
		
		//다중 첨부파일 리스트로 변환
		List<MultipartFile> flist = mtfRequest.getFiles("file");
		
		for( MultipartFile i : flist ) {
			logger.info("각각의 다중 첨부파일 정보 확인 {}", i);
		}
		
		//글 수정 메소드 호출
		noticeService.updateBoardAndFiles(board, flist);
		
		return "redirect:/admin/notice/list";
	}
	
	@RequestMapping(value="/delete")
	public String delete(Board board) {
//		logger.info("/admin/notice/delete 요청 완료");
		
		//해당 글 번호의 공지사항 삭제
		noticeService.deleteBoard(board);
		
		return "redirect:/admin/notice/list";
	}
	

	
}
