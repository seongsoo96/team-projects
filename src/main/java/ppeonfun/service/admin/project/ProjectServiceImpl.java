package ppeonfun.service.admin.project;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.admin.project.ProjectDao;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

@Service("admin.ProjectService")
public class ProjectServiceImpl implements ProjectService {
	private static final Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);
	
	@Autowired private ProjectDao projectDao;
	
	@Override
	public Paging getPaging(Paging inData) {
		//전체 개수
		int totalCount = projectDao.selectCntAll();
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		
		return paging;
	}
	
	@Override
	public List<Project> selectAllProject(Paging paging) {
		
		return projectDao.selectAll(paging);
	}
	
	@Override
	public String selectByName(Project project) {
		
		return projectDao.selectByName(project);
	}
	
	@Override
	public Project selectProject(Project project) {
		return projectDao.selectProject(project);
	}
	
	@Override
	public Project input(int mNo) {
		Project project = new Project();
		project.setmNo(mNo);
		projectDao.insertProject(project);
		project=projectDao.selectProject(project);
		
		return project;
	}
}
