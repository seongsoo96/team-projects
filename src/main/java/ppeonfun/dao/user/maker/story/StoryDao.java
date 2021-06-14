package ppeonfun.dao.user.maker.story;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Project;
import ppeonfun.dto.Story;
import ppeonfun.dto.StoryFile;

@Repository("user.maker.StroyDao")
public interface StoryDao {
	/**
	 * 스토리 값이 있는지 확인
	 * @param project - 프로젝트 번호
	 * @return 스토리의 존재 유무
	 */
	public int selectIsStory(Project project);
	/**
	 * 상태값 반환
	 * @param project - 프로젝트 번호
	 * @return - 프로젝트 상태값
	 */
	public Project selectByState(Project project);
	/**
	 * 프로젝트 소유자 반환
	 * @param project - 프로젝트 번호 
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	/**
	 * 프로젝트 스토리 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 스토리
	 */
	public Story selectStory(Project project);
	
	/**
	 * 프로젝트 스토리 값 삽입
	 * @param story - 스토리
	 */
	public void insertStory(Story story);
	
	/**
	 * 프로젝트 스토리 파일 값 삽입
	 * @param storyFile - 스토리 파일
	 */
	public void insertStoryFile(StoryFile storyFile);
	/**
	 * 프로젝트 상태 변경
	 * @param story - 스토리 값
	 */
	public void updateProjectState(Story story);
	
	/**
	 * 프로젝트 스토리 
	 * @param story - 스토리 번호
	 * @return - 스토리 파일
	 */
	public List<StoryFile> selectAllStroyFile(Story story);
	/**
	 * 프로젝트 스토리 파일 삭제
	 * @param storyFile - 프로젝트 스토리파일
	 */
	public void deleteStoryFile(StoryFile storyFile);
	
	/**
	 * 프로젝트 스토리 수정
	 * @param story - 스토리 수정
	 */
	public void modifyStory(Story story);
	
	/**
	 * 프로젝트 정보 조회
	 * @param project - 프로젝트 정보
	 * @return 프로젝트 반환
	 */
	public Project selectProject(Project project);
	
	
	
}
