package ppeonfun.service.user.maker.news;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.News;
import ppeonfun.dto.NewsFile;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

public interface NewsService {
	/**
	 * 페이징 객체 반환
	 * @param inData - 페이징 데이터
	 * @param project 
	 * @return 페이징 객체 반환
	 */
	public Paging getPaging(Paging inData, Project project);
	/**
	 * 페이징된 새소식 반환
	 * @param paging - 페지이 객체
	 * @param project 
	 * @return 프로젝트 반환
	 */
	public List<News> selectAllNews(Paging paging, Project project);
	
	/**
	 * 이름 가져오기
	 * @param project - 프로젝트 이름
	 * @return 이름
	 */
	public String selectByName(Project project);
	
	/**
	 * 프로젝트 조회
	 * @param project - 프로젝트 번호
	 * @return 이름
	 */
	public Project viewProject(Project project);
	
	/**
	 * 새소식 데이터 삽입 
	 * @param news - 새소식 데이터
	 * @param fileList - 새소식 파일목록
	 */
	public void inputNewsFile(News news, List<MultipartFile> fileList);
	
	/**
	 * 오픈날짜 불러오기
	 * @param news - 새소식
	 * @return - 오픈날짜
	 */
	public Date selectByOpenDate(News news);
	
	/**
	 * 새소식 가져오기
	 * @param news - 새소식 번호로 조회 
	 * @return 새소식 정보 반환
	 */
	public News viewNews(News news);
	
	/**
	 * 새소식 파일 가져오기 
	 * @param news - 새소식 파일 가져오기
	 * @return 새소식 파일 정보들
	 */
	public List<NewsFile> viewNewsList(News news);
	
	/**
	 * 프로젝트 번호 삽입
	 * @param news - 프로젝트 번호 
	 * @return 프로젝트 번호
	 */
	public Project getProject(News news);
	
	/**
	 * 새소식 수정
	 * @param news - 정보 수정
	 * @param fileList - 파일 수정
	 */
	public void modifyNewsFile(News news, List<MultipartFile> fileList);
	
	/**
	 * 새소식 파일 삭제 
	 * @param news - news 파일 삭제
	 * @param newsFile - 실질적 파일 삭제
	 */
	public void removeFile(News news, List<NewsFile> newsFile);
	
	/**
	 * 새소식 데이터 삭제
	 * @param news - 삭제할 새소식 데이터
	 */
	public void removeNewsFile(News news);
}
