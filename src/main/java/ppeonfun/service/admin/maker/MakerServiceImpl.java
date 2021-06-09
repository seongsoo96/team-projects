package ppeonfun.service.admin.maker;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dao.admin.maker.MakerDao;
import ppeonfun.dto.Maker;
import ppeonfun.dto.Project;
import ppeonfun.dto.Maker;
import ppeonfun.service.admin.maker.MakerServiceImpl;

@Service("admin.MakerService")
public class MakerServiceImpl implements MakerService {
	private static final Logger logger = LoggerFactory.getLogger(MakerServiceImpl.class);
	@Autowired private MakerDao makerDao;
	@Autowired private ServletContext context;
	
	@Override
	public Project projectState(Project project) {
		
		return makerDao.selectByState(project);
	}
	@Override
	public boolean makerState(Project project) {
		if(makerDao.selectIsMaker(project) > 0) {
			return true; //값이 존재 modify 수정으로
		}
		return false; //값이 없음 write 입력으로
	}
	@Override
	public String selectByName(Project project) {
		
		return makerDao.selectByName(project);
	}
	
	@Override
	public Maker viewMaker(Project project) {
		return makerDao.selectMaker(project);
	}
	@Override
	public void inputMaker(Maker maker, MultipartFile file) {
		
		
	}
}
