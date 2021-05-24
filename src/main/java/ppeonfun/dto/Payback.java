package ppeonfun.dto;

import java.util.Date;

public class Payback {
	private int paybNo;
	private int mNo;
	private int pNo;
	private int paybAmount;
	private int paybTaxFree;
	private int paybChecksum;
	private Date paybDate;
	private String paybReason;
	private String paybRefundHolder;
	private String paybRefundBank;
	private String paybRefundAccount;
	private String paybImpUid;
	private String paybMerchantUid;
	@Override
	public String toString() {
		return "Payback [paybNo=" + paybNo + ", mNo=" + mNo + ", pNo=" + pNo + ", paybAmount=" + paybAmount
				+ ", paybTaxFree=" + paybTaxFree + ", paybChecksum=" + paybChecksum + ", paybDate=" + paybDate
				+ ", paybReason=" + paybReason + ", paybRefundHolder=" + paybRefundHolder + ", paybRefundBank="
				+ paybRefundBank + ", paybRefundAccount=" + paybRefundAccount + ", paybImpUid=" + paybImpUid
				+ ", paybMerchantUid=" + paybMerchantUid + "]";
	}
	public int getPaybNo() {
		return paybNo;
	}
	public void setPaybNo(int paybNo) {
		this.paybNo = paybNo;
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
	public int getPaybAmount() {
		return paybAmount;
	}
	public void setPaybAmount(int paybAmount) {
		this.paybAmount = paybAmount;
	}
	public int getPaybTaxFree() {
		return paybTaxFree;
	}
	public void setPaybTaxFree(int paybTaxFree) {
		this.paybTaxFree = paybTaxFree;
	}
	public int getPaybChecksum() {
		return paybChecksum;
	}
	public void setPaybChecksum(int paybChecksum) {
		this.paybChecksum = paybChecksum;
	}
	public Date getPaybDate() {
		return paybDate;
	}
	public void setPaybDate(Date paybDate) {
		this.paybDate = paybDate;
	}
	public String getPaybReason() {
		return paybReason;
	}
	public void setPaybReason(String paybReason) {
		this.paybReason = paybReason;
	}
	public String getPaybRefundHolder() {
		return paybRefundHolder;
	}
	public void setPaybRefundHolder(String paybRefundHolder) {
		this.paybRefundHolder = paybRefundHolder;
	}
	public String getPaybRefundBank() {
		return paybRefundBank;
	}
	public void setPaybRefundBank(String paybRefundBank) {
		this.paybRefundBank = paybRefundBank;
	}
	public String getPaybRefundAccount() {
		return paybRefundAccount;
	}
	public void setPaybRefundAccount(String paybRefundAccount) {
		this.paybRefundAccount = paybRefundAccount;
	}
	public String getPaybImpUid() {
		return paybImpUid;
	}
	public void setPaybImpUid(String paybImpUid) {
		this.paybImpUid = paybImpUid;
	}
	public String getPaybMerchantUid() {
		return paybMerchantUid;
	}
	public void setPaybMerchantUid(String paybMerchantUid) {
		this.paybMerchantUid = paybMerchantUid;
	}
	
	
}
