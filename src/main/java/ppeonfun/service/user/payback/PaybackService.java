package ppeonfun.service.user.payback;

import java.util.List;

import ppeonfun.dto.PaymentReward;
import ppeonfun.dto.Project;

public interface PaybackService {
	/**
	 * 결제 목록 가져오기
	 * @param project - 프로젝트 이름
	 * @param mNo 회원번호
	 * @return 결제목록
	 */
	public List<PaymentReward> listPayment(Project project, int mNo);
	/**
	 * suGroup 별로 리스트 생성
	 * @param paymList - 결제 리스트
	 * @return suGroup 별 리스트 생성
	 */
	public List<List<PaymentReward>> groupListPayment(List<PaymentReward> paymList);
	
	/**
	 * 환불에 필요한 유효한 토큰 받아오기
	 * @return 아임포트 토큰
	 */
	public String getToken();
	
	/**
	 * 실질적으로 환불해주는 메소드
	 * @param token - 유효한 토큰
	 * @param suGroup - payment의 환불할 그룹
	 * @param mNo - 회원번호
	 */
	public void paybackProc(String token, String[] suGroup, int mNo);
	
	/**
	 * 서포터 삭제
	 * @param suGroup - 서포터 삭제
	 */
	public void removeSupporter(String[] suGroup);

}
