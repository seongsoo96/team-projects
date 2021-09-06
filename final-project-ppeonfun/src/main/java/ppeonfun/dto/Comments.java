package ppeonfun.dto;

import java.util.Date;

public class Comments {
	private int cNo;
	private int bNo;
	private int mNo;
	private String cContent;
	private Date cCreateDate;
	@Override
	public String toString() {
		return "Comments [cNo=" + cNo + ", bNo=" + bNo + ", mNo=" + mNo + ", cContent=" + cContent + ", cCreateDate="
				+ cCreateDate + "]";
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
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
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public Date getcCreateDate() {
		return cCreateDate;
	}
	public void setcCreateDate(Date cCreateDate) {
		this.cCreateDate = cCreateDate;
	}
	
	
}
