package ppeonfun.dto;

import java.util.Date;

public class CommunityAnswer {
	private int caNo;
	private int comNo;
	private int mNo;
	private String caContent;
	private Date caDate;
	@Override
	public String toString() {
		return "CommunityAnswer [caNo=" + caNo + ", comNo=" + comNo + ", mNo=" + mNo + ", caContent=" + caContent
				+ ", caDate=" + caDate + "]";
	}
	public int getCaNo() {
		return caNo;
	}
	public void setCaNo(int caNo) {
		this.caNo = caNo;
	}
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getCaContent() {
		return caContent;
	}
	public void setCaContent(String caContent) {
		this.caContent = caContent;
	}
	public Date getCaDate() {
		return caDate;
	}
	public void setCaDate(Date caDate) {
		this.caDate = caDate;
	}
	
	
}
