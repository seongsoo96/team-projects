package ppeonfun.service.user.maker.news;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ppeonfun.dao.user.maker.news.NewsDao;
import ppeonfun.dto.News;
import ppeonfun.dto.NewsFile;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;


@Service("user.maker.NewsServiceImpl")
public class NewsServiceImpl implements NewsService {
	private static final Logger logger = LoggerFactory.getLogger(NewsServiceImpl.class);
	@Autowired private NewsDao newsDao;
	@Autowired private ServletContext context;
	
	@Override
	public Paging getPaging(Paging inData, Project project) {
		//전체 개수
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", inData.getCategory());
		map.put("search", inData.getSearch());
		map.put("pNo", project.getpNo());
		logger.info("hashmap {}", map);
		
		
		int totalCount = newsDao.selectCntAll(map);
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		paging.setCategory(inData.getCategory());
		paging.setSearch(inData.getSearch());

		return paging;
	}
	
	@Override
	public List<News> selectAllNews(Paging paging, Project project) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", paging.getCategory());
		map.put("search", paging.getSearch());
		map.put("pNo", project.getpNo());
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		
		
		return newsDao.selectAll(map);
	}
	
	@Override
	public String selectByName(Project project) {
	
		return newsDao.selectByName(project);
	}
	
	@Override
	public Project viewProject(Project project) {
		return newsDao.selectProject(project);
	}
	
	@Override
	public void inputNewsFile(News news, List<MultipartFile> fileList) {
		newsDao.insertNews(news);
		int count =0;
		for( MultipartFile file : fileList ) {
			count++; //최대 5장까지 허요
			if(count>5) {
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
			
			NewsFile newsFile = new NewsFile();
			newsFile.setnNo(news.getnNo());
			newsFile.setNfOriginName(file.getOriginalFilename());
			newsFile.setNfSize((int)file.getSize());
			newsFile.setNfContentType(file.getContentType());
			newsFile.setNfStoredName(filename);
			
			newsDao.insertNewsFile(newsFile);
		} // for문 end (다중 첨부파일)
		
	}
	@Override
	public Date selectByOpenDate(News news) {
		
		return newsDao.selectByOpenDate(news);
	}
	@Override
	public News viewNews(News news) {
		
		return newsDao.selectNews(news);
	}
	@Override
	public List<NewsFile> viewNewsList(News news) {
		// TODO Auto-generated method stub
		return newsDao.selectNewsFile(news);
	}
	@Override
	public Project getProject(News news) {
		Project project = new Project();
		project.setpNo(news.getpNo());
		return project;
	}
	@Override
	public void removeFile(News news, List<NewsFile> newsFile) {
		
		for(int i=0; i<newsFile.size(); i++) {
			
			
			String storedPath = context.getRealPath("upload");
			
			//폴더가 존재하지 않으면 생성하기
			File stored = new File(storedPath+"/"+newsFile.get(i).getNfStoredName());
			if( stored.exists() ) {
				if(stored.delete()) {
					logger.info("파일 삭제 완료 {}", newsFile.get(i).getNfStoredName());
				}else {
					logger.info("파일 삭제 실패 {}", newsFile.get(i).getNfStoredName());
				}
			}
			newsDao.deleteNewsFile(newsFile.get(i));
		}
		
	}
	@Override
	public void modifyNewsFile(News news, List<MultipartFile> fileList) {
		newsDao.updateNews(news);
		int count =0;
		for( MultipartFile file : fileList ) {
			count++; //최대 5장까지 허요
			if(count>5) {
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
			
			NewsFile newsFile = new NewsFile();
			newsFile.setnNo(news.getnNo());
			newsFile.setNfOriginName(file.getOriginalFilename());
			newsFile.setNfSize((int)file.getSize());
			newsFile.setNfContentType(file.getContentType());
			newsFile.setNfStoredName(filename);
			
			newsDao.insertNewsFile(newsFile);
		} // for문 end (다중 첨부파일)
		
	}
	
	@Override
	public void removeNewsFile(News news) {
		newsDao.deleteNews(news);
		
	}
	
}
