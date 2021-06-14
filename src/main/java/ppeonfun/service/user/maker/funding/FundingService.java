package ppeonfun.service.user.maker.funding;

import java.util.HashMap;
import java.util.List;

import ppeonfun.dto.Project;

public interface FundingService {
	/**
	 * 통계값 가져오기
	 * @param proejct - 통계를 낼 프로젝트
	 * @return - 통계값
	 */
	public List<HashMap<String, Object>> viewState(Project proejct);
	/**
	 * 추가 후원 금액 불러오기
	 * @param project - 추가 후원 금액 불러오기
	 * @return - 추가 후원금액 합산을 불러온다
	 */
	public String getSuAddMoney(Project project);

}
