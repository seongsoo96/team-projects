package ppeonfun.dao.user.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import ppeonfun.dto.Member;
import ppeonfun.dto.MyPage;

@Repository("user.MypageDao")
public interface MypageDao {

	/**
	 * 회원번호로 mypage 테이블을 조회한다.
	 * @param mNo	회원번호
	 * @return		프로필 정보가 담긴 DTO
	 */
	public MyPage selectMypageBymNo(int mNo);

	
	/**
	 * 회원의 프로필 정보를 수정한다.
	 * @param mypage	프로필 정보가 담긴 DTO
	 */
	public void updateMypage(MyPage mypage);


	/**
	 * 회원의 소개 글을 수정한다.
	 * @param mypage	소개글 데이터가 담긴 DTO
	 */
	public void updateMypageIntro(MyPage mypage);


	/**
	 * 회원번호로 회원 정보를 조회한다.
	 * @param mNo	회원번호
	 * @return		회원 정보가 담긴 DTO
	 */
	public Member selectMemberByNo(int mNo);


	/**
	 * 회원 정보를 수정한다.
	 * @param member	회원 기본 정보가 담긴 DTO
	 */
	public void updateMemberInfo(Member member);


	/**
	 * member 테이블의 social을 조회한다.
	 * @param mNo	회원번호
	 * @return		social
	 */
	public String selectMsocialByNo(int mNo);


	/**
	 * 입력값과 일치하는 데이터 행을 조회한다.
	 * @param member	비밀번호 입력값이 담긴 DTO
	 * @return			일치하는 행의 수
	 */
	public int selectCntmPw(Member member);


	/**
	 * member 테이블의 m_password를 수정한다.
	 * @param member	새 비밀번호가 담긴 DTO
	 */
	public void updatePwByNo(Member member);


	/**
	 * 회원번호로 member 테이블의 m_email을 조회한다.
	 * @param mNo	회원번호
	 * @return		m_email
	 */
	public String selectmEmailBymNo(int mNo);


	/**
	 * member 테이블의 m_delete_state를 업데이트한다.
	 * @param mNo	회원 탈퇴를 신청한 회원번호
	 */
	public void updateDeleteStateBymNo(int mNo);


	/**
	 * payment, project, information 테이블을 조인하여
	 * 회원이 최근에 펀딩한 프로젝트 목록을 조회한다.
	 * 
	 * @param mNo	회원번호
	 * @return		최근 펀딩 목록
	 */
	public List<Map<String, Object>> selectMyFunding(int mNo);


}
