package ppeonfun.service.user.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.main.MainDao;
import ppeonfun.dto.Information;
import ppeonfun.util.Paging;

@Service("user.MainServiceImpl")
public class MainServiceImpl implements MainService {
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Autowired private MainDao mainDao;
	@Override
	public List<Information> selectAllLatery(Paging paging) {
		logger.info("mainService list 실행");
		return mainDao.selectAll(paging);
	}
	
	@Override
	public Paging getPaging(Paging inData) {
		//전체 개수
		int totalCount = mainDao.selectCntAll();
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage(),4,5);
		
		return paging;
	}
	@Override
	public Paging getPaging(int curPage) {
		//전체 개수
		int totalCount = mainDao.selectCntAll();
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, curPage,4,5);

		return paging;
	}
	
	@Override
	public List<Information> selectFavorite() {
		
		return mainDao.selectInformationFavorite();
	}
}
