package com.kh.develoffice.project.model.vo;

import java.sql.Date;

public class ProjectReply {
	
	private int tRId;
	private int taskNo;
	private int tRwriter;
	private String tRContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	public ProjectReply() {
		
	}

	public ProjectReply(int tRId, int taskNo, int tRwriter, String tRContent, Date createDate, Date modifyDate,
			String status) {
		super();
		this.tRId = tRId;
		this.taskNo = taskNo;
		this.tRwriter = tRwriter;
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

	public String gettRContent() {
		return tRContent;
	}

	public void settRContent(String tRContent) {
		this.tRContent = tRContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
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
		return "ProjectReply [tRId=" + tRId + ", taskNo=" + taskNo + ", tRwriter=" + tRwriter + ", tRContent="
				+ tRContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	

}