package ppeonfun.dto;

import java.util.Date;

public class Reward {
	private int reNo;
	private int pNo;
	private int reMoney;
	private String reTitle;
	private String reContext;
	private String reOption;
	private String reOptionContext;
	private String reDelivery;
	private int reDeliveryMoney;
	private int reLimitQuantity;
	private Date reCreateDate;
	private String reState;
	@Override
	public String toString() {
		return "Reward [reNo=" + reNo + ", pNo=" + pNo + ", reMoney=" + reMoney + ", reTitle=" + reTitle
				+ ", reContext=" + reContext + ", reOption=" + reOption + ", reOptionContext=" + reOptionContext
				+ ", reDelivery=" + reDelivery + ", reDeliveryMoney=" + reDeliveryMoney + ", reLimitQuantity="
				+ reLimitQuantity + ", reCreateDate=" + reCreateDate + ", reState=" + reState + "]";
	}
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getReMoney() {
		return reMoney;
	}
	public void setReMoney(int reMoney) {
		this.reMoney = reMoney;
	}
	public String getReTitle() {
		return reTitle;
	}
	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
	}
	public String getReContext() {
		return reContext;
	}
	public void setReContext(String reContext) {
		this.reContext = reContext;
	}
	public String getReOption() {
		return reOption;
	}
	public void setReOption(String reOption) {
		this.reOption = reOption;
	}
	public String getReOptionContext() {
		return reOptionContext;
	}
	public void setReOptionContext(String reOptionContext) {
		this.reOptionContext = reOptionContext;
	}
	public String getReDelivery() {
		return reDelivery;
	}
	public void setReDelivery(String reDelivery) {
		this.reDelivery = reDelivery;
	}
	public int getReDeliveryMoney() {
		return reDeliveryMoney;
	}
	public void setReDeliveryMoney(int reDeliveryMoney) {
		this.reDeliveryMoney = reDeliveryMoney;
	}
	public int getReLimitQuantity() {
		return reLimitQuantity;
	}
	public void setReLimitQuantity(int reLimitQuantity) {
		this.reLimitQuantity = reLimitQuantity;
	}
	public Date getReCreateDate() {
		return reCreateDate;
	}
	public void setReCreateDate(Date reCreateDate) {
		this.reCreateDate = reCreateDate;
	}
	public String getReState() {
		return reState;
	}
	public void setReState(String reState) {
		this.reState = reState;
	}
	
	
	
}
