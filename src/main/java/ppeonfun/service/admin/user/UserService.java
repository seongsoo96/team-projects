package ppeonfun.service.admin.user;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import ppeonfun.dto.Member;
import ppeonfun.util.Paging;

public interface UserService {

	Paging getPaging(Paging inData);

	List<HashMap<String, Object>> list(Paging paging);

	Paging getPaging(Paging inData, String category, String search);

	List<HashMap<String, Object>> list(Paging paging, String category, String search);

	HashMap<String, Object> view(int m_no);

	void userRegister(Member member);

	void updateNick(Member member);

	void deleteUser(Member member);

}
