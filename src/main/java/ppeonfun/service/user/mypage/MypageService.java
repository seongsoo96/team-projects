package ppeonfun.service.user.mypage;

import org.springframework.web.multipart.MultipartFile;

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
	
}
