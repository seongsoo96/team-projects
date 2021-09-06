package ppeonfun.service.user.maker.open;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.maker.open.OpenDao;
import ppeonfun.dto.Information;
import ppeonfun.dto.Maker;
import ppeonfun.dto.Project;
import ppeonfun.dto.Requirement;
import ppeonfun.dto.RequirementFile;
import ppeonfun.dto.Reward;
import ppeonfun.dto.Story;
import ppeonfun.dto.StoryFile;
import ppeonfun.util.Paging;

@Service("user.maker.OpenService")
public class OpenServiceImpl implements OpenService {
	
	private static final Logger logger = LoggerFactory.getLogger(OpenServiceImpl.class);
	@Autowired private OpenDao openDao;
	@Override
	public String viewByName(Project project) {
		return openDao.selectByName(project);
	}
	@Override
	public Project viewProject(Project project) {
		return openDao.selectProject(project);
	}
	@Override
	public Requirement viewRequirement(Project project) {
		// TODO Auto-generated method stub
		return openDao.selectRequirement(project);
	}
	@Override
	public RequirementFile viewRequirementFile(Requirement requirement) {
		// TODO Auto-generated method stub
		return openDao.selectRequirementFile(requirement);
	}
	
	@Override
	public Information viewInformation(Project project) {
		// TODO Auto-generated method stub
		return openDao.selectInformation(project);
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
		return openDao.selectStory(project);
	}
	
	@Override
	public List<StoryFile> viewStoryFile(Story story) {
		// TODO Auto-generated method stub
		return openDao.selectStoryFile(story);
	}
	
	@Override
	public List<Reward> viewRewardList(Project project) {
		// TODO Auto-generated method stub
		return openDao.selectAllReward(project);
	}
	
	@Override
	public Maker viewMaker(Project project) {
		return openDao.selectMaker(project);
	}
	
	@Override
	public Paging getPaging(Paging inData,Project project) {
		//전체 개수
		int totalCount = openDao.selectCntAll(project);
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		paging.setCategory(inData.getCategory());
		paging.setSearch(inData.getSearch());

		return paging;
	}
	@Override
	public List<HashMap<String, Object>> selectAllAlarm(Paging paging, Project project) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("project", project);
		List<HashMap<String, Object>> mapList = openDao.selectAllAlarm(map);
		
		return mapList;
	}
}
