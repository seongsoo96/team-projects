package ppeonfun.dto;

import java.util.Date;

public class MessageFile {
	private int msgfNo;
	private String msgfStoredName;
	private String msgfOriginName;
	private Date msgfTime;
	private int msgNo;
	private int msgSize;
	private String msgContentType;
	@Override
	public String toString() {
		return "MessageFile [msgfNo=" + msgfNo + ", msgfStoredName=" + msgfStoredName + ", msgfOriginName="
				+ msgfOriginName + ", msgfTime=" + msgfTime + ", msgNo=" + msgNo + ", msgSize=" + msgSize
				+ ", msgContentType=" + msgContentType + "]";
	}
	public int getMsgfNo() {
		return msgfNo;
	}
	public void setMsgfNo(int msgfNo) {
		this.msgfNo = msgfNo;
	}
	public String getMsgfStoredName() {
		return msgfStoredName;
	}
	public void setMsgfStoredName(String msgfStoredName) {
		this.msgfStoredName = msgfStoredName;
	}
	public String getMsgfOriginName() {
		return msgfOriginName;
	}
	public void setMsgfOriginName(String msgfOriginName) {
		this.msgfOriginName = msgfOriginName;
	}
	public Date getMsgfTime() {
		return msgfTime;
	}
	public void setMsgfTime(Date msgfTime) {
		this.msgfTime = msgfTime;
	}
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public int getMsgSize() {
		return msgSize;
	}
	public void setMsgSize(int msgSize) {
		this.msgSize = msgSize;
	}
	public String getMsgContentType() {
		return msgContentType;
	}
	public void setMsgContentType(String msgContentType) {
		this.msgContentType = msgContentType;
	}
	
	
	
}
