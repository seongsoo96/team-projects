package ppeonfun.dao.admin.requirement;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Project;
import ppeonfun.dto.Requirement;
import ppeonfun.dto.RequirementFile;

@Repository("admin.RequirementDao")
public interface RequirementDao {
	/**
	 * 상태값 반환
	 * @param project - 프로젝트 번호
	 * @return - 프로젝트 상태값
	 */
	public Project selectByState(Project project);
	/**
	 * 값이 존재하는지 여부를 반환
	 * @param int - 값이 존재하면 1이상이 반환된다
	 * @return - 값이 있는지 여부
	 */
	public int selectIsRequirement(Project project);
	
	/**
	 * 프로젝트 소유자 반환
	 * @param project - 프로젝트 번호 
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	
	/**
	 * 기본 요건 반환
	 * @param project - 프로젝트 번호
	 * @return 기본 요건
	 */
	public Requirement selectRequirement(Project project);
	
	/**
	 * 기본 요건 저장
	 * @param requirement - 기본 요건값
	 */
	public void insertRequirement(Requirement requirement);
	
	/**
	 * 기본 요건 파일 저장
	 * @param requirementFile - 기본 요건 파일 정보
	 */
	public void insertRequirementFile(RequirementFile requirementFile);
	
	/**
	 * 기본 요건의 상태에 따른 프로젝트 상태 변화
	 * @param requirement - 프로젝트 번호
	 */
	public void updateProjectState(Requirement requirement);
	
	/**
	 * 기본 요건 파일 반환
	 * @param requirement - 기본 요건 번호
	 * @return 기본 요건 파일 정보 반환
	 */
	public RequirementFile selectRequirementFile(Requirement requirement);
	
	/**
	 * 기본 요건 파일 업데이트
	 * @param requirement - 기본 요건 번호
	 */
	public void updateRequirement(Requirement requirement);
	
	/**
	 * DB에 파일 정보 삭제
	 * @param requirement - requirement 정보
	 */
	public void deleteRequirementFile(Requirement requirement);
	
	

}
