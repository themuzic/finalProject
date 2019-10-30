package com.kh.develoffice.project.model.vo;

import java.sql.Date;

public class ProjectTask {
	
	private int taskNo;
	private int pNo;
	private int taskWriter;
	private String taskTitle;
	private String taskContent;
	private int taskCount;
	private String status;
	private Date tCreateDate;
	private Date tModifyDate;
	private String tOriginalFileName;
	private String tRenameFileName;
	
	public ProjectTask() {
		
	}

	public ProjectTask(int taskNo, int pNo, int taskWriter, String taskTitle, String taskContent, int taskCount,
			String status, Date tCreateDate, Date tModifyDate, String tOriginalFileName, String tRenameFileName) {
		super();
		this.taskNo = taskNo;
		this.pNo = pNo;
		this.taskWriter = taskWriter;
		this.taskTitle = taskTitle;
		this.taskContent = taskContent;
		this.taskCount = taskCount;
		this.status = status;
		this.tCreateDate = tCreateDate;
		this.tModifyDate = tModifyDate;
		this.tOriginalFileName = tOriginalFileName;
		this.tRenameFileName = tRenameFileName;
	}

	public int getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(int taskNo) {
		this.taskNo = taskNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getTaskWriter() {
		return taskWriter;
	}

	public void setTaskWriter(int taskWriter) {
		this.taskWriter = taskWriter;
	}

	public String getTaskTitle() {
		return taskTitle;
	}

	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}

	public String getTaskContent() {
		return taskContent;
	}

	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}

	public int getTaskCount() {
		return taskCount;
	}

	public void setTaskCount(int taskCount) {
		this.taskCount = taskCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date gettCreateDate() {
		return tCreateDate;
	}

	public void settCreateDate(Date tCreateDate) {
		this.tCreateDate = tCreateDate;
	}

	public Date gettModifyDate() {
		return tModifyDate;
	}

	public void settModifyDate(Date tModifyDate) {
		this.tModifyDate = tModifyDate;
	}

	public String gettOriginalFileName() {
		return tOriginalFileName;
	}

	public void settOriginalFileName(String tOriginalFileName) {
		this.tOriginalFileName = tOriginalFileName;
	}

	public String gettRenameFileName() {
		return tRenameFileName;
	}

	public void settRenameFileName(String tRenameFileName) {
		this.tRenameFileName = tRenameFileName;
	}

	@Override
	public String toString() {
		return "ProjectTask [taskNo=" + taskNo + ", pNo=" + pNo + ", taskWriter=" + taskWriter + ", taskTitle="
				+ taskTitle + ", taskContent=" + taskContent + ", taskCount=" + taskCount + ", status=" + status
				+ ", tCreateDate=" + tCreateDate + ", tModifyDate=" + tModifyDate + ", tOriginalFileName="
				+ tOriginalFileName + ", tRenameFileName=" + tRenameFileName + "]";
	}
	
	
	

}
