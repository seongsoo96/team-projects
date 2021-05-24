package ppeonfun.dto;

import java.util.Date;

public class Maker {
	private int maNo;
	private int pNo;
	private String maTitle;
	private String maOriginName;
	private String maStoredName;
	private String maEmail;
	private String maPhone;
	private Date maCreateDate;
	private String maState;
	private int maSize;
	private String maContentType;
	
	
	
	@Override
	public String toString() {
		return "Maker [maNo=" + maNo + ", pNo=" + pNo + ", maTitle=" + maTitle + ", maOriginName=" + maOriginName
				+ ", maStoredName=" + maStoredName + ", maEmail=" + maEmail + ", maPhone=" + maPhone + ", maCreateDate="
				+ maCreateDate + ", maState=" + maState + ", maSize=" + maSize + ", maContentType=" + maContentType
				+ "]";
	}
	public int getMaNo() {
		return maNo;
	}
	public void setMaNo(int maNo) {
		this.maNo = maNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getMaTitle() {
		return maTitle;
	}
	public void setMaTitle(String maTitle) {
		this.maTitle = maTitle;
	}
	public String getMaOriginName() {
		return maOriginName;
	}
	public void setMaOriginName(String maOriginName) {
		this.maOriginName = maOriginName;
	}
	public String getMaStoredName() {
		return maStoredName;
	}
	public void setMaStoredName(String maStoredName) {
		this.maStoredName = maStoredName;
	}
	public String getMaEmail() {
		return maEmail;
	}
	public void setMaEmail(String maEmail) {
		this.maEmail = maEmail;
	}
	public String getMaPhone() {
		return maPhone;
	}
	public void setMaPhone(String maPhone) {
		this.maPhone = maPhone;
	}
	public Date getMaCreateDate() {
		return maCreateDate;
	}
	public void setMaCreateDate(Date maCreateDate) {
		this.maCreateDate = maCreateDate;
	}
	public String getMaState() {
		return maState;
	}
	public void setMaState(String maState) {
		this.maState = maState;
	}
	public int getMaSize() {
		return maSize;
	}
	public void setMaSize(int maSize) {
		this.maSize = maSize;
	}
	public String getMaContentType() {
		return maContentType;
	}
	public void setMaContentType(String maContentType) {
		this.maContentType = maContentType;
	}
	
	
}
