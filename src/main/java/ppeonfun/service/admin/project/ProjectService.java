package ppeonfun.service.admin.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import ppeonfun.dto.Message;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

public interface ProjectService {

	/**
	 * 페이징 객체 반환
	 * @param inData - 페이징 데이터
	 * @return 페이징 객체 반환
	 */
	public Paging getPaging(Paging inData);
	/**
	 * 페이징된 프로젝트 반환
	 * @param paging - 페지이 객체
	 * @return 프로젝트 반환
	 */
	public List<Project> selectAllProject(Paging paging);
	
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
	
	/**
	 * 채팅방 개설 및 메시지 보내기
	 * @param project - 프로젝트 번호
	 * @param session 
	 */
	public void messageSend(Project project, HttpSession session);
	/**
	 * 프로젝트 승인
	 * @param project - 프로젝트 승인
	 */
	public void approveProject(Project project);
	
	/**
	 * 프로젝트 거부
	 * @param project - 프로젝트 거부
	 */
	public void rejectProject(Project project);
	
	/**
	 * 메시지 보내기
	 * @param project - 프로젝트 번호
	 * @param session - 세션의 저장되어 있는 mNo
 	 * @param message - 메시지 내용
	 */
	public void messageSend(Project project, HttpSession session, Message message);
	
	
	
}
