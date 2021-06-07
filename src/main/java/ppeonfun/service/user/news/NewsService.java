package ppeonfun.service.user.news;

import java.util.List;

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

}
