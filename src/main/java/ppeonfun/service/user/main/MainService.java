package ppeonfun.service.user.main;

import java.util.List;

import ppeonfun.dto.Information;
import ppeonfun.util.Paging;

public interface MainService {
	/**
	 * 프로젝트 리스트 반환
	 * @param paging - 페이징 처리
	 * @return - 프로젝트 리스트 반환
	 */
	public List<Information> selectAllLatery(Paging paging);
	
	/**
	 * 페이징 반환
	 * @param inData - 현재 페이지
	 * @return - 페이징 반환
	 */
	
	public Paging getPaging(Paging inData);

	/**
	 * 좋아요순 5개의 데이터 반환
	 * @return
	 */
	public List<Information> selectFavorite();
	
	/**
	 * int 형으로 페이지 개수 가져오기
	 * @param curPage - 현재 페이지
	 * @return 페이징 처리
	 */
	public Paging getPaging(int curPage);
}
