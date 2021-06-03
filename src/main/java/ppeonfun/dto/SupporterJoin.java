package ppeonfun.dto;

import java.util.Date;

public class SupporterJoin {
	//supporter
	private int suNo;
	private int pNo;
	private int mNo;
	private int reNo;
	private Date suCreateDate;
	private int suAddMoney;
	
	//member
	private String mId;
	
	//reward
	private int reMoney;
	
	//mypage
	private String myOriginName;
	private String myStoredName;
	
	//information
	private int iMoney;
	private Date iEndDate;
	
	@Override
	public String toString() {
		return "SupporterJoin [suNo=" + suNo + ", pNo=" + pNo + ", mNo=" + mNo + ", reNo=" + reNo + ", suCreateDate="
				+ suCreateDate + ", suAddMoney=" + suAddMoney + ", mId=" + mId + ", reMoney=" + reMoney
				+ ", myOriginName=" + myOriginName + ", myStoredName=" + myStoredName + ", iMoney=" + iMoney
				+ ", iEndDate=" + iEndDate + "]";
	}
	
	public int getSuNo() {
		return suNo;
	}
	public void setSuNo(int suNo) {
		this.suNo = suNo;
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
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public Date getSuCreateDate() {
		return suCreateDate;
	}
	public void setSuCreateDate(Date suCreateDate) {
		this.suCreateDate = suCreateDate;
	}
	public int getSuAddMoney() {
		return suAddMoney;
	}
	public void setSuAddMoney(int suAddMoney) {
		this.suAddMoney = suAddMoney;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getReMoney() {
		return reMoney;
	}
	public void setReMoney(int reMoney) {
		this.reMoney = reMoney;
	}
	public String getMyOriginName() {
		return myOriginName;
	}
	public void setMyOriginName(String myOriginName) {
		this.myOriginName = myOriginName;
	}
	public String getMyStoredName() {
		return myStoredName;
	}
	public void setMyStoredName(String myStoredName) {
		this.myStoredName = myStoredName;
	}
	public int getiMoney() {
		return iMoney;
	}
	public void setiMoney(int iMoney) {
		this.iMoney = iMoney;
	}
	public Date getiEndDate() {
		return iEndDate;
	}
	public void setiEndDate(Date iEndDate) {
		this.iEndDate = iEndDate;
	}
	
	
}
