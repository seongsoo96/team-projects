package ppeonfun.service.user.search;

import java.util.HashMap;
import java.util.List;

import ppeonfun.util.SearchPaging;

public interface SearchService {
	
	/**
	 * 검색된 플젝 목록을 위한 페이징 객체 생성
	 * 
	 * 파라미터 객체의 curPage(현재 페이지)와
	 * DB에서 조회한 totalCount(총 게시글 수)를 이용한다
	 * 
	 * @param inData - curPage(현재페이지)를 저장하고 있는 SearchPaging객체
	 * @param keyword - 검색한 keyword
	 * @return
	 */
	SearchPaging getPaging(SearchPaging inData, String keyword);

	/**
	 * 검색과 페이징이 적용된 프로젝트 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @param keyword - 검색어
	 * @return
	 */
	List<HashMap<String, Object>> list(SearchPaging paging, String keyword);

}
