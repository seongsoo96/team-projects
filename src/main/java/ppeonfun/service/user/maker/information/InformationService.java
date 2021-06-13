package ppeonfun.service.user.maker.information;

import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Information;
import ppeonfun.dto.Project;

public interface InformationService {

	/**
	 * 프로젝트 상태 반환
	 * @param project - 프로젝트의 상태를 반환한다 
	 * @return 프로젝트의 상태 반환
	 */
	public Project projectState(Project project);
	
	/**
	 * 기본정보의 데이터 가 존재 하는지 안 하는지
	 * @param project - 프로젝트의 번호
	 * @return 기본정보의 상태값 반환
	 */
	public boolean informationState(Project project);
	
	/**
	 * 프로젝트 소유자 이름 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);

	/**
	 * 기본 정보 반환
	 * @param project - 프로젝트 기본 정보
	 * @return 기본요건 반환
	 */
	public Information viewInformation(Project project);
	
	/**
	 * 기본 정보 저장
	 * @param information - 기본 정보
	 * @param file - 파일
	 */
	
	public void inputInformationFile(Information information, MultipartFile file);
	
	/**
	 * 기본 정보 번호 가져오기
	 * @param information - 기본 정보 프로젝트 번호
	 * @return 기본 정보 번호을 포함한 객체 가져오기
	 */
	
	public Information getInformation(Information information);
	/**
	 * 기본 정보 프로필 파일 삭제
	 * @param storedName - 저장 이름
	 */
	public void removeFile(String storedName);
	/**
	 * 기본 정보 수정
	 * @param information - 기본 정보 
	 * @param file - 파일 재업로드
	 */
	public void modifyInformationFile(Information information, MultipartFile file);
	/**
	 * 프로젝트 정보 조회
	 * @param project - 프로젝트 번호
	 * @return - 프로젝트 정보 조회
	 */
	public Project viewProject(Project project);

}
