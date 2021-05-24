package ppeonfun.dto;

import java.util.Date;

public class Story {
	private int sNo;
	private int pNo;
	private String sUrl;
	private String sSummery;
	private String sStory;
	private Date sCreateDate;
	private String sState;
	@Override
	public String toString() {
		return "Story [sNo=" + sNo + ", pNo=" + pNo + ", sUrl=" + sUrl + ", sSummery=" + sSummery + ", sStory=" + sStory
				+ ", sCreateDate=" + sCreateDate + ", sState=" + sState + "]";
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getsUrl() {
		return sUrl;
	}
	public void setsUrl(String sUrl) {
		this.sUrl = sUrl;
	}
	public String getsSummery() {
		return sSummery;
	}
	public void setsSummery(String sSummery) {
		this.sSummery = sSummery;
	}
	public String getsStory() {
		return sStory;
	}
	public void setsStory(String sStory) {
		this.sStory = sStory;
	}
	public Date getsCreateDate() {
		return sCreateDate;
	}
	public void setsCreateDate(Date sCreateDate) {
		this.sCreateDate = sCreateDate;
	}
	public String getsState() {
		return sState;
	}
	public void setsState(String sState) {
		this.sState = sState;
	}
	
	
	
	
}
