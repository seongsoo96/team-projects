package ppeonfun.service.admin.story;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dao.admin.stroy.StoryDao;
import ppeonfun.dto.Project;
import ppeonfun.dto.Story;
import ppeonfun.dto.StoryFile;

@Service("admin.StroyServiceImpl")
public class StroyServiceImpl implements StoryService {
	private static final Logger logger = LoggerFactory.getLogger(StroyServiceImpl.class);
	@Autowired private StoryDao storyDao;
	@Autowired private ServletContext context;
	
	@Override
	public boolean storyState(Project project) {
		if(storyDao.selectIsStory(project) > 0) {
			return true; //값이 존재 modify 수정으로
		}
		return false; //값이 없음 write 입력으로
	}
	@Override
	public Project projectState(Project project) {
		return storyDao.selectByState(project);
	}
	@Override
	public String selectByName(Project project) {
		return storyDao.selectByName(project);
	}
	@Override
	public Story viewStory(Project project) {
		return storyDao.selectStory(project);
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
	@Transactional
	public void inputStoryFile(Story story, List<MultipartFile> fileList) {
		storyDao.insertStory(story);
		storyDao.updateProjectState(story);
		
		for( MultipartFile file : fileList ) {
			//url 값이 존재할경우
			if(story.getsUrl()!=null && !"".equals(story.getsUrl())) {
				logger.info("url값 존재 {}", story.getsUrl());
				return;
			}
			
			if( file.getSize() <= 0 ) {
				return;
			}
			String storedPath = context.getRealPath("upload");
			
			//폴더가 존재하지 않으면 생성하기
			File stored = new File(storedPath);
			if( !stored.exists() ) {
				stored.mkdir();
			}
				
			String filename = file.getOriginalFilename();
				
			String uid = UUID.randomUUID().toString().split("-")[4];
			
			filename += uid;
			
			File dest = new File( stored, filename );
				
			try {
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			StoryFile storyFile = new StoryFile();
			storyFile.setsNo(story.getsNo());
			storyFile.setSfOriginName(file.getOriginalFilename());
			storyFile.setSfSize((int)file.getSize());
			storyFile.setSfContentType(file.getContentType());
			storyFile.setSfStoredName(filename);
			
			storyDao.insertStoryFile(storyFile);
		} // for문 end (다중 첨부파일)
		
	}
	@Override
	public List<StoryFile> viewStoryFile(Story story) {
		return storyDao.selectAllStroyFile(story);
	}
}
