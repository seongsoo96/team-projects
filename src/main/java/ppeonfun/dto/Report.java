package ppeonfun.dto;

import java.util.Date;

public class Report {
	private int repNo;
	private int pNo;
	private int mReporterNo;
	private int mFounderNo;
	private String repContent;
	private Date repCreateDate;
	private String repManagerContent;
	private String repState;
	@Override
	public String toString() {
		return "Report [repNo=" + repNo + ", pNo=" + pNo + ", mReporterNo=" + mReporterNo + ", mFounderNo=" + mFounderNo
				+ ", repContent=" + repContent + ", repCreateDate=" + repCreateDate + ", repManagerContent="
				+ repManagerContent + ", repState=" + repState + "]";
	}
	public int getRepNo() {
		return repNo;
	}
	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getmReporterNo() {
		return mReporterNo;
	}
	public void setmReporterNo(int mReporterNo) {
		this.mReporterNo = mReporterNo;
	}
	public int getmFounderNo() {
		return mFounderNo;
	}
	public void setmFounderNo(int mFounderNo) {
		this.mFounderNo = mFounderNo;
	}
	public String getRepContent() {
		return repContent;
	}
	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}
	public Date getRepCreateDate() {
		return repCreateDate;
	}
	public void setRepCreateDate(Date repCreateDate) {
		this.repCreateDate = repCreateDate;
	}
	public String getRepManagerContent() {
		return repManagerContent;
	}
	public void setRepManagerContent(String repManagerContent) {
		this.repManagerContent = repManagerContent;
	}
	public String getRepState() {
		return repState;
	}
	public void setRepState(String repState) {
		this.repState = repState;
	}
	
	
	
}
