package ppeonfun.dto;

import java.util.Date;

public class Commentss {
	private int csNo;
	private int cNo;
	private int mNo;
	private String csContent;
	private Date csCreateDate;
	@Override
	public String toString() {
		return "Commentss [csNo=" + csNo + ", cNo=" + cNo + ", mNo=" + mNo + ", csContent=" + csContent
				+ ", csCreateDate=" + csCreateDate + "]";
	}
	public int getCsNo() {
		return csNo;
	}
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getCsContent() {
		return csContent;
	}
	public void setCsContent(String csContent) {
		this.csContent = csContent;
	}
	public Date getCsCreateDate() {
		return csCreateDate;
	}
	public void setCsCreateDate(Date csCreateDate) {
		this.csCreateDate = csCreateDate;
	}
	
	
}
