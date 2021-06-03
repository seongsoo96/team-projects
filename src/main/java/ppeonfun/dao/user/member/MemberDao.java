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
	
	/**
	 * 아이디 체크
	 * @param member - 아이디 정보
	 * @return - DB에 아이디 존재 여부
	 */
	public int selectIdCheck(Member member);
	/**
	 * 닉네임 체크
	 * @param member - 닉네임 정보
	 * @return DB에 닉네임 존재 여부
	 */
	public int selectNickCheck(Member member);
	
	/**
	 * 회원가입 
	 * @param member - 회원가입 정보
	 * @return DB에 값 저장
	 */
	public void insertMember(Member member);
	/**
	 * 카카오 회원가입
	 * @param member - 회원가입 정보
	 */
	
	public void insertKakaMember(Member member);
	/**
	 * 카카오 아이디
	 * @return - 카카오 아이디 존재 여부
	 */
	public int selectKaKaoIdCheck(String email);
	/**
	 * 카카오로 가입된 회원 번호 가져오기
	 * @param email - 카카오 이메일
	 * @return - mNo가져오기
	 */
	public int selectKakaoMno(String email);
	/**
	 * 아이디 찾기
	 * @param mEmail - 이메일로 아이디 찾기
	 * @return - 아이디 찾기
	 */
	public String selectId(String mEmail);
	/**
	 * 이메일 체크
	 * @param email - 이메일 값
	 * @return - 이메일 중복 여부
	 */
	public int selectEmailCheck(String email);
	/**
	 * 패스워드 변경
	 * @param member - id와 이메일
	 */
	public void updatePassword(Member member);
	/**
	 * 이메일 검색
	 * @param member - id
	 * @return 아이디를 통한 이메일 검색
	 */
	public Member selectEmail(Member member);


	
}
