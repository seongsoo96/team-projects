package ppeonfun.service.user.mypage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dao.user.mypage.MypageDao;
import ppeonfun.dto.MyPage;

@Service("user.MypageService")
public class MypageServiceImpl implements MypageService {

	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);
	
	@Autowired private MypageDao mypageDao;
	
	@Override
	public MyPage getProfileImg(int mNo) {
		logger.info("***** MypageServiceImpl getProfileImg START *****");
		return mypageDao.selectMypageBymNo(mNo);
	}

	@Override
	public void updateMypageFile(int mNo, MultipartFile file) {
		logger.info("***** MypageServiceImpl updateMypageFile START *****");
//		아래 함수 두 개 더 필요(saveFile은 이미지 등록 아예 안했을 때 사용할 수 있음)
//		deleteMypageFile(mNo)
//		saveFile(mNo, file)
	}


}
