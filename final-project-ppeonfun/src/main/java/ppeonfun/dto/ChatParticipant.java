package ppeonfun.dto;

import java.util.Date;

public class ChatParticipant {
	private int cpNo;
	private int crNo;
	private int mNo;
	private Date cpCreateDate;
	@Override
	public String toString() {
		return "ChatParticipant [cpNo=" + cpNo + ", crNo=" + crNo + ", mNo=" + mNo + ", cpCreateDate=" + cpCreateDate
				+ "]";
	}
	public int getCpNo() {
		return cpNo;
	}
	public void setCpNo(int cpNo) {
		this.cpNo = cpNo;
	}
	public int getCrNo() {
		return crNo;
	}
	public void setCrNo(int crNo) {
		this.crNo = crNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public Date getCpCreateDate() {
		return cpCreateDate;
	}
	public void setCpCreateDate(Date cpCreateDate) {
		this.cpCreateDate = cpCreateDate;
	}
	
	
}
