package ppeonfun.service.admin.supporter;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.admin.supporter.SupporterDao;
import ppeonfun.dto.Member;
import ppeonfun.dto.Payback;
import ppeonfun.dto.Payment;
import ppeonfun.dto.Project;
import ppeonfun.dto.Supporter;
import ppeonfun.util.BankCode;
import ppeonfun.util.Paging;

@Service("admin.SupporterService")
public class SupporterServiceImpl implements SupporterService {
	private static final Logger logger = LoggerFactory.getLogger(SupporterServiceImpl.class);
	@Autowired private SupporterDao supporterDao;
	@Override
	public Paging getPaging(Paging inData, Project project) {
		//전체 개수
		int totalCount = supporterDao.selectCntAll(project);
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		paging.setCategory(inData.getCategory());
		paging.setSearch(inData.getSearch());

		return paging;
	}
	@Override
	public List<HashMap<String, Object>> selectAllSupportor(Paging paging, Project project) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("project", project);
		List<HashMap<String, Object>> mapList = supporterDao.selectAllSupporter(map);
		
		return mapList;
	}
	@Override
	public HashMap<String, Object> viewSupporter(Supporter supporter) {
		return supporterDao.selectSupporter(supporter);
	}
	
	@Override
	public String viewByName(int pNo) {
		return supporterDao.selectByName(pNo);
	}
	
	@Override
	public Project viewProject(int pNo) {
		return supporterDao.selectProject(pNo);
	}
	@Override
	public void removeSupporter(Supporter suppoerter) {
		supporterDao.deleteSupporter(suppoerter);
		
	}
	
	@Override
	public Payback inputPayback(Supporter suppoerter) {
		Payment payment = supporterDao.selectPayment(suppoerter); //결제 정보
		
		Member member = supporterDao.selectMember(suppoerter); //사용자 정보
		Payback payback = new Payback();
		BankCode bankCode = new BankCode(member.getmBank()); //은행코드 생성
		payback.setPaymNo(payment.getPaymNo()); // 결제번호
		payback.setPaybAmount(payment.getPaymAmount()); //환불금액
		payback.setPaybChecksum(payment.getPaymAmount()); //취소가능 금액
		payback.setPaybTaxFree(0); //면세금액
		payback.setPaybReason("메이커의 서포터 삭제"); // 환불사유
		payback.setPaybRefundHolder(member.getmName()); //예금주
		payback.setPaybRefundBank(bankCode.getCode()); //은행 코드 
		payback.setPaybRefundAccount(member.getmAccount()); //계좌번호
		
		supporterDao.updatePayment(payment);
		
		supporterDao.insertPayback(payback);
		
		return payback;
	}
	
	@Override
	public Supporter viewSupporterDto(Supporter suppoerter) {
		// TODO Auto-generated method stub
		return supporterDao.selectSupporterDto(suppoerter);
	}
}
