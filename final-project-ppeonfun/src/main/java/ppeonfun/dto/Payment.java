package ppeonfun.dto;

import java.util.Date;

public class Payment {
	private int paymNo;
	private int mNo;
	private int pNo;
	private int reNo;
	private String paymName;
	private Date paymDate;
	private int paymAmount;
	private String paymApplyNum;
	private String paymImpUid;
	private String paymMerchantUid;
	private String paymState;
	private int suGroup;
	
	
	@Override
	public String toString() {
		return "Payment [paymNo=" + paymNo + ", mNo=" + mNo + ", pNo=" + pNo + ", reNo=" + reNo + ", paymName="
				+ paymName + ", paymDate=" + paymDate + ", paymAmount=" + paymAmount + ", paymApplyNum=" + paymApplyNum
				+ ", paymImpUid=" + paymImpUid + ", paymMerchantUid=" + paymMerchantUid + ", paymState=" + paymState
				+ ", suGroup=" + suGroup + "]";
	}
	public int getPaymNo() {
		return paymNo;
	}
	public void setPaymNo(int paymNo) {
		this.paymNo = paymNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public String getPaymName() {
		return paymName;
	}
	public void setPaymName(String paymName) {
		this.paymName = paymName;
	}
	public Date getPaymDate() {
		return paymDate;
	}
	public void setPaymDate(Date paymDate) {
		this.paymDate = paymDate;
	}
	public int getPaymAmount() {
		return paymAmount;
	}
	public void setPaymAmount(int paymAmount) {
		this.paymAmount = paymAmount;
	}
	public String getPaymApplyNum() {
		return paymApplyNum;
	}
	public void setPaymApplyNum(String paymApplyNum) {
		this.paymApplyNum = paymApplyNum;
	}
	public String getPaymImpUid() {
		return paymImpUid;
	}
	public void setPaymImpUid(String paymImpUid) {
		this.paymImpUid = paymImpUid;
	}
	public String getPaymMerchantUid() {
		return paymMerchantUid;
	}
	public void setPaymMerchantUid(String paymMerchantUid) {
		this.paymMerchantUid = paymMerchantUid;
	}
	public String getPaymState() {
		return paymState;
	}
	public void setPaymState(String paymState) {
		this.paymState = paymState;
	}
	public int getSuGroup() {
		return suGroup;
	}
	public void setSuGroup(int suGroup) {
		this.suGroup = suGroup;
	}
	
	
	
	
}
