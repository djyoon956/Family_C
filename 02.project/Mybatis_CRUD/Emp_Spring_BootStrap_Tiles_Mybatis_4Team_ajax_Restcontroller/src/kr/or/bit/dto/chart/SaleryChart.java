package kr.or.bit.dto.chart;

public class SaleryChart {
	private String category;
	private int avg;
	private int max;
	private int min;

	public SaleryChart(String category, int avg, int max, int min) {
		super();
		this.category = category;
		this.avg = avg;
		this.max = max;
		this.min = min;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}
}
