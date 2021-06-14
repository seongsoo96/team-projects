package ppeonfun.dao.user.reward;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;

import ppeonfun.dto.Project;
import ppeonfun.dto.Reward;

@RequestMapping("user.RewardDao")
public interface RewardDao {
	/**
	 * 모든 리워드 조회
	 * @param project - 프로젝트 번호
	 * @return - 리워드 목록
	 */
	public List<Reward> selectAllReward(Project project);
	
}
