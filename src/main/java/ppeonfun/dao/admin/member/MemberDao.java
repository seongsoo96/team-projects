package ppeonfun.dao.admin.member;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.Member;

@Repository("admin.MemberDao")
public interface MemberDao {
	/**
	 * 로그인 등급
	 * @param member - 해당 사용자의 로그인 등급을 조회한다
	 * @return 로그인된 회원의 등급
	 */
	public Member selectLoginGrade(Member member);
}
