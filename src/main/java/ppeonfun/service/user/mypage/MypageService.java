package ppeonfun.service.user.mypage;

import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dto.Member;
import ppeonfun.dto.MyPage;

public interface MypageService {

	/**
	 * 해당 회원번호의 프로필 사진을 가져온다.
	 * @param mNo	회원번호
	 * @return		프로필 사진 정보를 담은 Mypage 객체
	 */
	public MyPage getProfileImg(int mNo);

	
	/**
	 * 해당 회원번호의 프로필 사진을 변경한다.
	 * @param mNo 	회원번호
	 * @param file	새 프로필 이미지 파일 
	 */
	public void updateMypageFile(int mNo, MultipartFile file);


	/**
	 * 해당 회원번호의 프로필 사진을 삭제한다.
	 * @param 		회원번호
	 */
	public void deleteProfileImg(int mNo);


	/**
	 * 해당 회원번호의 소개글을 수정한다.
	 * @param introduce
	 * @param mNo
	 */
	public void updateMyIntroByNo(String introduce, int mNo);


	/**
	 * 해당 회원번호의 기본 정보를 조회한다.
	 * @param mNo	회원번호
	 * @return		기본 정보가 담긴 DTO
	 */
	public Member getMemberInfo(int mNo);


	/**
	 * 회원의 수정된 기본 정보를 업데이트한다.
	 * @param member	수정된 기본 정보가 담긴 DTO	
	 */
	public void updateMemberInfo(Member member);


	/**
	 * 사이트 / 카카오 가입 정보를 조회한다.
	 * @param mNo	회원번호
	 * @return		가입 정보(사이트 / 카카오)
	 */
	public String getSocialInfo(int mNo);


	/**
	 * 입력값과 테이블의 컬럼값이 일치하는지 비교한다.
	 * @param member	비밀번호 암호화 값이 담긴 DTO
	 * @return			일치하면 true, 일치하지 않으면 false
	 */
	public boolean checkPassword(Member member);


	/**
	 * 비밀번호를 변경한다.
	 * @param member	새 비밀번호가 담긴 DTO
	 */
	public void updatePassword(Member member);


	/**
	 * 회원번호로 회원의 이메일 주소를 조회한다.
	 * @param mNo	회원번호
	 * @return		이메일
	 */
	public String getEmailBymNo(int mNo);


	/**
	 * 회원의 탈퇴 신청을 업데이트한다.
	 * @param mNo	회원번호
	 */
	public void updateDeleteState(int mNo);
	
}
