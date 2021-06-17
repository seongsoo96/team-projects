package ppeonfun.service.admin.quartz;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.admin.quartz.QuartzDao;
import ppeonfun.dto.Project;

@Service("admin.QuartzService")
public class QuartzServiceImpl implements QuartzService {
	private static final Logger logger = LoggerFactory.getLogger(QuartzServiceImpl.class);
	@Autowired private QuartzDao quartzDao;
	
	@Override
	public void startProject() {
		List<Project> list = quartzDao.selectStartProejct();
		for(int i=0; i<list.size(); i++) {
			quartzDao.updateStart(list.get(i));
		}
	}
	@Override
	public void endProject() {
		List<Project> list = quartzDao.selectEndProejct();
		for(int i=0; i<list.size(); i++) {
			quartzDao.updateEnd(list.get(i));
		}
	}
	
}
