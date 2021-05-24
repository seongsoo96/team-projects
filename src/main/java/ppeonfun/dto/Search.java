package ppeonfun.dto;

import java.util.Date;

public class Search {
	private int sNo;
	private int mNo;
	private Date sCreateDate;
	private String sContext;
	@Override
	public String toString() {
		return "Search [sNo=" + sNo + ", mNo=" + mNo + ", sCreateDate=" + sCreateDate + ", sContext=" + sContext + "]";
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public Date getsCreateDate() {
		return sCreateDate;
	}
	public void setsCreateDate(Date sCreateDate) {
		this.sCreateDate = sCreateDate;
	}
	public String getsContext() {
		return sContext;
	}
	public void setsContext(String sContext) {
		this.sContext = sContext;
	}
	
	
}
