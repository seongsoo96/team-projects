package ppeonfun.dao.admin.funding;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Project;

@Repository("admin.FundingDao")
public interface FundingDao {
	/**
	 * 통계값 가져오기
	 * @param proejct - 프로젝트 번호
	 * @return 통계값 리스트로 가져오기
	 */
	public List<HashMap<String, Object>> selectState(Project proejct);
	/**
	 * 합계 금액 가져오기
	 * @param project - 프로젝트 번호
	 * @return 추가 금액 불러오기
	 */
	public String selectSuAddMoney(Project project);

}
