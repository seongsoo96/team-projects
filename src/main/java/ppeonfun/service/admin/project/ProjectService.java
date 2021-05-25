package ppeonfun.service.admin.project;

import java.util.List;

import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

public interface ProjectService {

	/**
	 * 페이징 객체 반환
	 * @param inData - 페이징 데이터
	 * @return 페이징 객체 반환
	 */
	public Paging getPaging(Paging inData);
	/**
	 * 페이징된 프로젝트 반환
	 * @param paging - 페지이 객체
	 * @return 프로젝트 반환
	 */
	public List<Project> selectAllProject(Paging paging);

}
