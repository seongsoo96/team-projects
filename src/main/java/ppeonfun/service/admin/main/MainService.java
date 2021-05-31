package ppeonfun.service.admin.main;

import java.util.HashMap;
import java.util.List;

import ppeonfun.util.Paging;

public interface MainService {
	/**
	 * 결제 페이징
	 * @param inData - 페이징 데이터
	 * @return 페이징 값 
	 */
	public Paging getPaymentPaging(Paging inData);
	
	/**
	 * 환불 페이징
	 * @param inData - 페이징 데이터
	 * @return 페이징 값 
	 */
	public Paging getPaybackPaging(Paging inData);
	
	/**
	 * 좋아요 페이징
	 * @param inData - 페이징 데이터
	 * @return 페이징 값 
	 */
	
	public Paging getFavoritePaging(Paging inData);
	
	/**
	 * 알림 페이징
	 * @param inData - 페이징 데이터
	 * @return 페이징 값 
	 */
	public Paging getAlarmPaging(Paging inData);
	
	
	/**
	 * 결제 리스트
	 * @param paging - 페이징
	 * @return 결제 관련 리스트
	 */
	public List<HashMap<String, Object>> paymentList(Paging paging);
	
	/**
	 * 환불 리스트
	 * @param paging - 페이징
	 * @return 환불 관련 리스트
	 */
	
	public List<HashMap<String, Object>> paybackList(Paging paging);
	
	/**
	 * 좋아요 리스트
	 * @param paging - 페이징
	 * @return 좋아요 관련 리스트
	 */
	
	public List<HashMap<String, Object>> favoriteList(Paging paging);
	
	
	/**
	 * 알림 리스트
	 * @param paging - 페이징
	 * @return 알림 관련 리스트
	 */
	
	public List<HashMap<String, Object>> alarmList(Paging paging);
	
	/**
	 * 결제 통계 데이터
	 * @return 카테고리별로 결제 데이터들을 넘겨준다
	 */
	
	public List<HashMap<String, Object>> getPaymentStat();

	/**
	 * 환불 통계 데이터
	 * @return 카테고리별로 환불 데이터들을 넘겨준다
	 */
	public List<HashMap<String, Object>> getPaybackStat();
	/**
	 * 좋아요 통계 데이터
	 * @return 카테고리별로 좋아요 데이터들을 넘겨준다
	 */
	
	public List<HashMap<String, Object>> getFavoriteStat();
	
	/**
	 * 알림 통계 데이터
	 * @return 카테고리별로 알림 데이터들을 넘겨준다
	 */
	
	public List<HashMap<String, Object>> getAlarmStat();
}
