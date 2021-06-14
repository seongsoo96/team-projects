package ppeonfun.service.user.news;

import java.util.List;

import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

public interface NewsService {

	public Information projectInfo(Information info);

	public int totalCount(Supporter supporter);

	public int remainDay(SupporterJoin suJoin);

	public int amount(SupporterJoin suJoin);

	/**
	 * 새소식 리스트 검색
	 * 
	 * @param news
	 * @return
	 */
	public List<News> getList(News news);

	/**
	 * 새소식 상세보기, 자세한 정보
	 * 
	 * @param news
	 * @return
	 */
	public News view(News news);

	/**
	 * 새소식 총 개수 구하기
	 * 
	 * @param news
	 * @return
	 */
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
