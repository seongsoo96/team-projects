package ppeonfun.service.admin.maker;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dao.admin.maker.MakerDao;
import ppeonfun.dto.Information;
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
		if( file.getSize() <= 0 ) {
			return;
		}
	
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload/maker");
		
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
		maker.setMaOriginName(file.getOriginalFilename());
		maker.setMaStoredName(storedName);
		maker.setMaSize((int) file.getSize());
		maker.setMaContentType(file.getContentType());
		maker.setMaState("Y");
		
		makerDao.insertMaker(maker);
		makerDao.updateProjectState(maker);
		
	}
	@Override
	public Maker getMaker(Maker maker) {
		Project project = new Project();
		project.setpNo(maker.getpNo());
		
		Maker result=makerDao.selectMaker(project);
		maker.setMaNo(result.getMaNo());
		maker.setMaState("Y");
		
		return maker;
	}
	@Override
	public void modifyMakerFile(Maker maker, MultipartFile file) {
		if( file.getSize() <= 0 ) {
			return;
		}
	
		//파일이 저장될 경로(real path)
		String storedPath = context.getRealPath("upload/maker");
		
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
		maker.setMaOriginName(file.getOriginalFilename());
		maker.setMaStoredName(storedName);
		maker.setMaSize((int) file.getSize());
		maker.setMaContentType(file.getContentType());
		maker.setMaState("Y");
		
		makerDao.updateMaker(maker);
		makerDao.updateProjectState(maker);
		
	}
	@Override
	public void removeFile(String storedName) {
		if(storedName ==null || "".equals(storedName)) {
			return;
		}
		String storedPath = context.getRealPath("upload/maker");
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

}
