package ppeonfun.dao.admin.maker;

import ppeonfun.dto.Maker;
import ppeonfun.dto.Project;

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

}
