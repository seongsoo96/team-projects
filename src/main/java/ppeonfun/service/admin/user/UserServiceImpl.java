package ppeonfun.service.admin.user;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.admin.user.UserDao;
import ppeonfun.dto.Member;
import ppeonfun.util.Paging;

@Service("admin.UserService")
public class UserServiceImpl implements UserService {
	
	@Autowired  UserDao userDao;
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	//검색 미포함
	@Override
	public Paging getPaging(Paging inData) {

		//총 게시글 수 조회
		int totalCount = userDao.selectCntAll();
		
		logger.info("inData.getCurPage : " + inData.getCurPage());
		
		//페이징 계산
		Paging paging = new Paging(totalCount, inData.getCurPage());
		
		return paging;
	}
	
	//검색 미포함
	@Override
	public List<HashMap<String, Object>> list(Paging paging) {
		return userDao.selectPageList(paging);
	}

	//검색 포함 //카테고리 포함
	@Override
	public Paging getPaging(Paging inData, String category, String search) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("search", search);
		
		//총 게시글 수 조회
//		int totalCount = userDao.selectCntAll();
		int totalCount = userDao.selectCntAllBySearch(map);
		
		logger.info("inData.getCurPage가가가가가 : " + inData.getCurPage());
		
		//페이징 계산
		Paging paging = new Paging(totalCount, inData.getCurPage());
		
		return paging;
	}

	//검색 포함 // 카페고리 포함
	@Override
	public List<HashMap<String, Object>> list(Paging paging, String category, String search) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("search", search);
		map.put("category", category);
		
		return userDao.selectSearchPageList(map);
	}

	@Override
	public HashMap<String, Object> view(int m_no) {
		
		HashMap<String, Object> view = userDao.selectByMno(m_no);
		
		
		//로그인 유무 확인
//		if( session.getAttribute("login") != null ) {
//			
//			String loginId = ((Member)session.getAttribute("login")).getId();
//			loginReco.setId(loginId);
//			loginReco.setBoardNo(m_no);
//			
//			//추천 유무 조회
//			view.put("CHKRECO", userDao.selectCntChkReco(loginReco));
//		}
		
//		userDao.hit(m_no);
		
		return view;
	}

	@Override
	public void userRegister(Member member) {
		userDao.insertMember(member);
	}

	@Override
	public void updateNick(Member member) {
		userDao.updateNick(member);
	}

	@Override
	public void deleteUser(Member member) {
		userDao.deleteMember(member);
	}
}
