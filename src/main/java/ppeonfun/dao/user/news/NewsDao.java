package ppeonfun.dao.user.news;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

@Repository("user.NewsDao")
public interface NewsDao {

	public Information selectInfo(Information info);

	public int selectCntSupporter(Supporter supporter);

	public int selectRemainDay(SupporterJoin suJoin);

	public int selectTotalAmount(SupporterJoin suJoin);

	/**
	 * 새소식 리스트 검색
	 * 
	 * @param new - pNo를 가지고 있는 새소식 객체
	 * @return
	 */
	public List<News> selectList(News news);

	/**
	 * 게시물 상세보기
	 * 
	 * @param news
	 * @return
	 */
	public News selectByNno(News news);

	/**
	 * 새소식 총 개수 구하기
	 * 
	 * @param news
	 * @return
	 */
	public int selectCntNews(News news);

}
