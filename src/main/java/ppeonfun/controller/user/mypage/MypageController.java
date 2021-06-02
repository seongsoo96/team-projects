package ppeonfun.controller.user.mypage;

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
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public void editMyProfile(HttpSession session, Model model) {
		logger.info("***** /user/mypage/profile START *****");
		MyPage profile = mypageService.getProfileImg((int) session.getAttribute("mNo"));
		String storedName =  profile.getMyStoredName();
		
		//저장된 프로필 사진이 있는 경우
		if(storedName != null && !"".equals(storedName)) {
			model.addAttribute("isExistsImg", true);
		} else {//프로필 사진 없는 경우
			model.addAttribute("isExistsImg", false);
		}
		
		model.addAttribute("profile", profile);
	}
	
	@RequestMapping(value="/profile/ajax", method=RequestMethod.POST)
	public void postProfileImg(HttpSession session
				, @RequestParam(value="file", required=true) MultipartFile file) {
		logger.info("***** /user/mypage/profile/ajaxSTART *****");
		logger.info("파일 확인:{}", file);
		logger.info("파일명:{}", file.getOriginalFilename());
		
		//기존 파일 삭제
		mypageService.updateMypageFile((int) session.getAttribute("mNo"), file);
		//업로드 파일 등록
		
		//저장된 새 파일명 return
	}
}
