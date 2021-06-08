package ppeonfun.service.admin.reward;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.admin.reward.RewardDao;
import ppeonfun.dto.Project;
import ppeonfun.dto.Reward;


@Service("admin.RewardService")
public class RewardServiceImpl implements RewardService {
	private static final Logger logger = LoggerFactory.getLogger(RewardServiceImpl.class);
	@Autowired private RewardDao rewardDao;
	
	@Override
	public Project projectState(Project project) {
		
		return rewardDao.selectByState(project);
	}
	@Override
	public boolean rewardState(Project project) {
		if(rewardDao.selectIsReward(project) > 0) {
			return true; //값이 존재 modify 수정으로
		}
		return false; //값이 없음 write 입력으로
	}
	@Override
	public String selectByName(Project project) {
		
		return rewardDao.selectByName(project);
	}
	
	@Override
	public List<Reward> viewRewardList(Project project) {
		// TODO Auto-generated method stub
		return rewardDao.selectRewardList(project);
	}
	
	@Override
	public Reward inputReward(Reward reward) {
		
		rewardDao.insertReward(reward);
		
		return reward;
	}
	@Override
	public Project getProject(Reward reward) {
		Project project = new Project();
		project.setpNo(reward.getpNo());
		return project;
	}
	@Override
	public void removeReward(Reward reward) {
		rewardDao.deleteReward(reward);
		
	}
	
	@Override
	public void updateRewardState(Reward reward) {
		Project project = new Project();
		project.setpNo(reward.getpNo());
		if(rewardDao.selectIsReward(project) > 0) {
			project.setpReward("Y");
		}else {
			project.setpReward("W");
		}
		
		rewardDao.updateProjectState(project);
	}
	
}
