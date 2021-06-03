package ppeonfun.dto;

public class Recommend {
	private int bNo;
	private int mNo;
	
	@Override
	public String toString() {
		return "Recommend [bNo=" + bNo + ", mNo=" + mNo + "]";
	}
	
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	
	
	
	
}
