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
			, @RequestParam(value="keyword", defaultValue="") String keyword
			, Model model) {
//		logger.info("/admin/notice/list [GET] 요청 완료");
		
		//카테고리, 검색어 기반 페이징 적용 (없을 시 defaulValue로 전체 글 페이징 적용)
		Paging paging = noticeService.getPaging(cPage, category, keyword);
		
		//model값으로 paging객체 설정
		model.addAttribute("paging", paging);
		
		//공지사항 리스트 얻어오기
		List<HashMap<String, Object>> nlist = noticeService.getList(paging);
		
		//model값으로 공지사항 리스트 설정
		model.addAttribute("nlist", nlist);
		
		//viewName 설정
		return "admin/notice/noticeList";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeForm() {
//		logger.info("/admin/notice/write [GET] 요청 완료");
		
		//viewName writeForm.jsp 지정
		return "admin/notice/noticeWrite";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Board board, MultipartHttpServletRequest mtfRequest, HttpSession session, Model model) {
//		logger.info("/admin/notice/write [POST] 요청 완료");
		
		//얻어온 다중 파일 리스트에 담기 - 완료
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
		int mNo = (Integer)session.getAttribute("mNo");
		board.setmNo(mNo);
		
		//얻어온 값 확인 - 완료
//		logger.info("얻어온 board값 확인 : {}", board);
//		logger.info("얻어온 다중 파일 정보 확인 : {}", fileList);
		
		//글 쓰기 수행
		noticeService.write(board, fileList);
		
		return "redirect:/admin/notice/view";
	}
	
	@RequestMapping(value="/view")
	public String view(int bNo, Model model) {
//		logger.info("/admin/notice/view [GET] 요청 완료");
		logger.info("얻어온 게시글 번호 확인 : {}", bNo);
		
		//해당하는 게시글 번호의 모든 정보 가져오기
		HashMap<String, Object> viewBoard = noticeService.getView(bNo);
		
		//얻어온 게시글 정보 확인하기
		logger.info("얻어온 게시글 정보 확인하기 : {}", viewBoard);
		
		//model값으로 게시글 정보 설정
		model.addAttribute("viewBoard", viewBoard);
		
		//첨부파일 리스트 얻어오기
		List<BoardFile> flist = noticeService.getFiles(bNo);
		
		logger.info("얻어온 첨부파일 정보 확인하기 : {}", flist);
		
		//model값으로 첨부파일 정보 설정
		model.addAttribute("flist", flist);
		
		//viewName 지정
		return "admin/notice/noticeView";
	}
	
	
	
	
}
