package ppeonfun.dto;

import java.util.Date;

public class Message {
	private int msgNo;
	private String msgContent;
	private int crNo;
	private int cpNo;
	private Date msgTime;
	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", msgContent=" + msgContent + ", crNo=" + crNo + ", cpNo=" + cpNo
				+ ", msgTime=" + msgTime + "]";
	}
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public int getCrNo() {
		return crNo;
	}
	public void setCrNo(int crNo) {
		this.crNo = crNo;
	}
	public int getCpNo() {
		return cpNo;
	}
	public void setCpNo(int cpNo) {
		this.cpNo = cpNo;
	}
	public Date getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}
	
	

	
	
}
