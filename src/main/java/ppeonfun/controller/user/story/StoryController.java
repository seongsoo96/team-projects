package ppeonfun.controller.user.story;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("user.StoryController")
public class StoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoryController.class);

	@RequestMapping(value = "/story")
	public String story() {
		
		logger.info("/story [GET]");
		
		return "/user/project/story";
	}
	
}
