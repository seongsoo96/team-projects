package ppeonfun.controller.admin.report;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ppeonfun.dto.Project;
import ppeonfun.dto.Report;
import ppeonfun.service.admin.report.ReportService;
import ppeonfun.util.Paging;

@Controller("admin.ReportController")
@RequestMapping(value="/admin/report")
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired private ReportService reportService;
	
	@RequestMapping(value="/list")
	public void list(Model model, Paging inData) {
		logger.info("/admin/report/list");
		Paging paging = reportService.getPaging(inData);
		List<HashMap<String, Object>> mapList = reportService.listReport(paging);
		
		model.addAttribute("list", mapList);
		model.addAttribute("paging", paging);
	}
	@RequestMapping(value="/view")
	public void view(Model model, Report report) {
		logger.info("/admin/report/view");
		HashMap<String, Object> result = reportService.viewReport(report);
		
		
		model.addAttribute("report", result);
	}
	
	@RequestMapping(value="/approve")
	public String approve(Report report) {
		logger.info("/admin/report/approve");
		logger.info("report {}", report);
		reportService.approveReport(report);
		
		
		return "redirect:/admin/report/view?repNo="+report.getRepNo();
	}
	@RequestMapping(value="/reject")
	public String reject(Report report) {
		
		logger.info("/admin/report/approve");
		logger.info("report {}", report);
		reportService.rejectReport(report);
		
		return "redirect:/admin/report/list";
	}
	
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void wirteForm() {
		logger.info("/admin/report/write [GET]");
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String wirteProc(Report report) {
		logger.info("/admin/report/write [POST]");
		logger.info("report {}", report);
		int repNo=reportService.inputReport(report);
		
		return "redirect:/admin/report/view?repNo="+repNo;
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public void searchForm(Paging inData, Model model) {
		logger.info("/admin/report/search [GET]");
		Paging paging = reportService.getPagingProject(inData);
		List<HashMap<String, Object>> list = reportService.searchProject(paging);
		
		for(int i=0; i<list.size(); i++) {
			for(String key: list.get(i).keySet()) {
				logger.info("key:{}, value:{}", key, list.get(i).get(key));
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	@RequestMapping(value="/search/project")
	public String search(Project project, Model model) {
		logger.info("/admin/report/search/project [GET]");
		HashMap<String, Object> map = reportService.viewProject(project);
		
		model.addAttribute("project", map);
		return "jsonView";
	}
	
	
}
