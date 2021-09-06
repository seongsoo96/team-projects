package ppeonfun.dto;

import java.util.Date;

public class CommunityJoin {
	private int comNo;
	private int pNo;
	private int mNo;
	private String comContent;
	private Date comDate;
	
	//member
//	private String mId;
	private String cid;
	private String caid;
	
	//community_answer
	private String caContent;
	private Date caDate;
	
	@Override
	public String toString() {
		return "CommunityJoin [comNo=" + comNo + ", pNo=" + pNo + ", mNo=" + mNo + ", comContent=" + comContent
				+ ", comDate=" + comDate + ", cid=" + cid + ", caid=" + caid + ", caContent=" + caContent + ", caDate="
				+ caDate + "]";
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
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

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public Date getComDate() {
		return comDate;
	}

	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCaid() {
		return caid;
	}

	public void setCaid(String caid) {
		this.caid = caid;
	}

	public String getCaContent() {
		return caContent;
	}

	public void setCaContent(String caContent) {
		this.caContent = caContent;
	}

	public Date getCaDate() {
		return caDate;
	}

	public void setCaDate(Date caDate) {
		this.caDate = caDate;
	}
	
}
