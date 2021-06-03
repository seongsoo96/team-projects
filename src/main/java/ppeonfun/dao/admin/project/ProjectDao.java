package ppeonfun.dao.admin.project;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

@Repository("admin.ProjectDao")
public interface ProjectDao {
	/**
	 * 페이징된 프로젝트 리스트 반환
	 * @param paging - 페이징 객체
	 * @return - 프로젝리 리스트 반환
	 */
	public List<Project> selectAll(Paging paging);

	/**
	 * 프로젝트 전체 개수 반환
	 * @return - int 전체 개수 반환
	 */
	
	public int selectCntAll();
	/**
	 * 프로젝트 소유자 반환
	 * @param project - 프로젝트 번호 
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	/**
	 * 프로젝트 조회 
	 * @param project - 프로젝트 번호 
	 * @return 프로젝트 번호에 따른 조회
	 */
	public Project selectProject(Project project);
	
	/**
	 * 프로젝트 삽입
	 * @param project - 프로젝트를 삽입할 객체
	 */
	public void insertProject(Project project);
	
	
}
