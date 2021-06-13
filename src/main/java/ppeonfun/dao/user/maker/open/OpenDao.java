package ppeonfun.dao.user.maker.open;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Information;
import ppeonfun.dto.Maker;
import ppeonfun.dto.Project;
import ppeonfun.dto.Requirement;
import ppeonfun.dto.RequirementFile;
import ppeonfun.dto.Reward;
import ppeonfun.dto.Story;
import ppeonfun.dto.StoryFile;
import ppeonfun.util.Paging;

@Repository("user.maker.OpenDao")
public interface OpenDao {
	/**
	 * 프로젝트 소유자 이름 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 소유자 이름 반환
	 */
	public String selectByName(Project project);
	/**
	 * 프로젝트 정보 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 정보
	 */
	public Project selectProject(Project project);
	/**
	 * 기본 요건 반환
	 * @param project - 프로젝트에 따른 기본 요건 반환
	 * @return 기본 요건
	 */
	public Requirement selectRequirement(Project project);
	/**
	 * 기본 요건 파일 반환
	 * @param requirement - 기본요건 번호 
	 * @return 기본 요건 파일 반환
	 */
	public RequirementFile selectRequirementFile(Requirement requirement);
	
	/**
	 * 기본 정보 조회
	 * @param project - 프로젝트 조회
	 * @return 기본 정보 반환
	 */
	public Information selectInformation(Project project);
	/**
	 * 스토리 정보 반환
	 * @param project - 프로젝트 번호
	 * @return - 스토리 정보 반환
	 */
	public Story selectStory(Project project);
	
	/**
	 * 스토리 관련 파일 반환
	 * @param story - 스토리 번호
	 * @return - 스토리 파일 반환
	 */
	public List<StoryFile> selectStoryFile(Story story);
	
	/**
	 * 리워드 목록 가져오기
	 * @param project - 프로젝트 번호
	 * @return - 리워드 목록
	 */
	public List<Reward> selectAllReward(Project project);
	
	/**
	 * 메이커 조회
	 * @param project - 프로젝트 번호
	 * @return - 메이커 조회
	 */
	public Maker selectMaker(Project project);
	
	/**
	 * 페이징을 적용한 전체 개수
	 * @param project - 검색정보
	 * @return 전체값
	 */
	public int selectCntAll(Project project);
	
	/**
	 * 페이징을 적용한 알림
	 * @param map - 페이징 알람
	 * @return 리스트값
	 */
	public List<HashMap<String, Object>> selectAllAlarm(HashMap<String, Object> map);
	
}
