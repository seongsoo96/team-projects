package ppeonfun.dto;

import java.util.List;

public class SearchFilter {
	private String keyword;
	private List<String> step;
	private String category;
	private String s1min;
	private String s1max;
	private String s2min;
	private String s2max;

	@Override
	public String toString() {
		return "SearchFilter [keyword=" + keyword + ", step=" + step + ", category=" + category + ", s1min=" + s1min
				+ ", s1max=" + s1max + ", s2min=" + s2min + ", s2max=" + s2max + "]";
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public List<String> getStep() {
		return step;
	}

	public void setStep(List<String> step) {
		this.step = step;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getS1min() {
		return s1min;
	}

	public void setS1min(String s1min) {
		this.s1min = s1min;
	}

	public String getS1max() {
		return s1max;
	}

	public void setS1max(String s1max) {
		this.s1max = s1max;
	}

	public String getS2min() {
		return s2min;
	}

	public void setS2min(String s2min) {
		this.s2min = s2min;
	}

	public String getS2max() {
		return s2max;
	}

	public void setS2max(String s2max) {
		this.s2max = s2max;
	}
	
	
}
