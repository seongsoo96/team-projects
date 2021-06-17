package ppeonfun.service.admin.report;

import java.util.HashMap;
import java.util.List;

import ppeonfun.dto.Project;
import ppeonfun.dto.Report;
import ppeonfun.util.Paging;

public interface ReportService {
	/**
	 * 페이징 정보 불러오기
	 * @param inData - 페이징 데이터
	 * @return 페이징 
	 */
	public Paging getPaging(Paging inData);
	/**
	 * 페이징 처리된 신고 목록 불러오기
	 * @param paging - 페이징
	 * @return 신고목록
	 */
	public List<HashMap<String, Object>> listReport(Paging paging);
	
	/**
	 * 신고의 상세 조회
	 * @param report - 신고
	 * @return 신고 조회
	 */
	public HashMap<String, Object> viewReport(Report report);
	
	/**
	 * 신고 승인
	 * @param report - 승인 번호
	 */
	public void approveReport(Report report);
	
	/**
	 * 신고 거부
	 * @param report - 거부 번호
	 */
	public void rejectReport(Report report);
	
	/**
	 * 페이징 구하기
	 * @param inData - 페이징 데이터
	 * @return 페이징 
	 */
	public Paging getPagingProject(Paging inData);
	
	/**
	 * 페이징 처리된 프로젝트 구하기
	 * @param paging - 페이징
	 * @return 리스트
	 */
	public List<HashMap<String, Object>> searchProject(Paging paging);
	
	/**
	 * 프로젝트 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 반환
	 */
	public HashMap<String, Object> viewProject(Project project);
	
	/**
	 * 신고 등록
	 * @param report - 신고를 등록한다
	 * @return 
	 */
	public int inputReport(Report report);
	
	

}
