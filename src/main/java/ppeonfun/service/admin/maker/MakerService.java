package ppeonfun.service.admin.maker;

import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Maker;
import ppeonfun.dto.Project;

public interface MakerService {
	/**
	 * 프로젝트 상태 반환
	 * @param project - 프로젝트의 상태를 반환한다 
	 * @return 프로젝트의 상태 반환
	 */
	public Project projectState(Project project);
	/**
	 * 메이커의 데이터 가 존재 하는지 안 하는지
	 * @param project - 프로젝트의 번호
	 * @return 메이커의 상태값 반환
	 */
	public boolean makerState(Project project);
	/**
	 * 프로젝트 소유자 이름 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	/**
	 * 메이커 반환
	 * @param project - 프로젝트 번호
	 * @return 메이커 반환
	 */
	public Maker viewMaker(Project project);
	
	/**
	 * 메이커 삽입
	 * @param maker - 삽입할 메이커 정보
	 * @param file - 삽입할 메이커파일
	 */
	public void inputMaker(Maker maker, MultipartFile file);
	/**
	 * 메이커 정보 번호 가져오기
	 * @param maker - 기본 정보 프로젝트 번호
	 * @return 번호을 포함한 메이커 객체 가져오기
	 */
	
	public Maker getMaker(Maker maker);
	/**
	 * 메이커 프로필 파일 삭제
	 * @param storedName - 저장 이름
	 */
	public void removeFile(String storedName);
	/**
	 * 메이커 정보 수정
	 * @param maker - 기본 정보 
	 * @param file - 파일 재업로드
	 */
	
	public void modifyMakerFile(Maker maker, MultipartFile file);

}
