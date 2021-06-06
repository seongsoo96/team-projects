package ppeonfun.dao.admin.information;

import ppeonfun.dto.Information;
import ppeonfun.dto.Project;

public interface InformationDao {
	/**
	 * 기본정보 값이 있는지 확인
	 * @param project - 프로젝트 번호
	 * @return 기본요건의 존재 유무
	 */
	public int selectIsInformation(Project project);
	/**
	 * 상태값 반환
	 * @param project - 프로젝트 번호
	 * @return - 프로젝트 상태값
	 */
	public Project selectByState(Project project);
	
	/**
	 * 프로젝트 소유자 반환
	 * @param project - 프로젝트 번호 
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	/**
	 * 프로젝트 기본 정보 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 기본 정보
	 */
	public Information selectInformation(Project project);
	
	/**
	 * 프로젝트 기본 정보 삽입
	 * @param information - 프로젝트 기본 정보
	 */
	public void insertInformation(Information information);
	
	
	/**
	 * 프로젝트 상태 변화 시키기
	 * @param information - 프로젝트 번호
	 */
	public void updateProjectState(Information information);
	
	/**
	 * 프로젝트 기본 정보 변경
	 * @param information - 프로젝트 정보
	 */
	public void updateInformation(Information information);

	
}
