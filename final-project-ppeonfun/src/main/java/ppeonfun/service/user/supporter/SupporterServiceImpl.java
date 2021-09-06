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
		
		String count = supporterDao.selectCntSupporter(supporter);
		int totalcnt = 0;
		
		if(count == null || count.equals("")) {
			return totalcnt;
			
		} else {
			totalcnt = Integer.parseInt(count);
			
			return totalcnt;
		}
		
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
		
		String money = supporterDao.selectTotalAmount(suJoin);
		int amount = 0;
		
		if(money == null || money.equals("")) {
			return amount;
			
		} else {
			amount = Integer.parseInt(money);
			
			return amount;
		}
		
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
	
	@Override
	public int communityCnt(News news) {
		
		String comCnt = supporterDao.selectCntCommunity(news);
		int comCount = 0;
		
		if(comCnt == null || comCnt.equals("")) {
			return comCount;
			
		} else {
			comCount = Integer.parseInt(comCnt);
			
			return comCount;
		}
	}

}
