package ppeonfun.service.admin.main;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.admin.main.MainDao;
import ppeonfun.util.Paging;

@Service("admin.MainService")
public class MainServiceImpl implements MainService {
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	@Autowired private MainDao mainDao;
	
	@Override
	public Paging getAlarmPaging(Paging inData) {
		//전체 개수
		int totalCount = mainDao.selectAlarmCntAll();
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		paging.setCategory(inData.getCategory());
		return paging;
	}
	@Override
	public Paging getFavoritePaging(Paging inData) {
		//전체 개수
		int totalCount = mainDao.selectFavoriteCntAll();
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		paging.setCategory(inData.getCategory());
		return paging;
	}
	@Override
	public Paging getPaybackPaging(Paging inData) {
		//전체 개수
		int totalCount = mainDao.selectPaybackCntAll();
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		paging.setCategory(inData.getCategory());
		return paging;
	}
	@Override
	public Paging getPaymentPaging(Paging inData) {
		//전체 개수
		int totalCount = mainDao.selectPaymentCntAll();
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		paging.setCategory(inData.getCategory());
		return paging;
	}
	
	@Override
	public List<HashMap<String, Object>> alarmList(Paging paging) {
		//알림 관련 리스트
		return mainDao.selectAllAlarm(paging);
	}
	
	@Override
	public List<HashMap<String, Object>> favoriteList(Paging paging) {
		//좋아요 관련 리스트
		return mainDao.selectAllFavorite(paging);
	}
	
	@Override
	public List<HashMap<String, Object>> paybackList(Paging paging) {
		//환불 관련 리스트
		return mainDao.selectAllPayback(paging);
	}
	
	@Override
	public List<HashMap<String, Object>> paymentList(Paging paging) {
		//결제 관련 리스트
		return mainDao.selectAllPayment(paging);
	}
	@Override
	public List<HashMap<String, Object>> getAlarmStat() {
		//카테고리별 알림 관련 통계 데이터 
		return mainDao.selectStatAlarm();
	}
	@Override
	public List<HashMap<String, Object>> getFavoriteStat() {
		//카테고리별 좋아요 관련 통계 데이터 
		return mainDao.selectStatFavorite();
	}@Override
	public List<HashMap<String, Object>> getPaybackStat() {
		//카테고리별 환불 관련 통계 데이터 
		return mainDao.selectStatPayback();
	} 
	@Override
	public List<HashMap<String, Object>> getPaymentStat() {
		//카테고리별 결제 관련 통계 데이터 
		return mainDao.selectStatPayment();
	}
	
}
