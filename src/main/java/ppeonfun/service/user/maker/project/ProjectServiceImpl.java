package ppeonfun.service.user.maker.project;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.maker.project.ProjectDao;
import ppeonfun.dto.Information;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

@Service("user.maker.ProjectServiceImpl")
public class ProjectServiceImpl implements ProjectService {
	private Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);
	
	@Autowired private ProjectDao projectDao;
	
	@Override
	public Paging getPaging(Paging inData, int mNo) {
		//전체 개수
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", inData.getCategory());
		map.put("search", inData.getSearch());
		map.put("mNo", mNo);
		
		int totalCount = projectDao.selectCntAll(map);
		logger.info("totalCount: {}", totalCount);
		
		
		
		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage(),6);
		paging.setCategory(inData.getCategory());
		paging.setSearch(inData.getSearch());
		return paging;
	}
	@Override
	public List<Information> selectAllProject(Paging paging, int mNo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", paging.getCategory());
		map.put("search", paging.getSearch());
		map.put("mNo", mNo);
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		
		return projectDao.selectAll(map);
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
	@Override
	public Project submitProject(Project project) {
		project.setpState("S");
		if(!"Y".equals(project.getpRequirements()) || 
		   !"Y".equals(project.getpInformation()) ||
		   !"Y".equals(project.getpReward()) ||
		   !"Y".equals(project.getpStory()) ||
		   !"Y".equals(project.getpMaker()) 
				) { //Y상태가 하나라도 아닐경우
			return null;
		}
		projectDao.updateSubmit(project);
		
		return project;
	}
}
