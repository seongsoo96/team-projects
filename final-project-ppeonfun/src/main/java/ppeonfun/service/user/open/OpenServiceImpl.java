package ppeonfun.service.user.open;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.user.open.OpenDao;
import ppeonfun.dto.Alarm;
import ppeonfun.dto.Information;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

@Service("user.OpenService")
public class OpenServiceImpl implements OpenService {
private Logger logger = LoggerFactory.getLogger(OpenServiceImpl.class);
	
	@Autowired private OpenDao openDao;
	
	@Override
	public Paging getPaging(Paging inData) {
		//전체 개수
		int totalCount = openDao.selectCntAll(inData);
		logger.info("totalCount: {}", totalCount);
		
		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage(),6);
		paging.setCategory(inData.getCategory());
		paging.setSearch(inData.getSearch());
		return paging;
	}
	@Override
	public List<Information> selectAllProject(Paging paging) {
		
		return openDao.selectAll(paging);
	}
	
	@Override
	public Information viewInformation(Project project) {
		// TODO Auto-generated method stub
		return openDao.selectInformation(project);
	}
	
	@Override
	public boolean checkAlarm(Project project, int mNo) {
		project.setmNo(mNo);
		
		if(openDao.selectCheckAlarm(project)>0) {
			return false;
		}
	
		return true;
	}
	@Override
	public void inputArarm(Project project, int mNo) {
		// TODO Auto-generated method stub
		Alarm alarm = new Alarm();
		alarm.setmNo(mNo);
		alarm.setpNo(project.getpNo());
		openDao.insertAlarm(alarm);
	}
	@Override
	public void removeArarm(Project project, int mNo) {
		// TODO Auto-generated method stub
		Alarm alarm = new Alarm();
		alarm.setmNo(mNo);
		alarm.setpNo(project.getpNo());
		openDao.deleteAlarm(alarm);
	}
}
