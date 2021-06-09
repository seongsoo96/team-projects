package ppeonfun.service.user.story;

import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

public interface StoryService {

	/**
	 * 프로젝트 정보 (제목, 카테고리, 목표금액)
	 * 
	 * @param info
	 * @return
	 */
	public Information projectInfo(Information info);

	/**
	 * 해당 프로젝트의 총 서포트 수
	 * 
	 * @param supporter
	 * @return
	 */
	public int totalCount(Supporter supporter);

	/**
	 * 프로젝트 남은 일수 계산
	 * 
	 * @param suJoin
	 * @return
	 */
	public int remainDay(SupporterJoin suJoin);

	/**
	 * 총 달성액
	 * 
	 * @param suJoin
	 * @return
	 */
	public int amount(SupporterJoin suJoin);

	public int newsCount(News news);

	/**
	 * 추천 상태 확인
	 * 
	 * @param favorite
	 * @return
	 */
	public boolean isFav(Favorite favorite);

	/**
	 * 해당 프로젝트의 총 찜된 횟수 구하기
	 * 
	 * @param favorite
	 * @return
	 */
	public int getTotalCntFavorite(Favorite favorite);

	/**
	 * 찜 상태 확인 후 하트 상태 변경
	 * 
	 * @param favorite
	 * @return
	 */
	public boolean favorite(Favorite favorite);

}
