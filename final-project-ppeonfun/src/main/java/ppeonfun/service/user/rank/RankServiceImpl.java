package ppeonfun.service.user.rank;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.rank.RankDao;
import ppeonfun.dto.Rank;
import ppeonfun.service.user.reward.RewardServiceImpl;

@Service("user.RankService")
public class RankServiceImpl implements RankService {
	private Logger logger = LoggerFactory.getLogger(RewardServiceImpl.class);
	@Autowired private RankDao rankDao;
	@Override
	public List<Rank> getRank() {
		
		return rankDao.selectAllRank();
	}
	
	@Override
	public List<Rank> getFavoirteScore(List<Rank> list) {
		for(int i=0; i<list.size(); i++) {
			double score = list.get(i).getScore();
			int count = rankDao.selectFavoriteCount(list.get(i));
			logger.info("favorite : {}",count);
			score+=count*0.25; //좋아요개수에 따른 점수 반영
			list.get(i).setScore(score);
		}
		return list;
	}
	
	@Override
	public List<Rank> getSupporter(List<Rank> list) {
		for(int i=0; i<list.size(); i++) {
			double score = list.get(i).getScore();
			int count = rankDao.selectSupporterCount(list.get(i));
			logger.info("supporter : {}",count);
			score+=count*0.25; //서포터 명수에 따른 점수 반영
			list.get(i).setScore(score);
		}
		return list;
	}
	
	@Override
	public List<Rank> getStoredName(List<Rank> list) {
		for(int i=0; i<list.size(); i++) {
			
			String iStoredName = rankDao.selectIStoredName(list.get(i));
			list.get(i).setiStroedName(iStoredName);
			
		}
		return list;
	}
}
