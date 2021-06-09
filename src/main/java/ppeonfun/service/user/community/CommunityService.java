package ppeonfun.service.user.community;

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

}
