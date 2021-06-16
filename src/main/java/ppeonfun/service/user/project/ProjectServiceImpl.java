package ppeonfun.service.user.project;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.project.ProjectDao;
import ppeonfun.dto.Information;
import ppeonfun.dto.Maker;
import ppeonfun.dto.Project;
import ppeonfun.dto.Requirement;
import ppeonfun.dto.RequirementFile;
import ppeonfun.dto.Reward;
import ppeonfun.dto.Story;
import ppeonfun.dto.StoryFile;
import ppeonfun.util.Paging;

@Service("user.ProjectService")
public class ProjectServiceImpl implements ProjectService {
	private Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);
	
	@Autowired private ProjectDao projectDao;
	
	@Override
	public Paging getPaging(Paging inData) {
		//전체 개수
		int totalCount = projectDao.selectCntAll(inData);
		logger.info("totalCount: {}", totalCount);
		
		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage(),6);
		paging.setCategory(inData.getCategory());
		paging.setSearch(inData.getSearch());
		return paging;
	}
	@Override
	public List<Information> selectAllProject(Paging paging) {
		
		return projectDao.selectAll(paging);
	}
	@Override
	public String viewByName(Project project) {
		return projectDao.selectByName(project);
	}
	@Override
	public Project viewProject(Project project) {
		return projectDao.selectProject(project);
	}
	@Override
	public Requirement viewRequirement(Project project) {
		// TODO Auto-generated method stub
		return projectDao.selectRequirement(project);
	}
	@Override
	public RequirementFile viewRequirementFile(Requirement requirement) {
		// TODO Auto-generated method stub
		return projectDao.selectRequirementFile(requirement);
	}
	
	@Override
	public Information viewInformation(Project project) {
		// TODO Auto-generated method stub
		return projectDao.selectInformation(project);
	}
	
	@Override
	public String convartUrl(String sUrl) {
		String url = "https://www.youtube.com/embed";
		String[] query = sUrl.split("/"); 
		logger.info("query {}", query[query.length-1]);
		if(query[query.length-1].contains("watch")) {
			String result = query[query.length-1].substring(query[query.length-1].lastIndexOf("=")+1);
			url+="/"+result;
		}else {
			url+="/"+query[query.length-1];
		}
		return url;
	}
	
	@Override
	public Story viewStory(Project project) {
		// TODO Auto-generated method stub
		return projectDao.selectStory(project);
	}
	
	@Override
	public List<StoryFile> viewStoryFile(Story story) {
		// TODO Auto-generated method stub
		return projectDao.selectStoryFile(story);
	}
	
	@Override
	public List<Reward> viewRewardList(Project project) {
		// TODO Auto-generated method stub
		return projectDao.selectAllReward(project);
	}
	
	@Override
	public Maker viewMaker(Project project) {
		return projectDao.selectMaker(project);
	}
	
	
	
}
