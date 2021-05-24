package ppeonfun.dao.user.member;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Member;

@Repository("user.MemberDao")
public interface MemberDao {

	/**
	 * 로그인 멤버
	 * @param member - 로그인 정보를 가진 객체
	 * @return 로그이된 정보를 가져온다(m_no, nick, id)
	 */
	public Member selectLogin(Member member);


	
}
