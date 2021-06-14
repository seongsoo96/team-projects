package ppeonfun.dao.user.maker.news;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.News;
import ppeonfun.dto.NewsFile;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

@Repository("user.maker.NewsDao")
public interface NewsDao {
	/**
	 * 전체 새소식 개수 반환
	 * @param map - 페이징 및 프로젝트 개수
	 * @return 전체 새소식 개수 반환
	 */
	public int selectCntAll(HashMap<String, Object> map);
	/**
	 * 전체 새소식 반환
	 * @param map - 페이징 객체
	 * @return 전체 새소식 반환
	 */
	public List<News> selectAll(HashMap<String, Object> map);
	/**
	 * 프로젝트 소유자 이름 가져오기
	 * @param project - 프로젝트 
	 * @return 소유자 이름
	 */
	public String selectByName(Project project);
	
	/**
	 * 프로젝트 조회
	 * @param project - 프로젝트
	 * @return 프로젝트 조회
	 */
	public Project selectProject(Project project);
	
	/**
	 * 새소식 정보 삽입
	 * @param news - 새소식 정보
	 */
	public void insertNews(News news);
	
	/**
	 * 오픈 날짜 가져오기
	 * @param news - 프로젝트 번호
	 * @return 오픈날짜
	 */
	public Date selectByOpenDate(News news);
	
	/**
	 * 새소식 파일 가져오기
	 * @param newsFile - 새소식 파일
	 */
	public void insertNewsFile(NewsFile newsFile);
	
	/**
	 * 새소식 가져오기
	 * @param news - 새소식 
	 * @return 새소식 
	 */
	public News selectNews(News news);
	
	/**
	 * 새소식 파일 정보 가져오기
	 * @param news - 새소식 파일 
	 * @return 새소식 파일 목록
	 */
	public List<NewsFile> selectNewsFile(News news);
	
	/**
	 * DB에 새소식 파일 삭제
	 * @param newsFile - 새소식 파일 삭제
	 */
	public void deleteNewsFile(NewsFile newsFile);
	
	/**
	 * 새소식 파일 업데이트
	 * @param news - 새소식
	 */
	public void updateNews(News news);
	/**
	 * 새소식 정보 삭제
	 * @param news -  새소식
	 */
	public void deleteNews(News news);
	
}
