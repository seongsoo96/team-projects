package ppeonfun.controller.admin.quartz;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import ppeonfun.service.admin.quartz.QuartzService;

@Controller("admin.SchedulerController")
public class SchedulerController {
	private static final Logger logger = LoggerFactory.getLogger(SchedulerController.class);
	@Autowired private QuartzService quartzService;
	
	public void updateProject() throws Exception{
		logger.info("update project run...");
		quartzService.startProject();
		quartzService.endProject();
	}
	
	public void task1() throws Exception{
		logger.info("update project run...");
		
	}
}
