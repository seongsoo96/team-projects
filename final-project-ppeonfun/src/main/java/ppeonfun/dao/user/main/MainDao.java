package ppeonfun.dao.user.main;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Information;
import ppeonfun.util.Paging;

@Repository("user.MainDao")
public interface MainDao {
	/**
	 * information의 전체 리스트 개수 
	 * @return 프로젝트의 전체 개수 반환
	 */
	public int selectCntAll();
	/**
	 * information의 전체 리스트 반환
	 * @param paging
	 * @return
	 */
	public List<Information> selectAll(Paging paging);
	
	/**
	 * 좋아요 많은 순
	 * @return 5개의 리스트 반환
	 */
	public List<Information> selectInformationFavorite();

}
