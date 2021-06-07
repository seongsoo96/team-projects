package ppeonfun.dao.admin.user;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.util.Paging;

@Repository("admin.UserDao")
public interface UserDao {

	int selectCntAll();

	List<HashMap<String, Object>> selectPageList(Paging paging);

	int selectCntAllBySearch(HashMap<String, Object> map);

	List<HashMap<String, Object>> selectSearchPageList(HashMap<String, Object> map);

	HashMap<String, Object> selectByMno(int m_no);

}
