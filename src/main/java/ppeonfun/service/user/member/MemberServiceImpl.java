package ppeonfun.service.user.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.member.MemberDao;
import ppeonfun.dto.Member;
import ppeonfun.util.Encryption;

@Service("user.MemberService")
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired private MemberDao memberDao;
	@Override
	public Member encryption(Member member) {
		logger.info("암호화 실행");
		Encryption encryption = new Encryption();
		String enc=encryption.encryption(member.getmPassword());
		member.setmPassword(enc);
		
		return member;
	}
	
	@Override
	public Member login(Member member) {
		logger.info("로그인 실행");
		Member result=memberDao.selectLogin(member);
		logger.info("result: {}", result);
		
		return result;
	}
	
}
