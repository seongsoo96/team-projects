package ppeonfun.controller.admin.quartz;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import ppeonfun.service.admin.quartz.QuartzService;

@Controller
public class SchedulerController {
	private static final Logger logger = LoggerFactory.getLogger(SchedulerController.class);
	@Autowired private QuartzService quartzService;
	
	
	@Scheduled(cron="0 0 0 * * ?")  //매일 00시 정각
	public void updateProject() throws Exception{
		logger.info("update project run...");
		quartzService.startProject();
		quartzService.endProject();
	}
	
	@Scheduled(cron="0 0/1 * * * ?")  //매일 00시 정각
	public void task1() throws Exception{
		logger.info("update project run...");
		
	}
}
