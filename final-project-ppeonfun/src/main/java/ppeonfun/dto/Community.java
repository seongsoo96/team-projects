package ppeonfun.dto;

import java.util.Date;

public class Community {
	private int comNo;
	private int pNo;
	private int mNo;
	private String comContent;
	private Date comDate;
	@Override
	public String toString() {
		return "Community [comNo=" + comNo + ", pNo=" + pNo + ", mNo=" + mNo + ", comContent=" + comContent
				+ ", comDate=" + comDate + "]";
	}
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	
	
}
