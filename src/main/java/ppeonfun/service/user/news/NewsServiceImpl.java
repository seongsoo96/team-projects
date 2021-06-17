package ppeonfun.service.user.news;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.news.NewsDao;
import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;
import ppeonfun.util.ProjectPaging;

@Service("user.NewsService")
public class NewsServiceImpl implements NewsService {
	
	private static final Logger logger = LoggerFactory.getLogger(NewsServiceImpl.class);
	
	@Autowired NewsDao newsDao;
	
	
	@Override
	public Information projectInfo(Information info) {
		return newsDao.selectInfo(info);
	}
	
	@Override
	public int totalCount(Supporter supporter) {
		
		String count = newsDao.selectCntSupporter(supporter);
		int totalcnt = 0;
		
		if(count == null || count.equals("")) {
			return totalcnt;
			
		} else {
			totalcnt = Integer.parseInt(count);
			
			return totalcnt;
		}
	}
	
	@Override
	public int remainDay(SupporterJoin suJoin) {
		return newsDao.selectRemainDay(suJoin);
	}
	
	@Override
	public int amount(SupporterJoin suJoin) {
		
		String money = newsDao.selectTotalAmount(suJoin);
		int amount = 0;
		
		if(money == null || money.equals("")) {
			return amount;
			
		} else {
			amount = Integer.parseInt(money);
			
			return amount;
		}
	}
	
	@Override
	public List<News> getList(News news) {
		return newsDao.selectList(news);
	}
	
	@Override
	public News view(News news) {
		return newsDao.selectByNno(news);
	}
	
	@Override
	public int newsCount(News news) {
		return newsDao.selectCntNews(news);
	}
	
	@Override
	public boolean isFav(Favorite favorite) {
		int cnt = newsDao.selectCntFavorite(favorite);
		
		if(cnt > 0) { //찜 함
			return true;
			
		} else { //찜 안함
			return false;
			
		}
	}
	
	@Override
	public boolean favorite(Favorite favorite) {
		
		if(isFav(favorite)) { //찜 한 상태
			newsDao.deleteFavorite(favorite);
			
			return false;
		} else {
			newsDao.insertFavorite(favorite);
			
			return true;
		}
	}
	
	@Override
	public int communityCnt(News news) {
		
		String comCnt = newsDao.selectCntCommunity(news);
		int comCount = 0;
		
		if(comCnt == null || comCnt.equals("")) {
			return comCount;
			
		} else {
			comCount = Integer.parseInt(comCnt);
			
			return comCount;
		}
	}
	
	@Override
	public int getTotalCntFavorite(Favorite favorite) {
		return newsDao.getTotalCntFavorite(favorite);
	}
	
//	@Override
//	public ProjectPaging getPaging(ProjectPaging inDate) {
//		
//		//총 게시글 수 조회
//		int totalCount = newsDao.selectCntNews(inDate);
//		
//		//페이징 계산
//		ProjectPaging paging = new ProjectPaging(totalCount, inDate.getCurPage());
//		
//		return paging;
//	}

}
