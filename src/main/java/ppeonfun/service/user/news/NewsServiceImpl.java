package ppeonfun.service.user.news;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.news.NewsDao;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

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
		return newsDao.selectCntSupporter(supporter);
	}
	
	@Override
	public int remainDay(SupporterJoin suJoin) {
		return newsDao.selectRemainDay(suJoin);
	}
	
	@Override
	public int amount(SupporterJoin suJoin) {
		return newsDao.selectTotalAmount(suJoin);
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

}
