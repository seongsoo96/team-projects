package ppeonfun.controller.admin.requirement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ppeonfun.dto.Project;

@Controller("user.RequirementController")
@RequestMapping(value="/admin/requirement")
public class RequirementController {
	private static final Logger logger = LoggerFactory.getLogger(RequirementController.class);
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(Project project) {
		logger.info("/admin/requirement/view");
		
		
		
		return null;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void write(Project project) {
		logger.info("/admin/requirement/write");
		
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modify(Project project) {
		logger.info("/admin/requirement/modify");
		
	}
	
}
