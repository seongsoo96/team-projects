package ppeonfun.dto;

import java.util.Date;

public class Favorite {	
	private int favNo;
	private int pNo;
	private int mNo;
	private Date favCreateDate;
	@Override
	public String toString() {
		return "Favorite [favNo=" + favNo + ", pNo=" + pNo + ", mNo=" + mNo + "]";
	}
	public int getFavNo() {
		return favNo;
	}
	public void setFavNo(int favNo) {
		this.favNo = favNo;
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
	public Date getFavCreateDate() {
		return favCreateDate;
	}
	public void setFavCreateDate(Date favCreateDate) {
		this.favCreateDate = favCreateDate;
	}
	
	
}
