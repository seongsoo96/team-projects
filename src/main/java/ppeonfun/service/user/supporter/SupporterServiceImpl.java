package ppeonfun.service.user.supporter;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.supporter.SupporterDao;
import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

@Service("user.SupporterService")
public class SupporterServiceImpl implements SupporterService {
	
	private static final Logger logger = LoggerFactory.getLogger(SupporterServiceImpl.class);
	
	@Autowired
	private SupporterDao supporterDao;
	
	
	@Override
	public int totalCount(Supporter supporter) {
		return supporterDao.selectCntSupporter(supporter);
	}
	
	@Override
	public List<SupporterJoin> supporterList(SupporterJoin suJoin) {
		return supporterDao.selectList(suJoin);
	}
	
	@Override
	public int remainDay(SupporterJoin suJoin) {
		return supporterDao.selectRemainDay(suJoin);
	}
	
	@Override
	public int amount(SupporterJoin suJoin) {
		return supporterDao.selectTotalAmount(suJoin);
	}
	
	@Override
	public Information projectInfo(Information info) {
		return supporterDao.selectInfo(info);
	}
	
	@Override
	public int newsCount(News news) {
		return supporterDao.selectCntNews(news);
	}
	
	@Override
	public boolean isFav(Favorite favorite) {
		int cnt = supporterDao.selectCntFavorite(favorite);
		
		if(cnt > 0) { //찜 함
			return true;
			
		} else { //찜 안함
			return false;
			
		}
	}
	
	@Override
	public boolean favorite(Favorite favorite) {
		if(isFav(favorite)) { //찜 한 상태
			supporterDao.deleteFavorite(favorite);
			
			return false;
		} else {
			supporterDao.insertFavorite(favorite);
			
			return true;
		}
	}
	
	@Override
	public int getTotalCntFavorite(Favorite favorite) {
		return supporterDao.getTotalCntFavorite(favorite);
	}

}
