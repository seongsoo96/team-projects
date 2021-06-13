package ppeonfun.controller.user.maker.news;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ppeonfun.dto.News;
import ppeonfun.dto.NewsFile;
import ppeonfun.dto.Project;
import ppeonfun.service.user.maker.news.NewsService;
import ppeonfun.util.Paging;

@Controller("user.maker.NewsController")
@RequestMapping(value="/user/maker/news")
public class NewsController {
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	@Autowired private NewsService newsService;
	
	@RequestMapping(value="/list")
	public void list(Paging inData, Model model, Project project) {
		logger.info("/user/maker/news/list 실행");
		Paging paging = newsService.getPaging(inData, project);
		List<News> list = newsService.selectAllNews(paging, project);
			
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("project", project);
	}
	
	@RequestMapping(value="/write")
	public void write(Project project, Model model) {
		logger.info("/user/maker/news/write [GET]실행");
		String name = newsService.selectByName(project);
		project = newsService.viewProject(project);
		
		
		model.addAttribute("name", name);
		model.addAttribute("project", project);
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(News news, MultipartHttpServletRequest mtfRequest) {
		logger.info("/user/maker/news/write [POST]");
		logger.info("news {}", news);
		logger.info("mtfRequest {}", mtfRequest);
		Date nOpenDate = newsService.selectByOpenDate(news);
		news.setnOpenDate(nOpenDate);
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		logger.info("fileList {}", fileList);
		logger.info("result news {}", news);
		newsService.inputNewsFile(news,fileList);
		
		return "redirect:/user/maker/news/list?pNo="+news.getpNo();
	}
	
	@RequestMapping(value="/view")
	public void view(News news, Model model) {
		logger.info("/user/maker/news/view");
		logger.info("news {}", news);
		news = newsService.viewNews(news);
		List<NewsFile> newsFile = newsService.viewNewsList(news);
		Project project = newsService.getProject(news);
		project = newsService.viewProject(project);
		String name = newsService.selectByName(project);
		
		logger.info("newsFile {}", newsFile);
		
		model.addAttribute("news",news);
		model.addAttribute("newsFile", newsFile);
		model.addAttribute("project", project);
		model.addAttribute("name", name);
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modify(News news, Model model) {
		logger.info("/user/maker/news/view");
		logger.info("news {}", news);
		news = newsService.viewNews(news);
		List<NewsFile> newsFile = newsService.viewNewsList(news);
		Project project = newsService.getProject(news);
		project = newsService.viewProject(project);
		String name = newsService.selectByName(project);
		
		logger.info("newsFile {}", newsFile);
		
		model.addAttribute("news",news);
		model.addAttribute("newsFile", newsFile);
		model.addAttribute("project", project);
		model.addAttribute("name", name);
		
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyProc(News news,MultipartHttpServletRequest mtfRequest) {
		logger.info("/user/maker/news/modify [POST]");
		logger.info("news {}", news);
		logger.info("mtfRequest {}", mtfRequest);
		
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		logger.info("fileList {}", fileList);
		List<NewsFile> newsFile = newsService.viewNewsList(news); 
		
		logger.info("result news {}", news);
		
		newsService.removeFile(news, newsFile);
		newsService.modifyNewsFile(news,fileList);
		
		return "redirect:/user/maker/news/view?nNo="+news.getnNo();
	}
	@RequestMapping(value="/remove")
	public String remove(News news) {
		logger.info("/user/maker/news/remove");
		logger.info("news {}", news);
		
		List<NewsFile> newsFile = newsService.viewNewsList(news); 
		newsService.removeFile(news, newsFile);
		newsService.removeNewsFile(news);
		
		return "redirect:/user/maker/news/list?pNo="+news.getpNo();
	}
	
}
