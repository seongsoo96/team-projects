package ppeonfun.service.user.supporter;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.supporter.SupporterDao;
import ppeonfun.dto.Information;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

@Service("user.SupporterService")
public class SupporterServiceImpl implements SupporterService {
	
	private static final Logger logger = LoggerFactory.getLogger(SupporterServiceImpl.class);
	
	@Autowired
	private SupporterDao supporterDao;
	
	
	@Override
	public int totalCount(Supporter supporter) {
		
//		logger.info("총 서포터 수 select");
		
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

}
