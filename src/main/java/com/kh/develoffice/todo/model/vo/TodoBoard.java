package com.kh.develoffice.todo.model.vo;

import java.sql.Date;

public class TodoBoard {
	
	private int tdBoardNo;
	private String tdBoardName;
	private int empId;
	private String tdBoardContent;
	private String tdBoardColor;
	private Date tdBoardEnrollDate;
	private Date tdBoardModifyDate;
	private String tdBoardStatus;
	
	public TodoBoard() {
		
	}

	public TodoBoard(int tdBoardNo, String tdBoardName, int empId, String tdBoardContent, String tdBoardColor,
			Date tdBoardEnrollDate, Date tdBoardModifyDate, String tdBoardStatus) {
		super();
		this.tdBoardNo = tdBoardNo;
		this.tdBoardName = tdBoardName;
		this.empId = empId;
		this.tdBoardContent = tdBoardContent;
		this.tdBoardColor = tdBoardColor;
		this.tdBoardEnrollDate = tdBoardEnrollDate;
		this.tdBoardModifyDate = tdBoardModifyDate;
		this.tdBoardStatus = tdBoardStatus;
	}

	public int getTdBoardNo() {
		return tdBoardNo;
	}

	public void setTdBoardNo(int tdBoardNo) {
		this.tdBoardNo = tdBoardNo;
	}

	public String getTdBoardName() {
		return tdBoardName;
	}

	public void setTdBoardName(String tdBoardName) {
		this.tdBoardName = tdBoardName;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getTdBoardContent() {
		return tdBoardContent;
	}

	public void setTdBoardContent(String tdBoardContent) {
		this.tdBoardContent = tdBoardContent;
	}

	public String getTdBoardColor() {
		return tdBoardColor;
	}

	public void setTdBoardColor(String tdBoardColor) {
		this.tdBoardColor = tdBoardColor;
	}

	public Date getTdBoardEnrollDate() {
		return tdBoardEnrollDate;
	}

	public void setTdBoardEnrollDate(Date tdBoardEnrollDate) {
		this.tdBoardEnrollDate = tdBoardEnrollDate;
	}

	public Date getTdBoardModifyDate() {
		return tdBoardModifyDate;
	}

	public void setTdBoardModifyDate(Date tdBoardModifyDate) {
		this.tdBoardModifyDate = tdBoardModifyDate;
	}

	public String getTdBoardStatus() {
		return tdBoardStatus;
	}

	public void setTdBoardStatus(String tdBoardStatus) {
		this.tdBoardStatus = tdBoardStatus;
	}

	@Override
	public String toString() {
		return "TodoBoard [tdBoardNo=" + tdBoardNo + ", tdBoardName=" + tdBoardName + ", empId=" + empId
				+ ", tdBoardContent=" + tdBoardContent + ", tdBoardColor=" + tdBoardColor + ", tdBoardEnrollDate="
				+ tdBoardEnrollDate + ", tdBoardModifyDate=" + tdBoardModifyDate + ", tdBoardStatus=" + tdBoardStatus
				+ "]";
	}
	
	
	
}

	