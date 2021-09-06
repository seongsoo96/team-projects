package ppeonfun.dao.admin.quartz;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Project;

@Repository("admin.quartz")
public interface QuartzDao {
	/**
	 * 오늘 시작할 프로젝트 목록
	 * @return - 프로젝트 목록
	 */
	public List<Project> selectStartProejct();

	/**
	 * 프로젝트 시작으로 상태 변경
	 * @param project - 프로젝트
	 */
	public void updateStart(Project project);
	/**
	 * 오늘 마감되는 프로젝트 목록
	 * @return - 프로젝트 목록
	 */
	public List<Project> selectEndProejct();
	/**
	 * 프로젝트를 마감상태로 변경
	 * @param project - 프로젝트
	 */
	public void updateEnd(Project project);

}
