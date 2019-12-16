package kr.or.bit.dto.chart;

public class TotalSaleryChart {
	private String ename;
	private int totalSalery;

	public TotalSaleryChart(String ename, int totalSalery) {
		super();
		this.ename = ename;
		this.totalSalery = totalSalery;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public int getTotalSalery() {
		return totalSalery;
	}

	public void setTotalSalery(int totalSalery) {
		this.totalSalery = totalSalery;
	}
}
