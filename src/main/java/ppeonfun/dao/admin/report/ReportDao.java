package ppeonfun.dao.admin.report;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Project;
import ppeonfun.dto.Report;
import ppeonfun.util.Paging;

@Repository("admin.ReportDao")
public interface ReportDao {
	/**
	 * 신고의 전체 개수 반환
	 * @param inData - 페이징 처리
	 * @return - int 전체 개수 반환
	 */
	public int selectCntAll(Paging inData);
	/**
	 * 페이징 처리된 신고 목록
	 * @param paging - 페이징 데이터 
	 * @return - 전체 리스트 반환
	 */
	public List<HashMap<String, Object>> selectAll(Paging paging);
	
	
	/**
	 * 신고 조회
	 * @param report - 신고 번호
	 * @return - 신고목록 조회
	 */
	public HashMap<String, Object> selectReport(Report report);
	/**
	 * 신고 상태 변경
	 * @param report - 신고 번호
	 */
	public void updateReport(Report report);
	/**
	 * 프로젝트 경고 횟수 증가
	 * @param report - 프로젝트 번호
	 */
	public void updateProject(Report report);
	
	/**
	 * 프로젝트 개설자 경고 횟수 증가
	 * @param report - 개설자 번호
	 */
	public void updateMember(Report report);
	
	/**
	 * 신고 삭제
	 * @param report - 신고 번호
	 */
	public void deleteReport(Report report);
	
	/**
	 * 프로젝트 총 개수 구하기
	 * @param inData - 페이징
	 * @return 프로젝트 관련 총 개수
	 */
	public int selectCntAllProject(Paging inData);
	/**
	 * 프로젝트 구하기
	 * @param paging - 페이징
	 * @return 모든 프로젝트
	 */
	public List<HashMap<String, Object>> selectAllProject(Paging paging);
	
	/**
	 * 프로젝트 검색
	 * @param project - 프로젝트 번호
	 * @return 검색된 프로젝트 반환
	 */
	public HashMap<String, Object> selectProject(Project project);
	
	/**
	 * 신고 등록
	 * @param report - 신고 등록
	 */
	public void insertReport(Report report);
	
}
