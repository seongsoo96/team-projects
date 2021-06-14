package ppeonfun.service.user.open;

import java.util.List;

import ppeonfun.dto.Information;
import ppeonfun.util.Paging;

public interface OpenService {
	/**
	 * 페이징 데이터 반환
	 * @param inData - 페이징 객체
	 * @return - 페이징 생성
	 */
	public Paging getPaging(Paging inData);
	/**
	 * 페이징 데이터
	 * @param paging - 페이징 객체
	 * @return - 페이징을 활용한 리스트
	 */
	public List<Information> selectAllProject(Paging paging);
}
