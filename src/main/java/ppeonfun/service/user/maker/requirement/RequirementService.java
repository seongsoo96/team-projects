package ppeonfun.service.user.maker.requirement;

import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Project;
import ppeonfun.dto.Requirement;
import ppeonfun.dto.RequirementFile;

public interface RequirementService {
	
	/**
	 * 프로젝트 상태 반환
	 * @param project - 프로젝트의 상태를 반환한다 
	 * @return 프로젝트의 상태 반환
	 */
	public Project projectState(Project project);
	/**
	 * 기본요건의 데이터 가 존재 하는지 안 하는지
	 * @param project - 프로젝트의 번호
	 * @return 기본요건의 상태값 반환
	 */
	public boolean requirementState(Project project);
	/**
	 * 프로젝트 소유자 이름 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	
	/**
	 * 기본 요건 반환
	 * @param project - 프로젝트 번호
	 * @return 기본요건 반환
	 */
	
	public Requirement viewRequirement(Project project);
	
	/**
	 * 기본 요건 반환
	 * @param file - 기본 요건 파일
	 */
	public void inputRequirementFile(Requirement requirement,MultipartFile file);
	
	/**
	 * 기본 요건 파일 반환
	 * @param requirement - 기본요건 번호
	 * @return 기본 요건 파일 반환
	 */
	public RequirementFile viewRequirementFile(Requirement requirement);
	
	/**
	 * 파일 삭제
	 * @param storedName - 파일 삭제 이름
	 * @param requirement - DB에 파일 삭제
	 */
	public void removeFile(String storedName, Requirement requirement);
	
	/**
	 * 파일 수정
	 * @param requirement - 파일 수정 번호
	 * @param file - 파일
	 */
	public void modifyRequirementFile(Requirement requirement, MultipartFile file);
	
	/**
	 * 기본 요건 정보 가져오기
	 * @param requirement - 프로젝트 번호로 조회
	 * @return - 기본 요건
	 */
	public Requirement getRequirement(Requirement requirement);
	
	/**
	 * 프로젝트의 정보 조회
	 * @param project
	 * @return 프로젝트 정보 조회
	 */
	public Project viewProject(Project project);
	
}
