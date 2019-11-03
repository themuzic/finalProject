package com.kh.develoffice.project.model.vo;

import java.sql.Date;

public class ProjectReply {
	
	private int tRId;
	private int taskNo;
	private int tRwriter;
	private String empName;
	private String tRContent;
	private String createDate;
	private String modifyDate;
	private String status;
	
	public ProjectReply() {
		
	}

	public ProjectReply(int tRId, int taskNo, int tRwriter, String empName, String tRContent, String createDate,
			String modifyDate, String status) {
		super();
		this.tRId = tRId;
		this.taskNo = taskNo;
		this.tRwriter = tRwriter;
		this.empName = empName;
		this.tRContent = tRContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int gettRId() {
		return tRId;
	}

	public void settRId(int tRId) {
		this.tRId = tRId;
	}

	public int getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(int taskNo) {
		this.taskNo = taskNo;
	}

	public int gettRwriter() {
		return tRwriter;
	}

	public void settRwriter(int tRwriter) {
		this.tRwriter = tRwriter;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String gettRContent() {
		return tRContent;
	}

	public void settRContent(String tRContent) {
		this.tRContent = tRContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ProjectReply [tRId=" + tRId + ", taskNo=" + taskNo + ", tRwriter=" + tRwriter + ", empName=" + empName
				+ ", tRContent=" + tRContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status="
				+ status + "]";
	}

	
	
}