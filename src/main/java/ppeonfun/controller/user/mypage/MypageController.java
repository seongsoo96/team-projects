package ppeonfun.controller.user.mypage;

import java.io.IOException; 
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import ppeonfun.dto.CommunityAnswer;
import ppeonfun.dto.Member;
import ppeonfun.dto.MyPage;
import ppeonfun.service.user.member.MemberService;
import ppeonfun.service.user.mypage.MypageService;
import ppeonfun.util.Paging;


@Controller("user.MypageController")
@RequestMapping("/user/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired private MypageService mypageService;
	@Autowired private MemberService memberService;
	
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
	public void detailHome(HttpSession session, Model model) {
		logger.info("***** /user/mypage/detail START *****");
		
		//사이트 로그인 , 소셜 로그인에 따라 jsp 다르게 하기 위해 정보 조회
		String joinInfo = mypageService.getSocialInfo((int) session.getAttribute("mNo"));
		if(!"사이트".equals(joinInfo)) {	//카카오 로그인 회원인 경우
			model.addAttribute("isSocialKakao", true);
		}
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
	
	@RequestMapping(value="/checkpw", method=RequestMethod.POST)
	public String checkPassword(HttpSession session, Member member, Model model) {
		logger.info("***** /user/mypage/checkpw [POST] START *****");
		
		//암호화 처리
		member = memberService.encryption(member);
		member.setmNo((int) session.getAttribute("mNo"));
		
		//현재 정보와 일치하는지 check
		boolean isSameValue = mypageService.checkPassword(member);
		
		model.addAttribute("isSameValue", isSameValue);
		return "jsonView";
		
	}
	
	@RequestMapping(value="/changepw", method=RequestMethod.GET)
	public void viewMyPw() {
		logger.info("***** /user/mypage/changepw [GET] START *****");
	}
	
	@RequestMapping(value="/changepw", method=RequestMethod.POST)
	public String updateMyPw(Member member, HttpSession session) {
		logger.info("***** /user/mypage/changepw [POST] START *****");
		logger.info("변경할 비밀번호 확인:{}", member.getmPassword());
		
		//암호화 처리 후 update
		member = memberService.encryption(member);
		member.setmNo((int) session.getAttribute("mNo"));
		
		mypageService.updatePassword(member);
		
		return "redirect:/user/mypage/home";
	}
	
	@RequestMapping(value="/unsubscribe", method=RequestMethod.GET)
	public void viewUnsubscribe(HttpSession session, Model model) {
		logger.info("***** /user/mypage/unsubscribe [GET] START *****");
		
		String mEmail = mypageService.getEmailBymNo((int) session.getAttribute("mNo"));
		model.addAttribute("mEmail", mEmail);
		
	}
	
	@RequestMapping(value="/unsubscribe/ajax", method=RequestMethod.POST)
	public String checkPjBeforeUnsub(HttpSession session, Model model) {
		logger.info("***** /user/mypage/unsubscribe/ajax [GET] START *****");
		
		//회원이 참여 중인 프로젝트가 있는지 조회한다. 
		//프로젝트가 있으면 true -> 탈퇴 불가, 없으면 false -> 탈퇴 가능
		boolean hasProject = mypageService.checkProjectByNo((int) session.getAttribute("mNo"));
		model.addAttribute("hasProject", hasProject);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/unsubscribe", method=RequestMethod.POST)
	public String postUnsubscribe(HttpSession session, Model model) {
		logger.info("***** /user/mypage/unsubscribe [POST] START *****");
		
		//m_delete_state N -> Y 로 UPDATE
		mypageService.updateDeleteState((int) session.getAttribute("mNo"));
		
		//사이트 로그인 , 소셜 로그인에 따라 로그아웃 다르게 하기 위해 정보 조회
		String joinInfo = mypageService.getSocialInfo((int) session.getAttribute("mNo"));
		if(!"사이트".equals(joinInfo)) {	//카카오 로그인 회원인 경우
			model.addAttribute("isSocialKakao", true);
		}
		
		return "jsonView";
	}
	
	//마이페이지 나의프로젝트--------------------------------------------------------------------
	@RequestMapping(value="/myfunding", method=RequestMethod.GET)
	public void viewMyFunding(HttpSession session, Model model, @RequestParam(defaultValue="1")int curPage) {
		logger.info("***** /user/mypage/myfunding [GET] START *****");
		
		int mNo = (int) session.getAttribute("mNo");
		
		//전체 펀딩 내역 조회
		Paging paging = mypageService.getPaymPaging(curPage, mNo);
		List<Map<String, Object>> totalList = mypageService.getMyFundingListAll(paging, mNo);
		logger.info("totalList: {}", totalList);
		
		model.addAttribute("paging", paging);
		model.addAttribute("totalList", totalList);
	}
	
	@RequestMapping(value="/fundingchart", method=RequestMethod.GET)
	public String viewMyFundingChart( @RequestParam(defaultValue="payment") String payState) {
		logger.info("***** /user/mypage/fundingchart [GET] START *****");
		
		if("payment".equals(payState)) {
			return "redirect:/user/mypage/fundingchart/payment";
		} else if("payback".equals(payState)) {
			return "redirect:/user/mypage/fundingchart/payback";
		}
		logger.info("결제 OR 취소: {}",payState);
		
		return null;
		
	}
	
	@RequestMapping(value="/fundingchart/payment")
	public String viewMyPayment(HttpSession session, Model model) {
		logger.info("***** /user/mypage/fundingchart/payment START *****");
		
		//회원의 카테고리별 결제 내역을 조회한다.
		List<HashMap<String, Object>> map = mypageService.getPaymentSum((int) session.getAttribute("mNo"));
		
		logger.info("통계 데이터 {}",map);
		model.addAttribute("map",map);
		model.addAttribute("paystate","payment");
		return "/user/mypage/fundingchart";
	}
	
	
	@RequestMapping(value="/fundingchart/payback")
	public String viewMyPayback(HttpSession session, Model model) {
		logger.info("***** /user/mypage/fundingchart/payback START *****");
		
		//회원의 카테고리별 결제 취소(환불) 내역을 조회한다.
		List<HashMap<String, Object>> map = mypageService.getPaybackSum((int) session.getAttribute("mNo"));
		
		logger.info("통계 데이터 {}",map);
		model.addAttribute("map",map);
		model.addAttribute("paystate","payback");
		return "/user/mypage/fundingchart";
	}
	
	
	/* 서포터 */
	
	//마이페이지 좋아요--------------------------------------------------------------------
	@RequestMapping(value="/favorite", method=RequestMethod.GET)
	public void viewMyFavorite(HttpSession session, Model model, @RequestParam(defaultValue="1")int curPage) {
		logger.info("***** /user/mypage/favorite [GET] START *****");
		
		int mNo = (int) session.getAttribute("mNo");
		Paging paging = mypageService.getFavoritePaging(curPage, mNo);
		
		//회원이 좋아요한 프로젝트 목록을 조회한다.
		List<HashMap<String, Object>> favoriteList = mypageService.getMyFavoriteList(paging, mNo);
		
		logger.info("좋아요 목록 {}", favoriteList);
		model.addAttribute("favoriteList", favoriteList);
		model.addAttribute("paging", paging);
	}
	
	
	//마이페이지 내가 쓴 글--------------------------------------------------------------------
	
	@RequestMapping(value="/fundcomm", method=RequestMethod.GET)
	public void viewMyFundComm(HttpSession session, Model model, @RequestParam(defaultValue="1")int curPage) {
		logger.info("***** /user/mypage/fundcomm [GET] START *****");
		
		int mNo = (int) session.getAttribute("mNo");
		Paging paging = mypageService.getFundCommPaging(curPage, mNo);
		
		//회원이 프로젝트 커뮤니티에 작성한 글을 조회한다.
		List<HashMap<String, Object>> fundCommList = mypageService.getMyFundCommList(paging, mNo);
		
		logger.info("펀딩 커뮤니티에 작성한 글 목록 {}", fundCommList);
		model.addAttribute("fundCommList", fundCommList);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/fundcomm/ajax", method=RequestMethod.POST)
	public String getMyFundCommAnswer(@RequestParam(required=true) int comNo, HttpSession session, Model model) {
		logger.info("***** /user/mypage/fundcomm/ajax [POST] START *****");
		
		int mNo = (int) session.getAttribute("mNo");

		//작성 글에 대한 답변을 조회한다.
		CommunityAnswer answer = mypageService.getCommentAnswerBycomNo(mNo, comNo);
		
		logger.info("펀딩 커뮤니티 답변 내용 {}", answer);
		model.addAttribute("answer", answer);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public void viewMyBoard(HttpSession session, Model model, @RequestParam(defaultValue="1")int curPage) {
		logger.info("***** /user/mypage/board [GET] START *****");
		
		int mNo = (int) session.getAttribute("mNo");
		Paging paging = mypageService.getMyBoardPaging(curPage, mNo);
		
		//회원이 게시판에 작성한 글 목록을 조회한다.
		List<HashMap<String, Object>> myBoardList = mypageService.getMyBoardList(paging, mNo);
		
		logger.info("게시판에 작성한 글 목록 {}", myBoardList);
		model.addAttribute("boardList", myBoardList);
		model.addAttribute("paging", paging);
	}
	
	//마이페이지 오류--------------------------------------------------------------------
	@RequestMapping(value = "/error")
	public void error() {
		logger.info("***** /user/mypage/error START *****");
	}
	
	
}
