package ppeonfun.dto;

import java.util.Date;

public class Payback {
	private int paybNo;
	private int paymNo;
	private int paybAmount;
	private int paybTaxFree;
	private int paybChecksum;
	private Date paybDate;
	private String paybReason;
	private String paybRefundHolder;
	private String paybRefundBank;
	private String paybRefundAccount;
	
	@Override
	public String toString() {
		return "Payback [paybNo=" + paybNo + ", paymNo=" + paymNo + ", paybAmount=" + paybAmount + ", paybTaxFree="
				+ paybTaxFree + ", paybChecksum=" + paybChecksum + ", paybDate=" + paybDate + ", paybReason="
				+ paybReason + ", paybRefundHolder=" + paybRefundHolder + ", paybRefundBank=" + paybRefundBank
				+ ", paybRefundAccount=" + paybRefundAccount + "]";
	}
	public int getPaybNo() {
		return paybNo;
	}
	public void setPaybNo(int paybNo) {
		this.paybNo = paybNo;
	}
	public int getPaymNo() {
		return paymNo;
	}
	public void setPaymNo(int paymNo) {
		this.paymNo = paymNo;
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
	
	
	
}
