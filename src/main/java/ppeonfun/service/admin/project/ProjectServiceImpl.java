package ppeonfun.service.admin.project;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ppeonfun.dao.admin.project.ProjectDao;
import ppeonfun.dto.ChatParticipant;
import ppeonfun.dto.ChatRoom;
import ppeonfun.dto.Information;
import ppeonfun.dto.Message;
import ppeonfun.dto.Project;
import ppeonfun.util.Paging;

@Service("admin.ProjectService")
public class ProjectServiceImpl implements ProjectService {
	private static final Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);
	
	@Autowired private ProjectDao projectDao;
	
	@Override
	public Paging getPaging(Paging inData) {
		//전체 개수
		int totalCount = projectDao.selectCntAll(inData);
		logger.info("totalCount: {}", totalCount);

		//Paging객체 생성
		Paging paging = new Paging(totalCount, inData.getCurPage());
		paging.setCategory(inData.getCategory());
		paging.setSearch(inData.getSearch());
		
		return paging;
	}
	
	@Override
	public List<Project> selectAllProject(Paging paging) {
		
		return projectDao.selectAll(paging);
	}
	
	@Override
	public String selectByName(Project project) {
		
		return projectDao.selectByName(project);
	}
	
	@Override
	public Project selectProject(Project project) {
		return projectDao.selectProject(project);
	}
	
	@Override
	public Project input(int mNo) {
		Project project = new Project();
		project.setmNo(mNo);
		projectDao.insertProject(project);
		project=projectDao.selectProject(project);
		
		return project;
	}
	@Override
	public Project submitProject(Project project) {
		project.setpState("S");
		if(!"Y".equals(project.getpRequirements()) || 
		   !"Y".equals(project.getpInformation()) ||
		   !"Y".equals(project.getpReward()) ||
		   !"Y".equals(project.getpStory()) ||
		   !"Y".equals(project.getpMaker()) 
				) { //Y상태가 하나라도 아닐경우
			return null;
		}
		projectDao.updateSubmit(project);
		
		return project;
	}
	@Override
	public void approveProject(Project project) {
		project.setpState("Y");
		
		projectDao.updateSubmit(project);
		
	}
	
	
	@Override
	public void messageSend(Project project, HttpSession session ) {
		int mNo =(Integer)session.getAttribute("mNo");
		
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setCrName("프로젝트 승인방");
		projectDao.insertChatRoom(chatRoom); //채팅방 개설
		ChatParticipant sender = new ChatParticipant();
		sender.setCrNo(chatRoom.getCrNo());
		sender.setmNo(mNo);
		
		projectDao.insertChatParticipant(sender); //송신자 채팅방 참여
		project = projectDao.selectProject(project); //프로젝트 개설자 가져오기
		ChatParticipant receiver = new ChatParticipant();
		receiver.setCrNo(chatRoom.getCrNo());
		receiver.setmNo(project.getmNo());
		
		projectDao.insertChatParticipant(receiver); // 수신자 채팅방 참여
		Message message = new Message();
		message.setCrNo(chatRoom.getCrNo());
		message.setCpNo(sender.getCpNo());
		message.setMsgContent("프로젝트 승인 완료");
		
		projectDao.insertMessage(message);
	}
	@Override
	public void messageSend(Project project, HttpSession session, Message message) {
		int mNo =(Integer)session.getAttribute("mNo");
		
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setCrName("프로젝트 거부방");
		projectDao.insertChatRoom(chatRoom); //채팅방 개설
		ChatParticipant sender = new ChatParticipant();
		sender.setCrNo(chatRoom.getCrNo());
		sender.setmNo(mNo);
		
		projectDao.insertChatParticipant(sender); //송신자 채팅방 참여
		project = projectDao.selectProject(project); //프로젝트 개설자 가져오기
		ChatParticipant receiver = new ChatParticipant();
		receiver.setCrNo(chatRoom.getCrNo());
		receiver.setmNo(project.getmNo());
		
		projectDao.insertChatParticipant(receiver); // 수신자 채팅방 참여
		message.setCrNo(chatRoom.getCrNo());
		message.setCpNo(sender.getCpNo());
		
		projectDao.insertMessage(message);
		
	}
	@Override
	public void rejectProject(Project project) {
		project.setpState("N");
		
		projectDao.updateSubmit(project);
	}
	@Override
	public void insertStartDate(Project project) {
		Date start = null;
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println("current: " + df.format(cal.getTime()));
		
        cal.add(Calendar.DATE, 14); //2주 더하기
        try {
			start = df.parse(df.format(cal.getTime()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Information information = projectDao.selectInformation(project);
        information.setiStartDate(start);
        projectDao.updateInformation(information);
        
	}
}
