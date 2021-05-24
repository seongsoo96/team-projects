package ppeonfun.dto;

import java.util.Date;

public class ChatRoom {
	private int crNo;
	private String crName;
	private Date crCreateDate;
	@Override
	public String toString() {
		return "ChatRoom [crNo=" + crNo + ", crName=" + crName + ", crCreateDate=" + crCreateDate + "]";
	}
	public int getCrNo() {
		return crNo;
	}
	public void setCrNo(int crNo) {
		this.crNo = crNo;
	}
	public String getCrName() {
		return crName;
	}
	public void setCrName(String crName) {
		this.crName = crName;
	}
	public Date getCrCreateDate() {
		return crCreateDate;
	}
	public void setCrCreateDate(Date crCreateDate) {
		this.crCreateDate = crCreateDate;
	}
	
	

}
