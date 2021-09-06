package ppeonfun.dao.user.rank;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Rank;

@Repository("user.RankDao")
public interface RankDao {
	/**
	 * 프로젝트번호와 비율 반환
	 * @return 전체 비율 반환
	 */
	public List<Rank> selectAllRank();
	/**
	 * 좋아요 개수 반환
	 * @param rank - 프로젝트 번호
	 * @return 좋아요 개수
	 */
	public int selectFavoriteCount(Rank rank);
	
	/**
	 * 서포터 인원 수 반환
	 * @param rank - 프로젝트 번호
	 * @return 서포터 인원수
	 */
	public int selectSupporterCount(Rank rank);
	
	/**
	 * 저장된 이미지 이름 가져오기
	 * @param rank - 프로젝트 번호
	 * @return
	 */
	public String selectIStoredName(Rank rank);

}
