package ppeonfun.dao.user.story;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Project;
import ppeonfun.dto.Report;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

@Repository("user.StoryDao")
public interface StoryDao {

	/**
	 * 프로젝트 정보 검색
	 * 
	 * @param info
	 * @return
	 */
	public Information selectInfo(Information info);

	/**
	 * pNo로 총 서포터 수 검색
	 * 
	 * @param supporter
	 * @return
	 */
	public String selectCntSupporter(Supporter supporter);

	/**
	 * 프로젝트 남은 일수 계산
	 * 
	 * @param suJoin
	 * @return
	 */
	public int selectRemainDay(SupporterJoin suJoin);

	/**
	 * 총 펀딩 액수 계산
	 * 
	 * @param suJoin
	 * @return
	 */
	public String selectTotalAmount(SupporterJoin suJoin);

	public int selectCntNews(News news);

	/**
	 * 사용자가 해당 프로젝트 찜했는지 조회
	 * 
	 * @param favorite
	 * @return
	 */
	public int selectCntFavorite(Favorite favorite);

	public void deleteFavorite(Favorite favorite);

	public void insertFavorite(Favorite favorite);

	public int getTotalCntFavorite(Favorite favorite);

	public String selectCntCommunity(News news);

	/**
	 * pno로 개설자 번호 검색
	 * 
	 * @param project
	 * @return
	 */
	public Project selectMfounderNoByPno(Project project);

	/**
	 * 신고내역 삽입
	 * 
	 * @param report
	 */
	public void insertReport(Report report);

}
