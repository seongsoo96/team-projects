package ppeonfun.controller.admin.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Board;
import ppeonfun.service.admin.board.BoardService;

@Controller("admin.BoardController")
@RequestMapping(value="/admin/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/list")
	public String list() {
//		logger.info("/admin/board/list 요청 확인");
		
		//모든 게시글 가져오기
		List<Board> blist = boardService.getList();
		
		
		return null;
	}
}
