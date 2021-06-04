package ppeonfun.service.user.search;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.search.SearchDao;
import ppeonfun.dto.SearchFilter;
import ppeonfun.util.SearchPaging;

@Service("user.SearchServiceImpl")
public class SearchServiceImpl implements SearchService {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchServiceImpl.class);
	
	@Autowired SearchDao searchDao;

	@Override
	public SearchPaging getPaging(SearchPaging inData, String keyword) {
		
		//총 프로젝트 수 조회
		int totalCount = searchDao.selectCntAllByKeyword(keyword);
		logger.info("totalCount : " + totalCount);
		
		logger.info("inData.getCurPage : " + inData.getCurPage());
		
		//페이징 계산
		SearchPaging paging = new SearchPaging(totalCount, inData.getCurPage());
		
		logger.info("paging객체 + inData.getCurPage " + paging);
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> list(SearchPaging paging, String keyword) {
		
		logger.info("리스트 페이징 객체 : " + paging);
		logger.info("리스트 검색어 : " + keyword);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("keyword", keyword);
		
		return searchDao.selectSearchList(map);
	}

	@Override
	public SearchPaging getPaging(SearchPaging inData, SearchFilter sf) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("sf", sf);
		
		logger.info("paging - mapper parameter : {}", map);
		
		//총 프로젝트 수 조회
		int totalCount = searchDao.selectCntAllByFilter(map);
		logger.info("totalCount : " + totalCount);
		
		logger.info("inData.getCurPage : " + inData.getCurPage());
		
		//페이징 계산
		SearchPaging paging = new SearchPaging(totalCount, inData.getCurPage());
		
		logger.info("paging객체 + inData.getCurPage " + paging);
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> list(SearchPaging paging, SearchFilter sf) {
		logger.debug("리스트 페이징 객체 : " + paging);
		logger.debug("리스트 검색어 : " + sf.getKeyword());
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("sf", sf);
		
		logger.info("list - mapper parameter : {}", map);
		
		return searchDao.selectSearchListByFilter(map);
	}
	

}
