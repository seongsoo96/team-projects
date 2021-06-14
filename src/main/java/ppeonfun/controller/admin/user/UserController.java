package ppeonfun.controller.admin.user;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ppeonfun.dto.Member;
import ppeonfun.service.admin.user.UserService;
import ppeonfun.util.Paging;

@Controller("admin.UserController")
@RequestMapping(value="/admin/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired private UserService userService;
	
	@RequestMapping(value="/list")
	public void list(Paging inData, String search, Model model
			, @RequestParam(value="category", defaultValue="m_name") String category) {
		
		logger.info("/board/list [GET]");
		
		logger.info("category {}", category);
		logger.info("서치 : " + search);
		
		Paging paging = null;
		List<HashMap<String, Object>> list = null;
		
		if(search == null || ("").equals(search)) {
			paging = userService.getPaging(inData);
			list = userService.list(paging);
		} else {
			paging = userService.getPaging(inData, category, search);
			list = userService.list(paging, category, search);
			paging.setSearch(search);
			paging.setCategory(category);
//			model.addAttribute("category", category);
//			model.addAttribute("search", search);
		}
		
		//페이징 계산
		logger.debug("페이징 ~~ : " + paging.toString());
		
		//사용자 목록 조회
		for(int i=0; i<list.size(); i++) {
			logger.debug("가나다가 : " +list.get(i).toString());
		}
		
		//모델값 전달
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}
	
	@RequestMapping(value="/view")
	public String view(int m_no, Model model) {
		logger.info("/admin/user/view [GET]");
		
//		Board board = boardService.view(boardNo);
		logger.info("m_no-----" + m_no);
		HashMap<String, Object> view = userService.view(m_no);
		logger.info("view : " + view.toString());
		
		
		model.addAttribute("view", view);
//		model.addAttribute("comment", list);
		
		return "admin/user/view";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void register() {
		logger.info("/admin/user/register [GET]");
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerInfo(Member member) {
		logger.info("/admin/user/register [POST]");
		logger.debug("Member : " + member);
		
		userService.userRegister(member);
		
		return "redirect:/admin/user/list";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update(Member member) {
		logger.info("/admin/user/update [GET]");
		logger.debug("member : " + member);
		
		userService.updateNick(member);
		
		return "redirect:/admin/user/list";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(Member member) {
		logger.info("/admin/user/delete [GET]");
		logger.debug("member : " + member);
		
		userService.deleteUser(member);
		
		return "redirect:/admin/user/list";
	}
}















