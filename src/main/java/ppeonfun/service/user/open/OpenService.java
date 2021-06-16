package ppeonfun.service.user.open;

import java.util.List;

import ppeonfun.dto.Information;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

public interface OpenService {
	/**
	 * 페이징 데이터 반환
	 * @param inData - 페이징 객체
	 * @return - 페이징 생성
	 */
	public Paging getPaging(Paging inData);
	/**
	 * 페이징 데이터
	 * @param paging - 페이징 객체
	 * @return - 페이징을 활용한 리스트
	 */
	public List<Information> selectAllProject(Paging paging);
	
	/**
	 * 기본 정보 가져오기
	 * @param project - 프로젝트 번호
	 * @return 기본정보 반환
	 */
	public Information viewInformation(Project project);
	
	/**
	 * 알람 여부 체크
	 * @param project - 프로젝트
	 * @param mNo - 회원번호
	 * @return 알림 여부
	 */
	public boolean checkAlarm(Project project, int mNo);
	
	/**
	 * 알림 신청 하기
	 * @param project - 프로젝트 번호
	 * @param mNo - 회원번호
	 */
	public void inputArarm(Project project, int mNo);
	
	/**
	 * 알림 취소 하기
	 * @param project - 프로젝트 번호
	 * @param mNo - 회원번호
	 */
	public void removeArarm(Project project, int mNo);
}
