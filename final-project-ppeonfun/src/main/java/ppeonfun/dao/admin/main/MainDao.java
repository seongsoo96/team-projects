package ppeonfun.dao.admin.main;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import ppeonfun.util.Paging;

@Repository("admin.MainDao")
public interface MainDao {
	/**
	 * 결제 리스트
	 * @param paging - 페이징 객체
	 * @return 결제 관련 리스트
	 */
	public List<HashMap<String, Object>> selectAllPayment(Paging paging);
	
	/**
	 * 환불 리스트
	 * @param paging - 페이징 객체
	 * @return 환불 관련 리스트
	 */
	
	public List<HashMap<String, Object>> selectAllPayback(Paging paging);
	/**
	 * 알림 리스트
	 * @param paging - 페이징 객체
	 * @return 알림 관련 리스트
	 */
	
	public List<HashMap<String, Object>> selectAllFavorite(Paging paging);
	
	/**
	 * 알림 리스트
	 * @param paging - 페이징 객체
	 * @return 알림 관련 리스트
	 */
	
	public List<HashMap<String, Object>> selectAllAlarm(Paging paging);
	
	/**
	 * 알림 총 개수
	 * @return 총 개수
	 */
	
	public int selectAlarmCntAll();
	
	/**
	 * 좋아요 총 개수
	 * @return 총 개수
	 */
	public int selectFavoriteCntAll();

	/**
	 * 환불 총 개수
	 * @return 총 개수
	 */
	public int selectPaybackCntAll();

	/**
	 * 결제 총 개수
	 * @return 총 개수
	 */
	public int selectPaymentCntAll();
	
	/**
	 * 알림 관련 통계 데이터
	 * @return 통계 데이터 리스트
	 */
	public List<HashMap<String, Object>> selectStatAlarm();
	
	/**
	 * 좋아요 관련 통계 데이터
	 * @return 통계 데이터 리스트
	 */
	public List<HashMap<String, Object>> selectStatFavorite();
	
	/**
	 * 결제 관련 통계 데이터
	 * @return 통계 데이터 리스트
	 */
	public List<HashMap<String, Object>> selectStatPayback();
	
	/**
	 * 환불 관련 통계 데이터
	 * @return 통계 데이터 리스트
	 */
	public List<HashMap<String, Object>> selectStatPayment();
}
