package ppeonfun.service.admin.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.admin.member.MemberDao;
import ppeonfun.dto.Member;


@Service("admin.MemberService")
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired private MemberDao adminMemberDao;
	
	@Override
	public Member checkGrade(Member member) {
		logger.info("admin.Service 실행");
		
		return adminMemberDao.selectLoginGrade(member);
		
	}
		
}
