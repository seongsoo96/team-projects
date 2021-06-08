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
	 * @param reward - 프로젝트 번호
	 * @return 기본요건 반환
	 */
	public List<Reward> viewRewardList(Project project);
	
	/**
	 * 리워드값 대입
	 * @param reward - 리워드 값
	 * @return 대입한 값 가져오기
	 */
	public Reward inputReward(Reward reward);
	/**
	 * 프로젝트 값 생성
	 * @param reward - 프로젝트 번호를 가진 reward
	 * @return 프로젝트 리턴
	 */
	public Project getProject(Reward reward);
	/**
	 * 리워드 삭제
	 * @param reward - 리워드 삭제 번호
	 */
	public void removeReward(Reward reward);
	/**
	 * 리워드 상태 변경
	 * @param reward - 리워드 상태 변경
	 */
	public void updateRewardState(Reward reward);

}
