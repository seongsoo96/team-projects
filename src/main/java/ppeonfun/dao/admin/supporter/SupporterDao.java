package ppeonfun.dao.admin.supporter;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Member;
import ppeonfun.dto.Payback;
import ppeonfun.dto.Payment;
import ppeonfun.dto.Project;
import ppeonfun.dto.Supporter;

@Repository("admin.SupporterDao")
public interface SupporterDao {
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
	public List<HashMap<String, Object>> selectAllSupporter(HashMap<String, Object> map);
	
	/**
	 * 서포터 조회
	 * @param supporter - 서포터 조회하기
	 * @return 서포터 조회
	 */
	public HashMap<String, Object> selectSupporter(Supporter supporter);
	
	/**
	 * 프로젝트 번호로 이름 가져오기
	 * @param pNo - 프로젝트 번호
	 * @return 소유자 이름
	 */
	public String selectByName(int pNo);
	
	/**
	 * 프로젝트 번호로 프로젝트 상태 가져오기
	 * @param pNo - 프로젝트 번호
	 * @return 프로젝트 정보 반환
	 */
	public Project selectProject(int pNo);
	
	/**
	 * 삭제할 서포터
	 * @param suppoerter - 서포터 정보
	 */
	public void deleteSupporter(Supporter suppoerter);
	
	/**
	 * 결제 정보 불러오기
	 * @param suppoerter - 서포터 정보
	 * @return 결제 정보
	 */
	public Payment selectPayment(Supporter suppoerter);
	
	/**
	 * 사용자 정보 불러오기
	 * @param suppoerter - 서포터 정보
	 * @return 사용자 정보
	 */
	public Member selectMember(Supporter suppoerter);
	
	/**
	 * 환불 데이터 넣기
	 * @param payback - 삽입할 환불 데이터  
	 */
	public void insertPayback(Payback payback);
	
	/**
	 * 결제 상태 변경
	 * @param payment - 결제 정보
	 */
	public void updatePayment(Payment payment);
	
	/**
	 * 서포터 값 가져오기
	 * @param suppoerter - 서포터 번호
	 * @return - 서포터 정보
	 */
	public Supporter selectSupporterDto(Supporter suppoerter);
	
	

}
