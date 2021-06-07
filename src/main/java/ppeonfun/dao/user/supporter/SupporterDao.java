package ppeonfun.dao.user.supporter;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Information;
import ppeonfun.dto.News;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

@Repository("user.SupporterDao")
public interface SupporterDao {

	/**
	 * pNo로 총 서포터 수 검색
	 * 
	 * @param supporter
	 * @return
	 */
	public int selectCntSupporter(Supporter supporter);

	/**
	 * 서포터 리스트 검색
	 * 
	 * @param suJoin - 프로젝트 번호
	 * @return
	 */
	public List<SupporterJoin> selectList(SupporterJoin suJoin);

	/**
	 * 프로젝트 남은 날짜 계산
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

	/**
	 * 프로젝트 정보 검색
	 * 
	 * @param info
	 * @return
	 */
	public Information selectInfo(Information info);

	public int selectCntNews(News news);

}
