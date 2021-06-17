package ppeonfun.dto;

public class Rank implements Comparable<Rank> {
	private int pNo;
	private double rate;
	private double score;
	private String iTitle;
	
	@Override
	public String toString() {
		return "Rank [pNo=" + pNo + ", rate=" + rate + ", score=" + score + ", iTitle=" + iTitle + "]";
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
