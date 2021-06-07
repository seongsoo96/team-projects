package ppeonfun.service.admin.reward;

import java.util.List;

import ppeonfun.dto.Project;
import ppeonfun.dto.Reward;

public interface RewardService {
	/**
	 * 프로젝트 상태 반환
	 * @param project - 프로젝트의 상태를 반환한다 
	 * @return 프로젝트의 상태 반환
	 */
	public Project projectState(Project project);
	
	/**
	 * 리워드의 데이터 가 존재 하는지 안 하는지
	 * @param project - 프로젝트의 번호
	 * @return 리워드의 상태값 반환
	 */
	public boolean rewardState(Project project);
	/**
	 * 프로젝트 소유자 이름 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	/**
	 * 리워드 반환
	 * @param project - 프로젝트 번호
	 * @return 기본요건 반환
	 */
	public List<Reward> viewRewardList(Project project);

}
