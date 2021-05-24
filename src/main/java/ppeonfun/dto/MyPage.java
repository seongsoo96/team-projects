package ppeonfun.dto;

public class MyPage {
	private int myNo;
	private String myOriginName;
	private String myStoredName;
	private String myIntroduce;
	private int mySize;
	private String myContentType;
	@Override
	public String toString() {
		return "MyPage [myNo=" + myNo + ", myOriginName=" + myOriginName + ", myStoredName=" + myStoredName
				+ ", myIntroduce=" + myIntroduce + ", mySize=" + mySize + ", myContentType=" + myContentType + "]";
	}
	public int getMyNo() {
		return myNo;
	}
	public void setMyNo(int myNo) {
		this.myNo = myNo;
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
	public String getMyIntroduce() {
		return myIntroduce;
	}
	public void setMyIntroduce(String myIntroduce) {
		this.myIntroduce = myIntroduce;
	}
	public int getMySize() {
		return mySize;
	}
	public void setMySize(int mySize) {
		this.mySize = mySize;
	}
	public String getMyContentType() {
		return myContentType;
	}
	public void setMyContentType(String myContentType) {
		this.myContentType = myContentType;
	}
	
}
