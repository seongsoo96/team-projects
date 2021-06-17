package ppeonfun.dao.user.payback;

import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Member;
import ppeonfun.dto.Payback;
import ppeonfun.dto.Payment;
import ppeonfun.dto.PaymentReward;
import ppeonfun.dto.Project;

@Repository("user.PaybackDao")
public interface PaybackDao {
	/**
	 * payment와 리워드의 조인된 결과를 가져와 준다
	 * @param project - 프로젝트 번호
	 * @return 조인된 결과
	 */
	public List<PaymentReward> selectAllPayment(Project project);
	/**
	 * 환불할 목록의 payment
	 * @param suGroup - 서포터 그룹
	 * @return 서포터 그룹에 속한 payment
	 */
	public List<Payment> selectPayment(int suGroup);
	/**
	 * 사용자 반환
	 * @param mNo - 사용자 번호
	 * @return 사용자 정보
	 */
	public Member selectMember(int mNo);
	
	/**
	 * 환불 데이터 삽입
	 * @param payback - 환불 데이터 삽입
	 */
	public void insertPayback(Payback payback);
	
	/**
	 * 결제 데이터 변환
	 * @param payment - 결제 데이터 상태 변환
	 */
	public void updatePaymentState(Payment payment);
	
	/**
	 * 서포터 삭제
	 * @param suGroup - 서포터 그룹에 있는 서포터 전체 삭제
	 */
	public void deleteSupoorter(int suGroup);

}
