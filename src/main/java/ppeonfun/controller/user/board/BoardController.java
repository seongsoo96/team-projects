package ppeonfun.controller.user.board;

import java.io.IOException;
import java.io.Writer;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ppeonfun.dto.Board;
import ppeonfun.dto.BoardFile;
import ppeonfun.dto.Comments;
import ppeonfun.dto.Commentss;
import ppeonfun.dto.Member;
import ppeonfun.dto.Recommend;
import ppeonfun.service.user.board.BoardService;
import ppeonfun.util.Paging;

@Controller("user.BoardController")
@RequestMapping("/user/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired private BoardService boardService;
	
	@RequestMapping(value="/list")
	public void list(
			@RequestParam(value="curPage", defaultValue="0") int curPage, 
			@RequestParam(value="search", defaultValue="") String search, 
			@RequestParam(value="category", defaultValue="") String category, 
			Model model
			) {
		logger.info("/board/list [GET]");
		logger.info("search값 확인 {} :", search);
		logger.info("category값 확인 {} :", category);

		
		Paging inDate = new Paging();
		
		inDate.setCategory(category);
		inDate.setSearch(search);
		inDate.setCurPage(curPage);

		//페이징 계산
		Paging paging = boardService.getPaging(inDate);
		
		logger.info("paging값 확인 {} :", paging);
		
		//검색 포함한 페이징 계산	
		paging.setSearch(inDate.getSearch());
		paging.setCategory(inDate.getCategory());
		
		logger.info("inDate값 확인 {} :", inDate);
		
	    //해시맵으로 게시글 목록 조회
	    List <HashMap<String, Object>> list = boardService.list(paging);
	    logger.info("게시긂 목록 조회 확인  {} :" ,list);
	    
	    

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
    	
    	//모델값 전달
    	model.addAttribute("detail", detail);
    	model.addAttribute("viewfile",viewfile);
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
	
	@RequestMapping(value="/comments/list")
	public void commentList(Board board, Model model, HttpSession session) {
		logger.info("/baord/commentList [GET]");
		logger.info("댓글리스트용 게시글번호 : {}", board);
		
		//댓글 리스트 불러오기
		List<HashMap<String, Object>> commentList = boardService.getCommentList(board);
		logger.info("댓글 내용 불러오기 :{}", commentList);
		
		//대댓글 리스트를 불러오기 위해 해당 글의 댓글 번호 리스트 얻어오기
        List<Integer> commentsslistbno = boardService.getCommentssList(board);
    	logger.info("commentssno 값 조회 : {}",commentsslistbno);
//    	logger.info("각각의 조회 : {}",commentsslistbno.get(0) );
    	
    	
    	int mNo = (Integer)session.getAttribute("mNo");
    	commentsslistbno.add(mNo);
    	//얻어온 댓글 번호 리스트를 이용해서 대댓글 리스트 얻어오기
    	List<HashMap<String, Object>> commentsslist = boardService.getcommentNolist(commentsslistbno);
		logger.info("commentss 안에 값 확인 : {}",commentsslist);
		
		//모델값 전달
		model.addAttribute("commentList", commentList);
		model.addAttribute("commentsslist",commentsslist);
	}
	
	@RequestMapping(value="/comments/insert", method=RequestMethod.POST)
	public @ResponseBody void comments(Comments comments,HttpSession session) {
		
		logger.info("/comments [POST]");
		logger.info("comments 에있는 정보 {}:" , comments);
		
		int mNo = (Integer)session.getAttribute("mNo");
		comments.setmNo(mNo);

		boardService.insertComments(comments);
		logger.info("comments 내용 불러오기 :",comments);
		
	}
	@RequestMapping(value="/comments/delete")
	public @ResponseBody void commentsDelete(Comments comments,Writer writer) {
		logger.info("/comments/delete [GET]");
		logger.info("commetns 안에 값 확인 : {}",comments);
		
		boolean success = boardService.deleteComments(comments);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
    @RequestMapping(value="/comments/update",method=RequestMethod.GET)
	public String commentUpdate(Comments comments,Model model) {
		logger.info("/comments/update [GET]");
		logger.info("comments 안에 값 확인 : {}",comments);
	
		List<HashMap<String, Object>> cmtlist = boardService.getCommentlist(comments);
		logger.info("cmltlist 안에 값 확인 : {}",cmtlist);
		int cNo = comments.getcNo();
		
		model.addAttribute("cNo",cNo);
		model.addAttribute("cmtlist",cmtlist);
		
		return "user/board/comments/updateForm";
				
	}
    
    @RequestMapping(value="/comments/update", method=RequestMethod.POST )
    public String commentUpdateProc(Comments comments,Model model) {
       logger.info("/comments/update [POST]");
       logger.info("comments 수정 후 데이터 값 확인 : {}",comments );
       boardService.updateComment(comments);
       
       return "user/board/comments/update";
    }
    @RequestMapping(value="/commentss/insert",method=RequestMethod.POST)
    public String commentssInsert(Commentss commentss,HttpSession session) {
    	logger.info("/commentss/insert [POST]");
    	
    	int mNo = (Integer)session.getAttribute("mNo");
    	commentss.setmNo(mNo);
    	logger.info("commentss안에 다른값 확인 : {}",commentss);
    	
    	
    	boardService.insertCommentsS(commentss);
    	
    	return "/user/board/comments/list";
    }
    @RequestMapping(value="/commentss/delete")
    public void commentssDelete(Commentss commentss,Writer writer) {
    	logger.info("/commentss/delete [GET]");
    	logger.info("commentssdelete값 확인 : {}",commentss);
    	
    	boolean success = boardService.deleteCommentss(commentss);
    	logger.info("삭제된 cs_no 확인 :{}",success);
    	
    	try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    @RequestMapping(value="/commentss/update",method=RequestMethod.POST)
    public void commentssUpdate(Commentss commentss,Writer out) {
    	logger.info("/commentss/update [POST]");
    	logger.info("업데이트 할 commentss값 : {}",commentss);
    	
    	boardService.updateCommentss(commentss);
    	
    	logger.info("수정된 commentss값 :{}",commentss);
    	
    	try {
			out.append("{\"success\",true}");
		} catch (IOException e) {
			e.printStackTrace();
		}
    }

}
