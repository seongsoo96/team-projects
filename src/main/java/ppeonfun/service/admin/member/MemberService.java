package ppeonfun.service.admin.member;

import ppeonfun.dto.Member;

public interface MemberService {
	/**
	 * 사용자 등급 조회
	 * @param member - 조회할 사용자 객체
	 * @return - 사용자 등급이 포함된 객체 반환
	 */
	public Member checkGrade(Member member);
}
