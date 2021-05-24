package ppeonfun.dto;

import java.util.Date;

public class StoryFile {
	private int sfNo;
	private int sNo;
	private String sfOriginName;
	private String sfStoredName;
	private Date sfCreateDate;
	private int sfSize;
	private String sfContentType;
	@Override
	public String toString() {
		return "StoryFile [sfNo=" + sfNo + ", sNo=" + sNo + ", sfOriginName=" + sfOriginName + ", sfStoredName="
				+ sfStoredName + ", sfCreateDate=" + sfCreateDate + ", sfSize=" + sfSize + ", sfContentType="
				+ sfContentType + "]";
	}
	public int getSfNo() {
		return sfNo;
	}
	public void setSfNo(int sfNo) {
		this.sfNo = sfNo;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getSfOriginName() {
		return sfOriginName;
	}
	public void setSfOriginName(String sfOriginName) {
		this.sfOriginName = sfOriginName;
	}
	public String getSfStoredName() {
		return sfStoredName;
	}
	public void setSfStoredName(String sfStoredName) {
		this.sfStoredName = sfStoredName;
	}
	public Date getSfCreateDate() {
		return sfCreateDate;
	}
	public void setSfCreateDate(Date sfCreateDate) {
		this.sfCreateDate = sfCreateDate;
	}
	public int getSfSize() {
		return sfSize;
	}
	public void setSfSize(int sfSize) {
		this.sfSize = sfSize;
	}
	public String getSfContentType() {
		return sfContentType;
	}
	public void setSfContentType(String sfContentType) {
		this.sfContentType = sfContentType;
	}
	
	
}
