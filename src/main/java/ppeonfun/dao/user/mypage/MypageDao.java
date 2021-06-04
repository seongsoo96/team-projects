package ppeonfun.dao.user.mypage;

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


}
