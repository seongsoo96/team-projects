package ppeonfun.dao.user.community;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

@Repository("user.CommunityDao")
public interface CommunityDao {

	public Information selectInfo(Information info);

	public int selectCntSupporter(Supporter supporter);

	public int selectRemainDay(SupporterJoin suJoin);

	public int selectTotalAmount(SupporterJoin suJoin);

	public int selectCntNews(News news);

}
