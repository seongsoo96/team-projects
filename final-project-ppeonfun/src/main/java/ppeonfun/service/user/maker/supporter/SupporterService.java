package ppeonfun.service.user.maker.supporter;

import java.util.HashMap;
import java.util.List;

import ppeonfun.dto.Payback;
import ppeonfun.dto.Project;
import ppeonfun.dto.Supporter;
import ppeonfun.util.Paging;

public interface SupporterService {
	/**
	 * 페이징 가져오기
	 * @param inData  
	 * @param project - 프로젝트 정보
	 * @return 페이징 가져오기
	 */
	public Paging getPaging(Paging inData, Project project);
	/**
	 * 페이징을 적용한 
	 * @param paging - 페이징 적용
	 * @param project - 프로젝트 적용
	 * @return
	 */
	public List<HashMap<String, Object>> selectAllSupportor(Paging paging, Project project);
	
	/**
	 * 서포터 보기
	 * @param supporter - 서포터 번호
	 * @return 서포터 조회
	 */
	public HashMap<String, Object> viewSupporter(Supporter supporter);
	
	/**
	 * 프로젝트 이름 조회
	 * @param object
	 * @return
	 */
	public String viewByName(int pNo);
	
	/**
	 * 프로젝트 상태 가져오기
	 * @param 프로젝트 번호
	 * @return 프로젝트 반환
	 */
	public Project viewProject(int pNo);
	
	/**
	 * 서포터 삭제하기
	 * @param suppoerter - 삭제할 서포터 번호
	 */
	public void removeSupporter(Supporter suppoerter);

	
	/**
	 * 환불 테이블 저장
	 * @param suppoerter - 서포터 정보
	 * @return 환불테이블 가져오기
	 */
	public Payback inputPayback(Supporter suppoerter);
	
	/**
	 * 서포터 정보가져오기
	 * @param suppoerter - 서포터 번호
	 * @return 서포터 DTO 정보
	 */
	public Supporter viewSupporterDto(Supporter suppoerter);

}
