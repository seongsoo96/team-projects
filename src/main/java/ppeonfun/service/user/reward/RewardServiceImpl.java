package ppeonfun.service.user.reward;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.reward.RewardDao;
import ppeonfun.dto.Project;
import ppeonfun.dto.Reward;

@Service("user.RewardService")
public class RewardServiceImpl implements RewardService {
	private Logger logger = LoggerFactory.getLogger(RewardServiceImpl.class);
	@Autowired private RewardDao rewardDao;
	
	
	@Override
	public List<Reward> viewReward(Project project) {
		// TODO Auto-generated method stub
		return rewardDao.selectAllReward(project);
	}
}
