package ppeonfun.service.admin.story;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Project;
import ppeonfun.dto.Story;

public interface StoryService {
	/**
	 * 프로젝트 상태 반환
	 * @param project - 프로젝트의 상태를 반환한다 
	 * @return 프로젝트의 상태 반환
	 */
	public Project projectState(Project project);
	
	/**
	 * 스토리의 데이터 가 존재 하는지 안 하는지
	 * @param project - 프로젝트의 번호
	 * @return 스토리의 상태값 반환
	 */
	public boolean storyState(Project project);
	/**
	 * 프로젝트 소유자 이름 반환
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);
	/**
	 * 스토리 반환
	 * @param project - 프로젝트 기본 정보
	 * @return 스토리 반환
	 */
	public Story viewStory(Project project);
	/**
	 * url 변경
	 * @param sUrl - URL 변경
	 * @return 변경된 URL
	 */
	public String convartUrl(String sUrl);
	
	/**
	 * story value값 삽입
	 * @param story - 스토리값 
	 * @param fileList - 파일리스트
	 */

	public void inputStoryFile(Story story, List<MultipartFile> fileList);

}
