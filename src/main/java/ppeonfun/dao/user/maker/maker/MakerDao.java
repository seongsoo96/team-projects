package ppeonfun.dao.user.maker.maker;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Maker;
import ppeonfun.dto.Project;

@Repository("user.maker.MakerDao")
public interface MakerDao {

	/**
	 * 상태값 반환
	 * @param project - 프로젝트 번호
	 * @return - 프로젝트 상태값
	 */
	public Project selectByState(Project project);

	/**
	 * 값이 존재하는지 여부를 반환
	 * @param int - 값이 존재하면 1이상이 반환된다
	 * @return - 값이 있는지 여부
	 */
	public int selectIsMaker(Project project);

	/**
	 * 프로젝트 소유자 반환
	 * @param project - 프로젝트 번호 
	 * @return 프로젝트 소유자
	 */
	public String selectByName(Project project);

	/**
	 * 메이커 반환
	 * @param project - 프로젝트 번호
	 * @return 메이커
	 */
	public Maker selectMaker(Project project);
	/**
	 * 프로젝트 메이커 정보 삽입
	 * @param maker - 프로젝트 메이커 정보
	 */
	public void insertMaker(Maker maker);
	/**
	 * 프로젝트 상태 변화 시키기
	 * @param maker - 프로젝트 번호
	 */
	public void updateProjectState(Maker maker);
	/**
	 * 프로젝트 메이커 정보 수정
	 * @param maker - 메이커 번호
	 */
	public void updateMaker(Maker maker);

}
