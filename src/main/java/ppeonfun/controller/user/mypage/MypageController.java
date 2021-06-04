package ppeonfun.controller.user.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.Gson;

import ppeonfun.dto.Member;
import ppeonfun.dto.MyPage;
import ppeonfun.service.user.mypage.MypageService;


@Controller("user.MypageController")
@RequestMapping("/user/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired private MypageService mypageService;
	
	//마이페이지 홈---------------------------------------------------------------------------------
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void getMypage(HttpSession session, Model model) {
		logger.info("***** /user/mypage/home START *****");
		MyPage profileimg = mypageService.getProfileImg((int) session.getAttribute("mNo"));
		String storedName = profileimg.getMyStoredName();
		
		//저장된 프로필 사진이 기본 이미지인 경우
		if("member.png".equals(storedName)) {
			model.addAttribute("isDefaultImg", true);
		} else {//업로드된 파일인 경우
			model.addAttribute("isDefaultImg", false);
		}
		
		model.addAttribute("profile", profileimg);
	}
	
	
	//마이페이지 프로필------------------------------------------------------------------------------
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public void editMyProfile(HttpSession session, Model model) {
		logger.info("***** /user/mypage/profile [GET] START *****");
		MyPage profile = mypageService.getProfileImg((int) session.getAttribute("mNo"));
		String storedName =  profile.getMyStoredName();
		
		//저장된 프로필 사진이 기본 이미지인 경우
		if("member.png".equals(storedName)) {
			model.addAttribute("isDefaultImg", true);
		} else {//업로드된 파일인 경우
			model.addAttribute("isDefaultImg", false);
		}
		
		model.addAttribute("profile", profile);
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.POST)
	public String postMyProfile(String introduce, HttpSession session, Model model) {
		logger.info("***** /user/mypage/profile [POST] START *****");
		logger.info("소개:{}", introduce);
		
		mypageService.updateMyIntroByNo(introduce, (int) session.getAttribute("mNo"));
		return "redirect:/user/mypage/profile";
	}
	
	@RequestMapping(value="/profile/ajax", method=RequestMethod.POST)
	public void updateProfileImg(HttpSession session
				, @RequestParam(value="file", required=true) MultipartFile file
				, HttpServletResponse resp) {
		logger.info("***** /user/mypage/profile/ajaxSTART *****");
		logger.info("파일 확인:{}", file);
		logger.info("파일명:{}", file.getOriginalFilename());
		
		//업로드 파일 등록
		mypageService.updateMypageFile((int) session.getAttribute("mNo"), file);
		
		//업데이트 된 mypage 테이블 조회
		MyPage newImg = mypageService.getProfileImg((int) session.getAttribute("mNo"));
		
		//저장된 새 파일명 return
		resp.setCharacterEncoding("UTF-8");
		
		try {
			PrintWriter out = resp.getWriter();
			Gson gson = new Gson();
			out.print(gson.toJson(newImg));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/profile/delajax", method=RequestMethod.GET)
	public void deleteProfileImg(HttpSession session, HttpServletResponse resp) {
		logger.info("***** /user/mypage/profile/delajaxSTART *****");
		mypageService.deleteProfileImg((int) session.getAttribute("mNo"));
		
		//저장된 새 파일명 return
		MyPage newImg = mypageService.getProfileImg((int) session.getAttribute("mNo"));
		resp.setCharacterEncoding("UTF-8");
		
		try {
			PrintWriter out = resp.getWriter();
			Gson gson = new Gson();
			out.print(gson.toJson(newImg));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//마이페이지 회원정보수정--------------------------------------------------------------------
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void detailHome() {
		logger.info("***** /user/mypage/detail START *****");
	}
	
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public void viewMyInfo(HttpSession session, Model model) {
		logger.info("***** /user/mypage/info [GET] START *****");
		
		Member member = mypageService.getMemberInfo((int) session.getAttribute("mNo"));
		logger.info("회원정보:{}", member);
		
		model.addAttribute("mInfo", member);
	}
	
	@RequestMapping(value="/info", method=RequestMethod.POST)
	public String updateMyInfo(HttpSession session, Member member) {
		logger.info("***** /user/mypage/info [POST] START *****");
		
		member.setmNo((int) session.getAttribute("mNo"));
		logger.info("수정된 회원정보 확인:{}", member);
		
		mypageService.updateMemberInfo(member);
		session.setAttribute("mNick", member.getmNick());
		
		return "redirect:/user/mypage/detail";
	}
}
