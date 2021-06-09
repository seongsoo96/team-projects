package ppeonfun.dao.admin.project;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.ChatParticipant;
import ppeonfun.dto.ChatRoom;
import ppeonfun.dto.Information;
import ppeonfun.dto.Message;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

@Repository("admin.ProjectDao")
public interface ProjectDao {
	/**
	 * 페이징된 프로젝트 리스트 반환
	 * @param paging - 페이징 객체
	 * @return - 프로젝리 리스트 반환
	 */
	public List<Project> selectAll(Paging paging);

	/**
	 * 프로젝트 전체 개수 반환
	 * @param inData - 페이징 처리
	 * @return - int 전체 개수 반환
	 */
	
	public int selectCntAll(Paging inData);
	/**
	 * 프로젝트 소유자 반환
	 * @param project - 프로젝트 번호 
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	/**
	 * 프로젝트 조회 
	 * @param project - 프로젝트 번호 
	 * @return 프로젝트 번호에 따른 조회
	 */
	public Project selectProject(Project project);
	
	/**
	 * 프로젝트 삽입
	 * @param project - 프로젝트를 삽입할 객체
	 */
	public void insertProject(Project project);
	/**
	 * 프로젝트 submit상태로 수정
	 * @param project - 프로젝트를 s상태로 수정
	 */
	public void updateSubmit(Project project);
	/**
	 * 채팅방 생성
	 * @param chatRoom - 채팅방 생생
	 */
	public void insertChatRoom(ChatRoom chatRoom);
	/**
	 * 채팅방 참여
	 * @param chatParticipant - 참여자 정보
	 */
	public void insertChatParticipant(ChatParticipant chatParticipant);
	/**
	 * 메시지 입력
	 * @param message - 메시지
	 */
	public void insertMessage(Message message);
	/**
	 * 기본정보 불러오기
	 * @param project - 프로젝트 번호
	 * @return - 기본정보 조회
	 */
	public Information selectInformation(Project project);
	/**
	 * 기본정보 업데이트
	 * @param information - 시작 정보 변경
	 */
	public void updateInformation(Information information);
	
	
}
