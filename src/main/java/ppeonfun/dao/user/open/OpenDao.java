package ppeonfun.dao.user.open;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Alarm;
import ppeonfun.dto.Information;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

@Repository("user.OpenDao")
public interface OpenDao {
	/**
	 * 프로젝트 전체 개수
	 * @return - 프로젝트 전체 개수 반환
	 */
	public int selectCntAll(Paging paging);
	/**
	 * 프로젝트 페이징이 적용된 전체 리스트 반환
	 * @param paging - 페이징 
	 * @return - 리스트
	 */
	public List<Information> selectAll(Paging paging);
	
	/**
	 * 기본정보 반환
	 * @param project - 프로젝트 번호
	 * @return 기본정보 반환
	 */
	public Information selectInformation(Project project);
	
	/**
	 * 알림 체크
	 * @param project - 프로젝트 번호 및 회원 번호
	 * @return 알림을 신청한 여부
	 */
	public int selectCheckAlarm(Project project);
	
	/**
	 * 알람 데이터 삽입
	 * @param alarm - 알람값 삽입
	 */
	public void insertAlarm(Alarm alarm);
	
	/**
	 * 알람 데이터 삭제
	 * @param alarm - 알람값 삭제
	 */
	public void deleteAlarm(Alarm alarm);
}
