package ppeonfun.service.user.maker.information;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dao.user.maker.information.InformationDao;
import ppeonfun.dto.Information;
import ppeonfun.dto.Project;
import ppeonfun.dto.Requirement;
import ppeonfun.dto.RequirementFile;

@Service("user.maker.InformationService")
public class InformationServiceImpl implements InformationService {
	private static final Logger logger = LoggerFactory.getLogger(InformationServiceImpl.class);
	
	@Autowired private InformationDao informationDao;
	@Autowired private ServletContext context;
	
	@Override
	public boolean informationState(Project project) {
		if(informationDao.selectIsInformation(project) > 0) {
			return true; //값이 존재 modify 수정으로
		}
		return false; //값이 없음 write 입력으로
	}
	@Override
	public Project projectState(Project project) {
		return informationDao.selectByState(project);
	}
	@Override
	public String selectByName(Project project) {
		return informationDao.selectByName(project);
	}
	@Override
	public Information viewInformation(Project project) {
		return informationDao.selectInformation(project);
	}
	@Override
	public void inputInformationFile(Information information, MultipartFile file) {
		if( file.getSize() <= 0 ) {
			return;
		}
	
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload/information");
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		//원본파일이름 알아내기
		String originName = file.getOriginalFilename();
		
		//원본파일이름에 UUID추가하기 (파일명이 중복되지않도록 설정)
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		
		
		//저장될 파일 정보 객체
		File dest = new File( stored, storedName );
		
		try {
			//업로드된 파일을 저장하기
			file.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//----------------------------------------
		information.setiOriginName(file.getOriginalFilename());
		information.setiStoredName(storedName);
		information.setiSize((int) file.getSize());
		information.setiContentType(file.getContentType());
		information.setiState("Y");
		
		informationDao.insertInformation(information);
		informationDao.updateProjectState(information);
		
	}
	
	@Override
	public Information getInformation(Information information) {
		
		Project project = new Project();
		project.setpNo(information.getpNo());
		
		Information result=informationDao.selectInformation(project);
		information.setiNo(result.getiNo());
		information.setiState("Y");
		
		return information;
	}
	@Override
	public void removeFile(String storedName) {
		if(storedName ==null || "".equals(storedName)) {
			return;
		}
		String storedPath = context.getRealPath("upload/information");
		File stored = new File(storedPath,storedName);
		
		logger.info("storedPath {}", stored.getPath());
		
		if( stored.exists() ) {
			if(stored.delete()) {
				logger.info("파일 삭제 완료 {}", storedName);
			}else {
				logger.info("파일 삭제 실패 {}", storedName);
			}
		}
		
	} 
	@Override
	public void modifyInformationFile(Information information, MultipartFile file) {
		if( file.getSize() <= 0 ) {
			return;
		}
	
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload/information");
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath);
		if( !stored.exists() ) {
			stored.mkdir();
		}
		
		//원본파일이름 알아내기
		String originName = file.getOriginalFilename();
		
		//원본파일이름에 UUID추가하기 (파일명이 중복되지않도록 설정)
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		
		
		//저장될 파일 정보 객체
		File dest = new File( stored, storedName );
		
		try {
			//업로드된 파일을 저장하기
			file.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//----------------------------------------
		information.setiOriginName(file.getOriginalFilename());
		information.setiStoredName(storedName);
		information.setiSize((int) file.getSize());
		information.setiContentType(file.getContentType());
		information.setiState("Y");
		
		informationDao.updateInformation(information);
		informationDao.updateProjectState(information);
		
	}
	
	@Override
	public Project viewProject(Project project) {
		return informationDao.selectProject(project);
	}
}
