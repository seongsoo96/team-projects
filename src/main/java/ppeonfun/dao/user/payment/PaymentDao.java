package ppeonfun.dao.user.payment;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Member;
import ppeonfun.dto.Payment;
import ppeonfun.dto.Project;
import ppeonfun.dto.Reward;
import ppeonfun.dto.Supporter;

@Repository("user.PaymentDao")
public interface PaymentDao {
	/**
	 * 프로젝트 가져오기
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 정보
	 */
	public Project selectProject(Project project);
	/**
	 * 로그인한 사용자 정보
	 * @param mNo - 사용자 번호
	 * @return 사용자 정보
	 */
	public Member selectMember(int mNo);
	
	
	/**
	 * 리워드 조회
	 * @param reNo - 리워드 번호
	 * @return 리워드 정보
	 */
	public Reward selectReward(int reNo);
	
	/**
	 * 리워드 금액 가져오기
	 * @param reNo - 리워드 번호
	 * @return 리워드 금액
	 */
	public int selectByAmount(int reNo);
	
	/**
	 * 결제 정보 저장
	 * @param payment - 결제 정보 저장
	 */
	public void insertPayment(Payment payment);
	
	/**
	 * 서포터 삽입
	 * @param supporter - 서포터 정보 저장
	 */
	public void insertSupporter(Supporter supporter);
	
	/**
	 * 현재 su_group값 가져오기
	 * @return su_group
	 */
	public int selectBySuGroup();
	
}
