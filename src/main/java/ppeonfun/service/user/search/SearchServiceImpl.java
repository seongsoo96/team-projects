package ppeonfun.service.user.search;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.search.SearchDao;
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
		
		logger.info("inData : " + inData.getCurPage());
		
		//페이징 계산
		SearchPaging paging = new SearchPaging(totalCount, inData.getCurPage());
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> list(SearchPaging paging, String keyword) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("keyword", keyword);
		
		return searchDao.selectSearchList(map);
	}
	

}
