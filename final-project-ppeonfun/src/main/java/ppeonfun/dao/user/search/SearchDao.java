package ppeonfun.dao.user.search;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.SearchFilter;

@Repository("user.SearchDao")
public interface SearchDao {
	
	/**
	 * keyword가 포함된 전체 프로젝트 수 조회
	 * 
	 * @param keyword - 검색어
	 * @return keyword 포함된 전체 프로젝트 수
	 */
	int selectCntAllByKeyword(String keyword);

	/**
	 * keyword가 포함된 전체 프로젝트 목록
	 * 
	 * @param map - keyword, paging
	 * @return
	 */
	List<HashMap<String, Object>> selectSearchList(HashMap<String, Object> map);
	
	/**
	 * 필터가 포함된 전체 프로젝트 수 조회
	 * 
	 * @param sf
	 * @return
	 */
	int selectCntAllByFilter(HashMap<String, Object> map);

	List<HashMap<String, Object>> selectSearchListByFilter(HashMap<String, Object> map);

}
