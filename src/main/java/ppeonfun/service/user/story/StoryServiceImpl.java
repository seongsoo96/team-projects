package ppeonfun.service.user.story;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.story.StoryDao;
import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

@Service("user.StoryService")
public class StoryServiceImpl implements StoryService {
	
	private static final Logger logger = LoggerFactory.getLogger(StoryServiceImpl.class);

	@Autowired StoryDao storyDao;
	
	
	@Override
	public Information projectInfo(Information info) {
		return storyDao.selectInfo(info);
	}
	
	
	@Override
	public int totalCount(Supporter supporter) {
		return storyDao.selectCntSupporter(supporter);
	}
	
	
	@Override
	public int remainDay(SupporterJoin suJoin) {
		return storyDao.selectRemainDay(suJoin);
	}
	
	
	@Override
	public int amount(SupporterJoin suJoin) {
		return storyDao.selectTotalAmount(suJoin);
	}
	
	@Override
	public int newsCount(News news) {
		return storyDao.selectCntNews(news);
	}
	
	@Override
	public boolean isFav(Favorite favorite) {
		int cnt = storyDao.selectCntFavorite(favorite);
		
		if(cnt > 0) { //찜 함
			return true;
			
		} else { //찜 안함
			return false;
			
		}
	}
	
	@Override
	public boolean favorite(Favorite favorite) {
		
		if(isFav(favorite)) { //찜 한 상태
			storyDao.deleteFavorite(favorite);
			
			return false;
		} else {
			storyDao.insertFavorite(favorite);
			
			return true;
		}
	}
	
	@Override
	public int getTotalCntFavorite(Favorite favorite) {
		return storyDao.selectCntFavorite(favorite);
	}
}
