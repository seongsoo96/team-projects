package ppeonfun.dto;

import java.util.Date;

public class NewsSort {
	private int nNo;
	private int pNo;
	private String nTitle;
	private String nContext;
	private String nCategory;
	private Date nOpenDate;
	private Date nCreateDate;
	
	private String categorySort;
	private String timeSort;
	
	@Override
	public String toString() {
		return "NewsSort [nNo=" + nNo + ", pNo=" + pNo + ", nTitle=" + nTitle + ", nContext=" + nContext
				+ ", nCategory=" + nCategory + ", nOpenDate=" + nOpenDate + ", nCreateDate=" + nCreateDate
				+ ", categorySort=" + categorySort + ", timeSort=" + timeSort + "]";
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContext() {
		return nContext;
	}

	public void setnContext(String nContext) {
		this.nContext = nContext;
	}

	public String getnCategory() {
		return nCategory;
	}

	public void setnCategory(String nCategory) {
		this.nCategory = nCategory;
	}

	public Date getnOpenDate() {
		return nOpenDate;
	}

	public void setnOpenDate(Date nOpenDate) {
		this.nOpenDate = nOpenDate;
	}

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public String getCategorySort() {
		return categorySort;
	}

	public void setCategorySort(String categorySort) {
		this.categorySort = categorySort;
	}

	public String getTimeSort() {
		return timeSort;
	}

	public void setTimeSort(String timeSort) {
		this.timeSort = timeSort;
	}
	
}
