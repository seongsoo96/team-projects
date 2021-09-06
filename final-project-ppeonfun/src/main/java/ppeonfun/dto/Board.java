package ppeonfun.dto;

import java.util.Date;

public class Board {
	private int bNo;
	private int mNo;
	private String bTitle;
	private String bContent;
	private Date bCreateDate;
	private int bHit;
	private String bGrade;
	
	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", mNo=" + mNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bCreateDate="
				+ bCreateDate + ", bHit=" + bHit + ", bGrade=" + bGrade + "]";
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Date getbCreateDate() {
		return bCreateDate;
	}
	public void setbCreateDate(Date bCreateDate) {
		this.bCreateDate = bCreateDate;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public String getbGrade() {
		return bGrade;
	}
	public void setbGrade(String bGrade) {
		this.bGrade = bGrade;
	}
	
	
}
