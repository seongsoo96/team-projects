package ppeonfun.controller.user.board;

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
import org.springframework.web.servlet.ModelAndView;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.dto.Recommend;
import ppeonfun.service.user.board.BoardService;
import ppeonfun.util.Paging;

@Controller("user.BoardController")
@RequestMapping("/user/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired private BoardService boardService;
	
	@RequestMapping(value="/list")
	public void list(Paging inDate, Model model ) {
		logger.info("/board/list [GET]");
		
		//페이징 계산
		Paging paging = boardService.getPaging(inDate);
		logger.info("페이징 계산 : {}", paging.toString());
		
	    //해시맵으로 게시글 목록 조회
	    List <HashMap<String, Object>> list = boardService.list(paging);
	   
	    logger.info("게시긂 목록 조회 확인  {} :" ,list);
		//게시글 목록 조회
//		List<Board> list = boardService.list(paging);
//		for(int i=0; i<list.size(); i++) {
//			logger.info("게시글 목록 조회 : {}",list.get(i).toString());
//		}
		
		//모델값 전달
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	@RequestMapping(value="/view")
    public void view(Board board, Model model,Recommend recommend, HttpSession session) {
    	logger.info("/baord/view [GET]");
    	logger.info("게시판에 포함된 key,value값 확인 : {}",board );
    	
    	
    	//상세 보여주기
    	HashMap<String, Object> detail = boardService.view(board);
    	logger.info("detail에 포함된 값 보기 : {}", detail);
    	logger.info("board에포함된 값 보기 : {}" , board);
    	
    	//게시글 첨부파일 전달
    	BoardFile viewfile =  boardService.viewfile(board);
    	logger.info("viewfile에 포함된 값 보기 : {}", viewfile);
    	
    	
    	//추천수 보여주기
//    	recommend.getbNo();
//    	logger.info("recommed안에 값 확인 : {}", recommend);
    	
    	//추천 상태 조회
//    	recommend.setmNo( (Integer) session.getAttribute("mNo"));
//    	logger.info("recommed안에 값 확인 : {}", recommend);
    	
    	//추천 상태 전달
//    	boolean isrecommend = boardService.isrecommend(recommend);
//    	logger.info("추천상태 확인 ",recommend);
    	
    	//모델값 전달
    	model.addAttribute("detail", detail);
    	model.addAttribute("viewfile",viewfile);
//    	model.addAttribute("isrecommend", isrecommend);
//    	model.addAttribute("cntRecommend", boardService.getTotalCntRecommend(recommend));
    	
    	
    }
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void write() {
		logger.info("/write [GET]");
	}
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeProc(Board board, @RequestParam(value="file") MultipartFile fileupload,HttpSession session ) {
		logger.info("/write [POST]");
		logger.info("boarfile {} " ,fileupload);
		
		board.setmNo((Integer)session.getAttribute("mNo"));
		
		//파일첨부
		boardService.insertfile(board, fileupload);
		
		return "redirect:/user/board/list";
	}
	@RequestMapping(value="/download")
	public String download(BoardFile boardfile, Model model) {
		
		BoardFile fileupload = boardService.getFile(boardfile);
		logger.info("다운로드 파일확인 {} :" ,fileupload);
		//모델값 전달
		model.addAttribute("downFile", fileupload);
		
		//viewName 지정하기
		return "down";
	}
	@RequestMapping(value="/error")
	public void error() {
		logger.info("에러확인 페이지");
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void update(Board board,Model model,HttpSession session,BoardFile boardfile,MultipartFile fileupload) {
		logger.info("update [GET]");
	    logger.info("board에 값 확인하기 {} :", board);
	   
	    //게시글 상세보기
	    HashMap<String, Object> update = boardService.updateByview(board);
	    logger.info("모델값 전 확인 {} ",board);
	   
	    //게시글 첨부파일
	    HashMap<String, Object> bf = boardService.updateByfile(boardfile,fileupload);
        logger.info("파일첨부를 포함한 board {}",bf);  
        logger.info("fileno을 포함한 board {}",boardfile);
	    //모델값 전달
	    model.addAttribute("update", update);
		model.addAttribute("bf", bf);
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updateProc(Board board, MultipartFile fileupload, boolean isfile) {
		logger.info("update [POST]");
		logger.info("수정된 내용 {}",fileupload );
		
		boardService.update(board, fileupload,isfile);
		
		return "redirect:/user/board/list";
	}
	@RequestMapping(value="/delete")
	public String delete(Board board,BoardFile boardfile) {
	   logger.info("delete [GET]");
	   logger.info("boardno 확인 {}" , board);
	   
	   //게시판 글 지우기
	   boardService.delete(board);
	   
	   //게시판 boardfile 지우기
	   logger.info("delefile 확인 {}",boardfile );
	   boardService.deletefile(board);
	   
	   return "redirect:/user/board/list";
	}
	@RequestMapping(value="/recommend")
	public ModelAndView recommend(Recommend recommend,HttpSession session,ModelAndView mav)  {
		logger.info("/recommend [GET]");
		
		//추천 정보 토글
		recommend.setmNo((Integer)session.getAttribute("mNo"));
		boolean result = boardService.recommend(recommend);
		
		//추천 수 조회
		int cnt = boardService.getTotalCntRecommend(recommend);
		
		mav.addObject("result", result);
		mav.addObject("cnt", cnt);
		mav.setViewName("jsonView");
		
		return mav;
		
	}
	
}
