package ppeonfun.service.admin.requirement;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dao.admin.requirement.RequirementDao;
import ppeonfun.dto.Project;
import ppeonfun.dto.Requirement;
import ppeonfun.dto.RequirementFile;


@Service("admin.RequirementService")
public class RequirementServiceImpl implements RequirementService {
	private static final Logger logger = LoggerFactory.getLogger(RequirementServiceImpl.class);
	@Autowired private RequirementDao requirementDao;
	@Autowired private ServletContext context;
	
	@Override
	public Project projectState(Project project) {
		
		return requirementDao.selectByState(project);
	}
	@Override
	public boolean requirementState(Project project) {
		if(requirementDao.selectIsRequirement(project) > 0) {
			return true; //값이 존재 modify 수정으로
		}
		return false; //값이 없음 write 입력으로
	}
	@Override
	public String selectByName(Project project) {
		
		return requirementDao.selectByName(project);
	}
	
	@Override
	public Requirement viewRequirement(Project project) {
		return requirementDao.selectRequirement(project);
	}
	
	@Override
	@Transactional
	public void inputRequirementFile(Requirement requirement,MultipartFile file) {
		
		requirementDao.insertRequirement(requirement); //데이터 값 삽입
		requirementDao.updateProjectState(requirement); // 프로젝트 기본 요건 상태값 변경
		
		if( file.getSize() <= 0 ) {
			return;
		}
	
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload");
		
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
		RequirementFile requirementFile = new RequirementFile();
		requirementFile.setRfOriginName(file.getOriginalFilename());
		requirementFile.setRfStoredName(storedName);
		requirementFile.setRfSize((int) file.getSize());
		requirementFile.setRfContentType(file.getContentType());
		requirementFile.setrNo(requirement.getrNo());
		
		requirementDao.insertRequirementFile(requirementFile);
	}
	
	@Override
	public RequirementFile viewRequirementFile(Requirement requirement) {
		// TODO Auto-generated method stub
		return requirementDao.selectRequirementFile(requirement);
	}
	
	@Override
	public void removeFile(String storedName, Requirement requirement) {
		
		if(storedName ==null || "".equals(storedName)) {
			return;
		}
		String storedPath = context.getRealPath("upload");
		
		//폴더가 존재하지 않으면 생성하기
		File stored = new File(storedPath+"/"+storedName);
		if( stored.exists() ) {
			if(stored.delete()) {
				logger.info("파일 삭제 완료 {}", storedName);
			}else {
				logger.info("파일 삭제 실패 {}", storedName);
			}
		}
		requirementDao.deleteRequirementFile(requirement);
		
		
	}
	
	@Override
	public Requirement getRequirement(Requirement requirement) {
		Project project = new Project();
		project.setpNo(requirement.getpNo());
		
		Requirement result=requirementDao.selectRequirement(project);
		requirement.setrNo(result.getrNo());
		requirement.setrState("Y");
		
		return requirement;
	}
	@Override
	@Transactional
	public void modifyRequirementFile(Requirement requirement, MultipartFile file) {
		requirementDao.updateRequirement(requirement); //데이터 값 수정
		requirementDao.updateProjectState(requirement); // 프로젝트 기본 요건 상태값 변경
		
		if( file.getSize() <= 0 ) {
			return;
		}
	
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload");
		
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
		RequirementFile requirementFile = new RequirementFile();
		requirementFile.setRfOriginName(file.getOriginalFilename());
		requirementFile.setRfStoredName(storedName);
		requirementFile.setRfSize((int) file.getSize());
		requirementFile.setRfContentType(file.getContentType());
		requirementFile.setrNo(requirement.getrNo());
		
		requirementDao.insertRequirementFile(requirementFile);
	}
	@Override
	public Project viewProject(Project project) {
		
		return requirementDao.selectProject(project);
	}
}
