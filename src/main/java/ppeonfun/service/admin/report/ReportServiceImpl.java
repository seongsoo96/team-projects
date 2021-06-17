package ppeonfun.service.admin.report;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.admin.report.ReportDao;
import ppeonfun.dto.Project;
import ppeonfun.dto.Report;
import ppeonfun.util.Paging;

@Service("admin.ReportService")
public class ReportServiceImpl implements ReportService {
	private static final Logger logger = LoggerFactory.getLogger(ReportServiceImpl.class);
	@Autowired private ReportDao reportDao;
	@Override
	public Paging getPaging(Paging inData) {
		//전체 개수
		int totalCount = reportDao.selectCntAll(inData);
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		paging.setCategory(inData.getCategory());
		paging.setSearch(inData.getSearch());

		return paging;
	}
	
	@Override
	public List<HashMap<String, Object>> listReport(Paging paging) {
		// TODO Auto-generated method stub
		return reportDao.selectAll(paging);
	}
	
	@Override
	public HashMap<String, Object> viewReport(Report report) {
		// TODO Auto-generated method stub
		return reportDao.selectReport(report);
	}
	
	@Override
	public void approveReport(Report report) {
		report.setRepState("Y");
		reportDao.updateReport(report);
		reportDao.updateProject(report);
		reportDao.updateMember(report);
	}
	
	@Override
	public void rejectReport(Report report) {
		reportDao.deleteReport(report);
		
	}
	
	@Override
	public Paging getPagingProject(Paging inData) {
		//전체 개수
		int totalCount = reportDao.selectCntAllProject(inData);
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		paging.setCategory(inData.getCategory());
		paging.setSearch(inData.getSearch());

		return paging;
	}
	
	@Override
	public List<HashMap<String, Object>> searchProject(Paging paging) {
		// TODO Auto-generated method stub
		return reportDao.selectAllProject(paging);
	}
	
	@Override
	public HashMap<String, Object> viewProject(Project project) {
		// TODO Auto-generated method stub
		return reportDao.selectProject(project);
	}
	
	@Override
	public int inputReport(Report report) {
		report.setRepState("W");
		reportDao.insertReport(report);
		
		return report.getRepNo();
	}
}
