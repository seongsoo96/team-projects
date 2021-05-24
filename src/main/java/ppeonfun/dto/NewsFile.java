package ppeonfun.dto;

import java.util.Date;

public class NewsFile {
	private int nfNo;
	private int nNo;
	private String nfOriginName;
	private String nfStoredName;
	private Date nfCreateDate;
	private int nfSize;
	private String nfContentYype;
	@Override
	public String toString() {
		return "NewsFile [nfNo=" + nfNo + ", nNo=" + nNo + ", nfOriginName=" + nfOriginName + ", nfStoredName="
				+ nfStoredName + ", nfCreateDate=" + nfCreateDate + ", nfSize=" + nfSize + ", nfContentYype="
				+ nfContentYype + "]";
	}
	public int getNfNo() {
		return nfNo;
	}
	public void setNfNo(int nfNo) {
		this.nfNo = nfNo;
	}
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getNfOriginName() {
		return nfOriginName;
	}
	public void setNfOriginName(String nfOriginName) {
		this.nfOriginName = nfOriginName;
	}
	public String getNfStoredName() {
		return nfStoredName;
	}
	public void setNfStoredName(String nfStoredName) {
		this.nfStoredName = nfStoredName;
	}
	public Date getNfCreateDate() {
		return nfCreateDate;
	}
	public void setNfCreateDate(Date nfCreateDate) {
		this.nfCreateDate = nfCreateDate;
	}
	public int getNfSize() {
		return nfSize;
	}
	public void setNfSize(int nfSize) {
		this.nfSize = nfSize;
	}
	public String getNfContentYype() {
		return nfContentYype;
	}
	public void setNfContentYype(String nfContentYype) {
		this.nfContentYype = nfContentYype;
	}
	
	
}
