package ppeonfun.dao.user.news;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;
import ppeonfun.util.ProjectPaging;

@Repository("user.NewsDao")
public interface NewsDao {

	public Information selectInfo(Information info);

	public String selectCntSupporter(Supporter supporter);

	public int selectRemainDay(SupporterJoin suJoin);

	public String selectTotalAmount(SupporterJoin suJoin);

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

	/**
	 * 사용자가 해당 프로젝트 찜 했는지 조회
	 * 
	 * @param favorite - 사용자, 프로젝트 정보 가진 객체
	 * @return 1 - 찜X, 0 - 찜
	 */
	public int selectCntFavorite(Favorite favorite);

	/**
	 * 프로젝트의 전체 좋아요 수 조회
	 * 
	 * @param favorite
	 * @return
	 */
	public int getTotalCntFavorite(Favorite favorite);

	/**
	 * 찜(좋아요) 상태 지우기
	 * 
	 * @param favorite
	 */
	public void deleteFavorite(Favorite favorite);

	/**
	 * 찜(좋아요) 상태 넣기
	 * 
	 * @param favorite
	 */
	public void insertFavorite(Favorite favorite);

	public String selectCntCommunity(News news);

	/**
	 * 전체 게시글 수
	 * 
	 * @param inDate
	 * @return
	 */
//	public int selectCntNews(ProjectPaging inDate);

}
