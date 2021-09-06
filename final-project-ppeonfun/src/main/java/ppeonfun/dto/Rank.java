package ppeonfun.dto;

public class Rank implements Comparable<Rank> {
	private int pNo;
	private double rate;
	private double score;
	private String iTitle;
	private String iStroedName;
	
	
	
	@Override
	public String toString() {
		return "Rank [pNo=" + pNo + ", rate=" + rate + ", score=" + score + ", iTitle=" + iTitle + ", iStroedName="
				+ iStroedName + "]";
	}
	


	public int getpNo() {
		return pNo;
	}



	public void setpNo(int pNo) {
		this.pNo = pNo;
	}



	public double getRate() {
		return rate;
	}



	public void setRate(double rate) {
		this.rate = rate;
	}



	public double getScore() {
		return score;
	}



	public void setScore(double score) {
		this.score = score;
	}



	public String getiTitle() {
		return iTitle;
	}



	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}



	public String getiStroedName() {
		return iStroedName;
	}



	public void setiStroedName(String iStroedName) {
		this.iStroedName = iStroedName;
	}



	@Override
	public int compareTo(Rank o) {
		if(this.score < o.score) {
			return 1;
		} else if(this.score == o.score) {
			return 0;
		} else {
			return -1;
		}
	}
}
