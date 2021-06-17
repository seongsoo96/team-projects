package ppeonfun.util.scheduler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import ppeonfun.service.admin.quartz.QuartzService;


@Component
public class SchedulerProject {
	
	private static final Logger logger = LoggerFactory.getLogger(SchedulerProject.class);
	@Autowired private QuartzService quartzService;
	
	
	@Scheduled(cron="0 0 0 * * ?")  //매일 00시 정각
	public void updateProject() throws Exception{
		logger.info("update project run...");
		quartzService.startProject();
		quartzService.endProject();
	}
    
	
}
