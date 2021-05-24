package ppeonfun.dto;

import java.util.Date;

public class RequirementFile {	
	private int rfNo;
	private int rNo;
	private String rfOriginName;
	private String rfStoredName;
	private Date rfCreateDate;
	private int rfSize;
	private String rfContentType;
	@Override
	public String toString() {
		return "RequirementFile [rfNo=" + rfNo + ", rNo=" + rNo + ", rfOriginName=" + rfOriginName + ", rfStoredName="
				+ rfStoredName + ", rfCreateDate=" + rfCreateDate + ", rfSize=" + rfSize + ", rfContentType="
				+ rfContentType + "]";
	}
	public int getRfNo() {
		return rfNo;
	}
	public void setRfNo(int rfNo) {
		this.rfNo = rfNo;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getRfOriginName() {
		return rfOriginName;
	}
	public void setRfOriginName(String rfOriginName) {
		this.rfOriginName = rfOriginName;
	}
	public String getRfStoredName() {
		return rfStoredName;
	}
	public void setRfStoredName(String rfStoredName) {
		this.rfStoredName = rfStoredName;
	}
	public Date getRfCreateDate() {
		return rfCreateDate;
	}
	public void setRfCreateDate(Date rfCreateDate) {
		this.rfCreateDate = rfCreateDate;
	}
	public int getRfSize() {
		return rfSize;
	}
	public void setRfSize(int rfSize) {
		this.rfSize = rfSize;
	}
	public String getRfContentType() {
		return rfContentType;
	}
	public void setRfContentType(String rfContentType) {
		this.rfContentType = rfContentType;
	}
	
	
}	
