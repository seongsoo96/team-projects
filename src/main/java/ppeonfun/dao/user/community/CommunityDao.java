package ppeonfun.dao.user.community;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Community;
import ppeonfun.dto.CommunityAnswer;
import ppeonfun.dto.CommunityJoin;
import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Project;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

@Repository("user.CommunityDao")
public interface CommunityDao {

	public Information selectInfo(Information info);

	public String selectCntSupporter(Supporter supporter);

	public int selectRemainDay(SupporterJoin suJoin);

	public String selectTotalAmount(SupporterJoin suJoin);

	public int selectCntNews(News news);

	public int selectCntFavorite(Favorite favorite);

	public void deleteFavorite(Favorite favorite);

	public void insertFavorite(Favorite favorite);

	/**
	 * 해당 프로젝트의 커뮤니티 질문,답변 검색
	 * 
	 * @param communityJoin
	 * @return
	 */
	public List<CommunityJoin> selectList(CommunityJoin communityJoin);

	/**
	 * 커뮤니티 질문 삽입
	 * 
	 * @param community
	 * @return
	 */
	public void insertCommunity(Community community);

	public int getTotalCntFavorite(Favorite favorite);

	/**
	 * 커뮤니티 질문 총 개수 구하기
	 * 
	 * @param news
	 * @return
	 */
	public String selectCntCommunity(News news);

	/**
	 * pNo로 메이커의 mNo 가져오기
	 * 
	 * @param project
	 * @return
	 */
	public Project getMnoByPno(Project project);

	/**
	 * 커뮤니티 질문에 답변 삽입
	 * 
	 * @param communityAnswer
	 */
	public void insertAnswer(CommunityAnswer communityAnswer);

}
