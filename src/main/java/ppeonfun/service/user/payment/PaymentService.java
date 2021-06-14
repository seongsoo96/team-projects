package ppeonfun.service.user.payment;

import java.util.HashMap;

import ppeonfun.dto.Member;
import ppeonfun.dto.Payment;
import ppeonfun.dto.Project;

public interface PaymentService {
	/**
	 * 
	 * @param reward - 리워드 번호
	 * @param count - 선택한 리워드 개수
	 * @return 반환
	 */
	public HashMap<String, Integer> getRewardCount(String[] reward, String[] count);
	/**
	 * 프로젝트 가져오기
	 * @param project - 프로젝트 번호
	 * @return 프로젝트 정보
	 */
	public Project viewProject(Project project);
	
	/**
	 * 사용자 정보 가져오기
	 * @param mNo - 사용자 번호
	 * @return 사용자 정보 가져오기
	 */
	public Member viewMember(int mNo);
	
	/**
	 * 결제 금액 가져오기
	 * @param rewardCount - 리워드 선택 번호와 선택 개수
	 * @return 총 금액
	 */
	public int getAmount(HashMap<String, Integer> rewardCount);
	
	
	/**
	 * 결제 완료
	 * @param rewardCount 리워드 및 리워드 선택 개수
	 * @param suAddMoney - 추가 금액
	 * @param payment - 결제 정보
	 * @param mNo - 회원번호
	 */
	public void inputPayment(HashMap<String, Integer> rewardCount, String suAddMoney, Payment payment, int mNo);
	
	/**
	 * 결제 완료 서포터 삽입
	 * @param rewardCount 리워드 및 리워드 선택 개수
	 * @param suAddMoney 추가 금액
	 * @param payment 결제 정보
	 * @param mNo - 회원번호
	 */
	public void inputSupporter(HashMap<String, Integer> rewardCount, String suAddMoney, Payment payment, int mNo);
	

}
