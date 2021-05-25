package ppeonfun.dto;

import java.util.Date;

public class Information {
	private int iNo;
	private int pNo;
	private String iTitle;
	private int iMoney;
	private String iOriginName;
	private String iStoredName;
	private String iCategory;
	private Date iStartDate;
	private Date iEndDate;
	private Date iCreateDate;
	private String iState;
	private int iSize;
	private String iContentType;
	
	@Override
	public String toString() {
		return "Information [iNo=" + iNo + ", pNo=" + pNo + ", iTitle=" + iTitle + ", iMoney=" + iMoney
				+ ", iOriginName=" + iOriginName + ", iStoredName=" + iStoredName + ", iCategory=" + iCategory
				+ ", iStartDate=" + iStartDate + ", iEndDate=" + iEndDate + ", iCreateDate=" + iCreateDate + ", iState="
				+ iState + ", iSize=" + iSize + ", iContentType=" + iContentType + "]";
	}
	public int getiNo() {
		return iNo;
	}
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getiTitle() {
		return iTitle;
	}
	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}
	public int getiMoney() {
		return iMoney;
	}
	public void setiMoney(int iMoney) {
		this.iMoney = iMoney;
	}
	public String getiOriginName() {
		return iOriginName;
	}
	public void setiOriginName(String iOriginName) {
		this.iOriginName = iOriginName;
	}
	public String getiStoredName() {
		return iStoredName;
	}
	public void setiStoredName(String iStoredName) {
		this.iStoredName = iStoredName;
	}
	public String getiCategory() {
		return iCategory;
	}
	public void setiCategory(String iCategory) {
		this.iCategory = iCategory;
	}
	public Date getiStartDate() {
		return iStartDate;
	}
	public void setiStartDate(Date iStartDate) {
		this.iStartDate = iStartDate;
	}
	public Date getiEndDate() {
		return iEndDate;
	}
	public void setiEndDate(Date iEndDate) {
		this.iEndDate = iEndDate;
	}
	public Date getiCreateDate() {
		return iCreateDate;
	}
	public void setiCreateDate(Date iCreateDate) {
		this.iCreateDate = iCreateDate;
	}
	public String getiState() {
		return iState;
	}
	public void setiState(String iState) {
		this.iState = iState;
	}
	public int getiSize() {
		return iSize;
	}
	public void setiSize(int iSize) {
		this.iSize = iSize;
	}
	public String getiContentType() {
		return iContentType;
	}
	public void setiContentType(String iContentType) {
		this.iContentType = iContentType;
	}
	
	
	
	
	
	
}
