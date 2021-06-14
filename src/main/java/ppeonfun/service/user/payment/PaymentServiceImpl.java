package ppeonfun.service.user.payment;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.payment.PaymentDao;
import ppeonfun.dto.Member;
import ppeonfun.dto.Payment;
import ppeonfun.dto.Project;
import ppeonfun.dto.Reward;
import ppeonfun.dto.Supporter;

@Service("user.PaymentService")
public class PaymentServiceImpl implements PaymentService {
	private Logger logger = LoggerFactory.getLogger(PaymentServiceImpl.class);
	@Autowired private PaymentDao paymentDao;
	
	@Override
	public HashMap<String, Integer> getRewardCount(String[] reward, String[] count) {
		HashMap <String, Integer> result = new HashMap<>();
		for(int i=0; i<reward.length; i++) {
			result.put(reward[i], Integer.parseInt(count[i]));
		}
		
		return result;
	}
	
	@Override
	public Project viewProject(Project project) {
		// TODO Auto-generated method stub
		return paymentDao.selectProject(project);
	}
	
	@Override
	public Member viewMember(int mNo) {
		// TODO Auto-generated method stub
		return paymentDao.selectMember(mNo);
	}
	@Override
	public int getAmount(HashMap<String, Integer> rewardCount) {
		int amount =0;
		for(String key: rewardCount.keySet()) {
			Reward reward= paymentDao.selectReward(Integer.parseInt(key));
			amount += (reward.getReMoney()*rewardCount.get(key)); //결제 금액
		}
		
		return amount;
	}
	
	@Override
	public void inputPayment(HashMap<String, Integer> rewardCount, String suAddMoney, Payment payment, int mNo) {
		// TODO Auto-generated method stub
		logger.info("service inputPayment");
		int addMoney = Integer.parseInt(suAddMoney); //추가 금액
		int money = payment.getPaymAmount(); //결제금액 1800원
		
		//payment 삽입
		for(String key: rewardCount.keySet()) {
			if(rewardCount.get(key)>0) { // 개수가 0이면 payment는 안 들어간다
				int amount = paymentDao.selectByAmount(Integer.parseInt(key)); //리워드 금액
				amount *= rewardCount.get(key); //합산 금액
				money -= amount;
				if(money == addMoney) { //값이 같아졌을때
					amount+=addMoney;
				}
				
				payment.setmNo(mNo);
				payment.setReNo(Integer.parseInt(key));
				payment.setPaymAmount(amount); //결제금액 대입
				paymentDao.insertPayment(payment);
			}
		}
		
	}
	
	@Override
	public void inputSupporter(HashMap<String, Integer> rewardCount, String suAddMoney, Payment payment, int mNo) {
		// TODO Auto-generated method stub
		logger.info("service inputSupporter");
		int addMoney = Integer.parseInt(suAddMoney); //추가 금액
		int money = payment.getPaymAmount(); //결제금액 1800원

		//payment 삽입
		for(String key: rewardCount.keySet()) {
			for(int i=0; i<rewardCount.get(key); i++) { // 개수만큼 반복한다
				Supporter supporter = new Supporter();
				int amount = paymentDao.selectByAmount(Integer.parseInt(key)); //리워드 금액
				money -= amount;
				if(money == addMoney) { //값이 같아졌을때
					supporter.setSuAddMoney(addMoney); //추가 펀딩 금액
				}
				supporter.setmNo(mNo); //회원번호
				supporter.setpNo(payment.getpNo()); // 프로젝트 번호
				supporter.setReNo(Integer.parseInt(key)); //리워드 번호
				paymentDao.insertSupporter(supporter);
			}
		}
		
	}
	
}
