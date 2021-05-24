package ppeonfun.dto;

import java.util.Date;

public class Alarm {
	private int aNo;
	private int pNo;
	private int mNo;
	private Date aCreateDate;
	@Override
	public String toString() {
		return "Alarm [aNo=" + aNo + ", pNo=" + pNo + ", mNo=" + mNo + ", aCreateDate=" + aCreateDate + "]";
	}
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
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
	public Date getaCreateDate() {
		return aCreateDate;
	}
	public void setaCreateDate(Date aCreateDate) {
		this.aCreateDate = aCreateDate;
	}
	
	

}
