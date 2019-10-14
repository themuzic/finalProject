package com.kh.develoffice.project.model.vo;

import java.sql.Date;

public class Project {
	
	private int pNo;
	private String pName;
	private String pContent;
	private int pmId;
	private Date pEnrollDate;
	private int pProgress;
	private String Status;
	
	public Project() {
		
	}

	public Project(int pNo, String pName, String pContent, int pmId, Date pEnrollDate, int pProgress, String status) {
		super();
		this.pNo = pNo;
		this.pName = pName;
		this.pContent = pContent;
		this.pmId = pmId;
		this.pEnrollDate = pEnrollDate;
		this.pProgress = pProgress;
		Status = status;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public int getPmId() {
		return pmId;
	}

	public void setPmId(int pmId) {
		this.pmId = pmId;
	}

	public Date getpEnrollDate() {
		return pEnrollDate;
	}

	public void setpEnrollDate(Date pEnrollDate) {
		this.pEnrollDate = pEnrollDate;
	}

	public int getpProgress() {
		return pProgress;
	}

	public void setpProgress(int pProgress) {
		this.pProgress = pProgress;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	@Override
	public String toString() {
		return "Project [pNo=" + pNo + ", pName=" + pName + ", pContent=" + pContent + ", pmId=" + pmId
				+ ", pEnrollDate=" + pEnrollDate + ", pProgress=" + pProgress + ", Status=" + Status + "]";
	}
	
	

}
