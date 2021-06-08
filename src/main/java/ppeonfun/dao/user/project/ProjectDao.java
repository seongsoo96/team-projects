package ppeonfun.dao.user.project;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Information;
import ppeonfun.util.Paging;

@Repository("user.ProjectDao")
public interface ProjectDao {
	/**
	 * 프로젝트 전체 개수
	 * @return - 프로젝트 전체 개수 반환
	 */
	public int selectCntAll(Paging paging);
	/**
	 * 프로젝트 페이징이 적용된 전체 리스트 반환
	 * @param paging - 페이징 
	 * @return - 리스트
	 */
	public List<Information> selectAll(Paging paging);

}
