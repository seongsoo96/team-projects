package ppeonfun.service.user.rank;

import java.util.List;

import ppeonfun.dto.Rank;

public interface RankService {
	/**
	 * 1~100위까지의 현재 진행되고 있는 프로젝트의 rank를 가져온다
	 * @return 프로젝트 번호와 rate만을 가져온다
	 */
	public List<Rank> getRank();
	/**
	 * 좋아요 점수를 포함해서 score반환한다
	 * @param list 
	 * @return
	 */
	public List<Rank> getFavoirteScore(List<Rank> list);
	
	/**
	 * 후원자 인원수를 반환한다
	 * @param list
	 * @return
	 */
	public List<Rank> getSupporter(List<Rank> list);

}
