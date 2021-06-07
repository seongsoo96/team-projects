package ppeonfun.dao.user.story;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Information;
import ppeonfun.dto.News;
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
	public int selectCntSupporter(Supporter supporter);

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
	public int selectTotalAmount(SupporterJoin suJoin);

	public int selectCntNews(News news);

}
