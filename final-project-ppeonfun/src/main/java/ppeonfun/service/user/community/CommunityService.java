package ppeonfun.service.user.community;

import java.util.List;

import ppeonfun.dto.Community;
import ppeonfun.dto.CommunityAnswer;
import ppeonfun.dto.CommunityJoin;
import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Project;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

public interface CommunityService {

	public Information projectInfo(Information info);

	public int totalCount(Supporter supporter);

	public int remainDay(SupporterJoin suJoin);

	public int amount(SupporterJoin suJoin);

	public int newsCount(News news);

	public boolean isFav(Favorite favorite);

	public int getTotalCntFavorite(Favorite favorite);

	public boolean favorite(Favorite favorite);

	/**
	 * 커뮤니티 질문, 답변 리스트
	 * 
	 * @param communityJoin - pNo를 가지고있는 객체
	 * @return
	 */
	public List<CommunityJoin> commuList(CommunityJoin communityJoin);

	/**
	 * 질문 내용 삽입
	 * 
	 * @param community
	 * @return
	 */
	public void writeCommunity(Community community);

	/**
	 * 커뮤니티 질문 총 개수
	 * 
	 * @param news
	 * @return
	 */
	public int communityCnt(News news);

	/**
	 * 해당 프로젝트의 메이커 mNo 정보
	 * 
	 * @param project
	 * @return
	 */
	public Project getMakerMno(Project project);

	/**
	 * 답변 삽입
	 * 
	 * @param communityAnswer
	 */
	public void writeAnswer(CommunityAnswer communityAnswer);


}
