package ppeonfun.dao.user.mypage;

import org.springframework.stereotype.Repository;

import ppeonfun.dto.MyPage;

@Repository("user.MypageDao")
public interface MypageDao {

	public MyPage selectMypageBymNo(int mNo);

}
