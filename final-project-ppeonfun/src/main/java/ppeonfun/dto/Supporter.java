package ppeonfun.dto;

import java.util.Date;

public class Supporter {
	private int suNo;
	private int pNo;
	private int mNo;
	private int reNo;
	private Date suCreateDate;
	private int suAddMoney;
	private int suGroup;
	
	
	@Override
	public String toString() {
		return "Supporter [suNo=" + suNo + ", pNo=" + pNo + ", mNo=" + mNo + ", reNo=" + reNo + ", suCreateDate="
				+ suCreateDate + ", suAddMoney=" + suAddMoney + ", suGroup=" + suGroup + "]";
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
	public int getSuGroup() {
		return suGroup;
	}
	public void setSuGroup(int suGroup) {
		this.suGroup = suGroup;
	}
	
	
	
}
