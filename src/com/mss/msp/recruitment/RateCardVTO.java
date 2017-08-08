package com.mss.msp.recruitment;

public class RateCardVTO {
	
	private int rateCardId;
	private String jobTitle;
	private String minRate;
	private String maxRate;
	private String comments;
	private String createdDate;
	public int getRateCardId() {
		return rateCardId;
	}
	public void setRateCardId(int rateCardId) {
		this.rateCardId = rateCardId;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getMinRate() {
		return minRate;
	}
	public void setMinRate(String minRate) {
		this.minRate = minRate;
	}
	public String getMaxRate() {
		return maxRate;
	}
	public void setMaxRate(String maxRate) {
		this.maxRate = maxRate;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	
	

}
