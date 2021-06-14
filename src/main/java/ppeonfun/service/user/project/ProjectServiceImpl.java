package ppeonfun.service.user.project;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.project.ProjectDao;
import ppeonfun.dto.Information;
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
	
	
}
