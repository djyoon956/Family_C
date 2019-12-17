package kr.or.bit.dto.chart;

public class DataByYear {
	private String hiredate;
	private int avgsal;
	private int minsal;
	private int maxsal;
	
	public DataByYear() {}
	public DataByYear(String hiredate, int avgsal, int minsal, int maxsal) {
		super();
		this.hiredate = hiredate;
		this.avgsal = avgsal;
		this.minsal = minsal;
		this.maxsal = maxsal;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public int getAvgsal() {
		return avgsal;
	}
	public void setAvgsal(int avgsal) {
		this.avgsal = avgsal;
	}
	public int getMinsal() {
		return minsal;
	}
	public void setMinsal(int minsal) {
		this.minsal = minsal;
	}
	public int getMaxsal() {
		return maxsal;
	}
	public void setMaxsal(int maxsal) {
		this.maxsal = maxsal;
	}
	
}
