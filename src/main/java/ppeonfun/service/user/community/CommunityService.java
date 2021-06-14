package ppeonfun.service.user.community;

import java.util.List;

import ppeonfun.dto.Community;
import ppeonfun.dto.CommunityJoin;
import ppeonfun.dto.Favorite;
import ppeonfun.dto.Information;
import ppeonfun.dto.News;
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


}
