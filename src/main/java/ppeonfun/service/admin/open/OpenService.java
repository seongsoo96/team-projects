package ppeonfun.service.admin.open;

import java.util.HashMap;
import java.util.List;

import ppeonfun.dto.Information;
import ppeonfun.dto.Maker;
import ppeonfun.dto.Project;
import ppeonfun.dto.Requirement;
import ppeonfun.dto.RequirementFile;
import ppeonfun.dto.Reward;
import ppeonfun.dto.Story;
import ppeonfun.dto.StoryFile;
import ppeonfun.util.Paging;

public interface OpenService {
	
	/**
	 * 기본요건 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 기본 요건 반환
	 */
	
	public Requirement viewRequirement(Project project);
	/**
	 * 기본요건 파일 반환
	 * @param requirement - 기본요건 번호
	 * @return  프로젝트 기본 요건 파일 반환
	 */
	public RequirementFile viewRequirementFile(Requirement requirement);

	/**
	 * 현재 프로젝트 정보 반환 
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 정보 반환
	 */
	public Project viewProject(Project project);
	/**
	 * 프로젝트 소유자 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 소유자
	 */
	public String viewByName(Project project);
	
	/**
	 * 프로젝트 기본 정보 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 기본 정보 반환
	 */
	public Information viewInformation(Project project);
	
	/**
	 * 프로젝트 스토리 정보 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 스토리 반환
	 */
	public Story viewStory(Project project);
	
	/**
	 * 프로젝트 스토리 파일 반환
	 * @param story 스토리 번호
	 * @return 프로젝트 스토리 파일 리스트 
	 */
	public List<StoryFile> viewStoryFile(Story story);
	
	/**
	 * 프로젝트 url 변환
	 * @param sUrl - 현재 url
	 * @return 변환된 url
	 */
	public String convartUrl(String sUrl);
	
	/**
	 * 리워드 목록 불러오기
	 * @param project - 프로젝트 번호
	 * @return 리워드 목록
	 */
	public List<Reward> viewRewardList(Project project);
	
	/**
	 * 메이커 정보 불러오기
	 * @param project - 프로젝트 번호
	 * @return 메이커 조회
	 */
	public Maker viewMaker(Project project);
	
	/**
	 * 페이징 가져오기
	 * @param inData  
	 * @param project - 프로젝트 정보
	 * @return 페이징 가져오기
	 */
	public Paging getPaging(Paging inData , Project project);
	
	/**
	 * 페이징을 적용한 
	 * @param paging - 페이징 적용
	 * @param project - 프로젝트 적용
	 * @return
	 */
	public List<HashMap<String, Object>> selectAllAlarm(Paging paging, Project project);
	
}
