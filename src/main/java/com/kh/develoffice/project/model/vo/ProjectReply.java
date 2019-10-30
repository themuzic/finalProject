package com.kh.develoffice.project.model.vo;

import java.sql.Date;

public class ProjectReply {
	
	private int pRId;
	private int pNo;
	private int pRwriter;
	private String pRContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	public ProjectReply() {
		
	}

	public ProjectReply(int pRId, int pNo, int pRwriter, String pRContent, Date createDate, Date modifyDate,
			String status) {
		super();
		this.pRId = pRId;
		this.pNo = pNo;
		this.pRwriter = pRwriter;
		this.pRContent = pRContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getpRId() {
		return pRId;
	}

	public void setpRId(int pRId) {
		this.pRId = pRId;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getpRwriter() {
		return pRwriter;
	}

	public void setpRwriter(int pRwriter) {
		this.pRwriter = pRwriter;
	}

	public String getpRContent() {
		return pRContent;
	}

	public void setpRContent(String pRContent) {
		this.pRContent = pRContent;
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
		return "ProjectReply [pRId=" + pRId + ", pNo=" + pNo + ", pRwriter=" + pRwriter + ", pRContent=" + pRContent
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	

}
