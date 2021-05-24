package ppeonfun.service.user.member;

import ppeonfun.dto.Member;

public interface MemberService {
	
	/**
	 * 비밀번호 암호화
	 * @param member - 입력된 비밀번호를 sha-512로 암호화 처리한다
	 * @return 암호화된 객체 리턴
	 */
	public Member encryption(Member member);
	
	/**
	 * 로그인 성공 
	 * @param member - null값이면 로그인 실패
	 * @return 로그인이 성공된 객체값 반환
	 */
	
	public Member login(Member member);
	
}
