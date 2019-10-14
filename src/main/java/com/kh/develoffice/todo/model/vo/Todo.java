package com.kh.develoffice.todo.model.vo;

import java.sql.Date;

public class Todo {
	
	private int todoNo;
	private int tdBoardNo;
	private int empId;
	private String todoName;
	private String todoContent;
	private Date todoEnrollDate;
	private String todoStatus;
	
	public Todo() {
		
	}

	public Todo(int todoNo, int tdBoardNo, int empId, String todoName, String todoContent, Date todoEnrollDate,
			String todoStatus) {
		super();
		this.todoNo = todoNo;
		this.tdBoardNo = tdBoardNo;
		this.empId = empId;
		this.todoName = todoName;
		this.todoContent = todoContent;
		this.todoEnrollDate = todoEnrollDate;
		this.todoStatus = todoStatus;
	}

	public int getTodoNo() {
		return todoNo;
	}

	public void setTodoNo(int todoNo) {
		this.todoNo = todoNo;
	}

	public int getTdBoardNo() {
		return tdBoardNo;
	}

	public void setTdBoardNo(int tdBoardNo) {
		this.tdBoardNo = tdBoardNo;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getTodoName() {
		return todoName;
	}

	public void setTodoName(String todoName) {
		this.todoName = todoName;
	}

	public String getTodoContent() {
		return todoContent;
	}

	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}

	public Date getTodoEnrollDate() {
		return todoEnrollDate;
	}

	public void setTodoEnrollDate(Date todoEnrollDate) {
		this.todoEnrollDate = todoEnrollDate;
	}

	public String getTodoStatus() {
		return todoStatus;
	}

	public void setTodoStatus(String todoStatus) {
		this.todoStatus = todoStatus;
	}

	@Override
	public String toString() {
		return "Todo [todoNo=" + todoNo + ", tdBoardNo=" + tdBoardNo + ", empId=" + empId + ", todoName=" + todoName
				+ ", todoContent=" + todoContent + ", todoEnrollDate=" + todoEnrollDate + ", todoStatus=" + todoStatus
				+ "]";
	}
	
	

}
