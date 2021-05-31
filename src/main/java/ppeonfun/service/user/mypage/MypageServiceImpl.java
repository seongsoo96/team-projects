package ppeonfun.service.user.mypage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
