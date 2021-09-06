package ppeonfun.service.user.maker.project;

import java.util.List;

import ppeonfun.dto.Information;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

public interface ProjectService {
	/**
	 * 페이징 데이터 반환
	 * @param inData - 페이징 객체
	 * @param mNo - 회원 번호
	 * @param type - 조회 타입
	 * @return - 페이징 생성
	 */
	public Paging getPaging(Paging inData, int mNo, String type);
	/**
	 * 페이징 데이터
	 * @param paging - 페이징 객체
	 * @param mNo -회원 번호
	 * @param type - 조회 타입
	 * @return - 페이징을 활용한 리스트
	 */
	public List<Information> selectAllProject(Paging paging, int mNo, String type);
	
	/**
	 * 프로젝트 소유자 이름 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	/**
	 * 프로젝트 
	 * @param project
	 * @return
	 */
	public Project selectProject(Project project);
	
	/**
	 * 생성한 프로젝트 반환
	 * @param mNo - 생성자 번호
	 * @return - 생성한 프로젝트 반환
	 */
	public Project input(int mNo);
	
	/**
	 * 프로젝트 제출 상태로 변환
	 * @param project - 수정할 프로젝트
	 * @return 프로젝트 반환
	 */
	public Project submitProject(Project project);

}
