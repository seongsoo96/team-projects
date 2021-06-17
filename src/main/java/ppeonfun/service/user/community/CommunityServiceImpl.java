package ppeonfun.service.user.community;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.community.CommunityDao;
import ppeonfun.dto.Community;
import ppeonfun.dto.CommunityAnswer;
import ppeonfun.dto.CommunityJoin;
import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Project;
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
		
		String count = communityDao.selectCntSupporter(supporter);
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
		return communityDao.selectRemainDay(suJoin);
	}
	
	@Override
	public int amount(SupporterJoin suJoin) {
		
		String money = communityDao.selectTotalAmount(suJoin);
		int amount = 0;
		
		if(money == null || money.equals("")) {
			return amount;
			
		} else {
			amount = Integer.parseInt(money);
			
			return amount;
		}
	}
	
	@Override
	public int newsCount(News news) {
		return communityDao.selectCntNews(news);
	}
	
	@Override
	public boolean isFav(Favorite favorite) {
		int cnt = communityDao.selectCntFavorite(favorite);
		
		if(cnt > 0) { //찜 함
			return true;
			
		} else { //찜 안함
			return false;
			
		}
	}
	
	@Override
	public boolean favorite(Favorite favorite) {
		if(isFav(favorite)) { //찜 한 상태
			communityDao.deleteFavorite(favorite);
			
			return false;
		} else {
			communityDao.insertFavorite(favorite);
			
			return true;
		}
	}
	
	@Override
	public int getTotalCntFavorite(Favorite favorite) {
		return communityDao.getTotalCntFavorite(favorite);
	}
	
	@Override
	public List<CommunityJoin> commuList(CommunityJoin communityJoin) {
		return communityDao.selectList(communityJoin);
	}
	
	@Override
	public void writeCommunity(Community community) {
		if("".equals(community.getComContent())) { //내용없을 때 삽입 안됨
			return;
		}
		
		communityDao.insertCommunity(community);
	}
	
	@Override
	public int communityCnt(News news) {
		
		String comCnt = communityDao.selectCntCommunity(news);
		int comCount = 0;
		
		if(comCnt == null || comCnt.equals("")) {
			return comCount;
			
		} else {
			comCount = Integer.parseInt(comCnt);
			
			return comCount;
		}
	}
	
	
	@Override
	public Project getMakerMno(Project project) {
		return communityDao.getMnoByPno(project);
	}
	
	@Override
	public void writeAnswer(CommunityAnswer communityAnswer) {
		communityDao.insertAnswer(communityAnswer);
	}
	
}
