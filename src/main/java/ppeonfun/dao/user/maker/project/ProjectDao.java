package ppeonfun.dao.user.maker.project;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Information;
import ppeonfun.dto.Project;

@Repository("user.maker.ProjectDao")
public interface ProjectDao {
	/**
	 * 프로젝트 전체 개수
	 * @return - 프로젝트 전체 개수 반환
	 */
	public int selectCntAll(HashMap<String, Object> map);
	/**
	 * 프로젝트 페이징이 적용된 전체 리스트 반환
	 * @param map - 페이징 
	 * @return - 리스트
	 */
	public List<Information> selectAll(HashMap<String, Object> map);
	
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
	/**
	 * 프로젝트 submit상태로 수정
	 * @param project - 프로젝트를 s상태로 수정
	 */
	public void updateSubmit(Project project);
}
