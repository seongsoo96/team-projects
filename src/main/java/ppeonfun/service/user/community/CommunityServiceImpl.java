package ppeonfun.service.user.community;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.community.CommunityDao;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

@Service("user.CommunityService")
public class CommunityServiceImpl implements CommunityService {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityServiceImpl.class);

	@Autowired CommunityDao communityDao;
	
	
	@Override
	public Information projectInfo(Information info) {
		return communityDao.selectInfo(info);
	}
	
	@Override
	public int totalCount(Supporter supporter) {
		return communityDao.selectCntSupporter(supporter);
	}
	
	@Override
	public int remainDay(SupporterJoin suJoin) {
		return communityDao.selectRemainDay(suJoin);
	}
	
	@Override
	public int amount(SupporterJoin suJoin) {
		return communityDao.selectTotalAmount(suJoin);
	}
	
	@Override
	public int newsCount(News news) {
		return communityDao.selectCntNews(news);
	}
	
}
