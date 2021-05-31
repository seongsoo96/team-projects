package ppeonfun.controller.user.mypage;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ppeonfun.dto.MyPage;
import ppeonfun.service.user.mypage.MypageService;


@Controller("user.MypageController")
@RequestMapping("/user/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired private MypageService mypageService;
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void getMypage(HttpSession session, Model model) {
		logger.info("***** /user/mypage/home START *****");
		MyPage profileimg = mypageService.getProfileImg((int) session.getAttribute("mNo"));
		String storedName = profileimg.getMyStoredName();

		//저장된 프로필 사진이 있는 경우
		if(storedName != null && !"".equals(storedName)) {
			model.addAttribute("isExistsImg", true);
			model.addAttribute("profileImg", storedName);
		} else {//프로필 사진 없는 경우 기본 이미지로 설정
			model.addAttribute("isExistsImg", false);
			model.addAttribute("profileImg", "test1.png");
		}
		
	}
}
