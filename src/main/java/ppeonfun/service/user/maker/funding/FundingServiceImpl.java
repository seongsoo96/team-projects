package ppeonfun.service.user.maker.funding;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.maker.funding.FundingDao;
import ppeonfun.dto.Project;

@Service("user.maker.FundingService")
public class FundingServiceImpl implements FundingService {
	private static final Logger logger = LoggerFactory.getLogger(FundingServiceImpl.class);
	@Autowired private FundingDao fundingDao;
	
	@Override
	public List<HashMap<String, Object>> viewState(Project project) {
		//통계값 가져오기
		logger.info("통계값 가져오기");
		return fundingDao.selectState(project);
	}
	
	@Override
	public String getSuAddMoney(Project project) {
		// TODO Auto-generated method stub
		return fundingDao.selectSuAddMoney(project);
	}
}
