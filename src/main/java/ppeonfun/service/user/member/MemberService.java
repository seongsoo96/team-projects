package ppeonfun.service.user.member;

import java.util.HashMap;

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
	
	
	/**
	 * 메일 발송
	 * @param email - 전송할 메일 주소
	 * @return - 인증키
	 */
	public String sendAuthMail(String email);
	/**
	 * 아이디 체크
	 * @param member - 아이디 
	 * @return - 아이디가 있는지 없는지 체킹
	 */
	public boolean idCheck(Member member);
	/**
	 * 닉네임 체크
	 * @param member - 닉네임
	 * @return - 닉네임 중복 확인
	 */
	public boolean nickCheck(Member member);
	
	/**
	 * 회원가입
	 * @param member - 회원정보
	 * @return - 회원정보
	 */
	public Member join(Member member);
	
	/**
	 * 카카오 접근 토큰 받아오기
	 * @param authoriz_code - 코드
	 * @return - 토큰 반환
	 */
	public String kakaoGetAccessToken(String authoriz_code);
	
	/**
	 * 카카오 유저 정보 가져오기
	 * @param accessToken - 접근 토큰
	 * @return - 유저 정보
	 */
	public HashMap<String, Object> getUserInfo(String accessToken);
	/**
	 * 카카오 유저 로그아웃
	 * @param accessToken - 접근 토큰 
	 */
	public void kakaoLogout(String accessToken);
	/**
	 * 카카오 인증 토큰 얻어오기
	 * @return 인증 토큰 얻어오기
	 */
	public String kakaoGetAuthorize();
	/**
	 * 카카오 계정 링크 끊기
	 * @param accessToken - 유효한 접속 토큰
	 */
	public void kakaoUnlink(String accessToken);
	
	/**
	 * 사이트 회원가입
	 * @param userInfo - 사이트 
	 * @return 회원가입 정보 전달
	 */
	
	public Member joinKakao(HashMap<String, Object> userInfo);
	/**
	 * 카카오 아이디 체크
	 * @param String - 이메일 
	 * @return - 존재여부 반환
	 */
	public boolean kakaoIdCheck(String email);
	
	/**
	 * 카카오로 회원가입된 회원번호 반환
	 * @param email - 이메일로 검색
	 * @return - mNo값
	 */
	public int kakaoMno(String email);
	/**
	 * 아이디 찾기
	 * @param mEmail - 이메일로 검색
	 * @return - 아이디 값
	 */
	public String idFind(String mEmail);
	/**
	 * 이메일 중복 체크
	 * @param email - 검사할 이메일
	 * @return - 이메일 중복 여부
	 */
	public boolean emailCheck(String email);
	/**
	 * 비밀번호 재설정
	 * @param member - id와 암호화된 password
	 */
	public void passwordReset(Member member);
	/**
	 * 이메일 받아오기
	 * @param member - id를 통한 email 반환
	 * @return 이메일 반환
	 */
	public Member getEmail(Member member);

}
