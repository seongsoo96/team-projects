package ppeonfun.dto;

import java.util.Date;

public class Project {
	private int pNo;
	private int mNo;
	private String pName;
	private String pRequirements;
	private String pInformation;
	private String pStory;
	private String pReward;
	private String pMaker;
	private String pState;
	private String pProgressState;
	private int pCaution;
	private int pLike;
	private Date pCreateDate;
	@Override
	public String toString() {
		return "Project [pNo=" + pNo + ", mNo=" + mNo + ", pName=" + pName + ", pRequirements=" + pRequirements
				+ ", pInformation=" + pInformation + ", pStory=" + pStory + ", pReward=" + pReward + ", pMaker="
				+ pMaker + ", pState=" + pState + ", pProgressState=" + pProgressState + ", pCaution=" + pCaution
				+ ", pLike=" + pLike + ", pCreateDate=" + pCreateDate + "]";
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
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpRequirements() {
		return pRequirements;
	}
	public void setpRequirements(String pRequirements) {
		this.pRequirements = pRequirements;
	}
	public String getpInformation() {
		return pInformation;
	}
	public void setpInformation(String pInformation) {
		this.pInformation = pInformation;
	}
	public String getpStory() {
		return pStory;
	}
	public void setpStory(String pStory) {
		this.pStory = pStory;
	}
	public String getpReward() {
		return pReward;
	}
	public void setpReward(String pReward) {
		this.pReward = pReward;
	}
	public String getpMaker() {
		return pMaker;
	}
	public void setpMaker(String pMaker) {
		this.pMaker = pMaker;
	}
	public String getpState() {
		return pState;
	}
	public void setpState(String pState) {
		this.pState = pState;
	}
	public String getpProgressState() {
		return pProgressState;
	}
	public void setpProgressState(String pProgressState) {
		this.pProgressState = pProgressState;
	}
	public int getpCaution() {
		return pCaution;
	}
	public void setpCaution(int pCaution) {
		this.pCaution = pCaution;
	}
	public int getpLike() {
		return pLike;
	}
	public void setpLike(int pLike) {
		this.pLike = pLike;
	}
	public Date getpCreateDate() {
		return pCreateDate;
	}
	public void setpCreateDate(Date pCreateDate) {
		this.pCreateDate = pCreateDate;
	}
	
	
	
}
