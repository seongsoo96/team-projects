package ppeonfun.dto;

import java.util.Date;

public class Requirement {
	private int rNo;
	private int pNo;
	private String rContext;
	private String rRewardPlan;
	private Date rCreateDate;
	private String rState;
	@Override
	public String toString() {
		return "Requirment [rNo=" + rNo + ", pNo=" + pNo + ", rContext=" + rContext + ", rRewardPlan=" + rRewardPlan
				+ ", rCreateDate=" + rCreateDate + ", rState=" + rState + "]";
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getrContext() {
		return rContext;
	}
	public void setrContext(String rContext) {
		this.rContext = rContext;
	}
	public String getrRewardPlan() {
		return rRewardPlan;
	}
	public void setrRewardPlan(String rRewardPlan) {
		this.rRewardPlan = rRewardPlan;
	}
	public Date getrCreateDate() {
		return rCreateDate;
	}
	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}
	public String getrState() {
		return rState;
	}
	public void setrState(String rState) {
		this.rState = rState;
	}
	
	
}
