package ppeonfun.service.user.supporter;

import java.util.List;

import ppeonfun.dto.Information;
import ppeonfun.dto.Supporter;
import ppeonfun.dto.SupporterJoin;

public interface SupporterService {

	/**
	 * 해당프로젝트의 총 서포터 수
	 * 
	 * @param supporter - 프로젝트 번호
	 * @return 총 서포터 수
	 */
	public int totalCount(Supporter supporter);

	/**
	 * 프로젝트의 서포터 리스트
	 * 
	 * @param suJoin - 프로젝트 번호 가진 객체
	 * @return
	 */
	public List<SupporterJoin> supporterList(SupporterJoin suJoin);

	/**
	 * 프로젝트 남은 일수 계산
	 * 
	 * @param suJoin - 프로젝트 번호 가진 객체
	 * @return
	 */
	public int remainDay(SupporterJoin suJoin);

	/**
	 * 총 달성액
	 * 
	 * @param suJoin - 프로젝트 번호 가진 객체
	 * @return
	 */
	public int amount(SupporterJoin suJoin);

	/**
	 * 프로젝트 정보
	 * 
	 * @param info
	 * @return
	 */
	public Information projectInfo(Information info);

}
