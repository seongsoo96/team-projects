package ppeonfun.dao.admin.reward;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Project;
import ppeonfun.dto.Reward;

@Repository("admin.RewardDao")
public interface RewardDao {
	/**
	 * 상태값 반환
	 * @param project - 프로젝트 번호
	 * @return - 프로젝트 상태값
	 */
	public Project selectByState(Project project);
	/**
	 * 값이 존재하는지 여부를 반환
	 * @param int - 값이 존재하면 1이상이 반환된다
	 * @return - 값이 있는지 여부
	 */
	public int selectIsReward(Project project);
	/**
	 * 프로젝트 소유자 반환
	 * @param project - 프로젝트 번호 
	 * @return 프로젝트 소유자
	 */

	public String selectByName(Project project);
	/**
	 * 리워드 반환
	 * @param project - 프로젝트 번호
	 * @return 리워드 리스트 반환 
	 */
	public List<Reward> selectRewardList(Project project);

}
