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

}
