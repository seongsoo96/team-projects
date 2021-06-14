package ppeonfun.service.user.reward;

import java.util.List;

import ppeonfun.dto.Project;
import ppeonfun.dto.Reward;

public interface RewardService {
	/**
	 * 리워드 목록
	 * @param project - 프로젝트 번호
	 * @return - 리워드 목록 반환
	 */
	public List<Reward> viewReward(Project project);

}
