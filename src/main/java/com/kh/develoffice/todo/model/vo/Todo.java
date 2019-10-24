package com.kh.develoffice.todo.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Todo {
	
	private int todoNo;
	private int tdBoardNo;
	private int empId;
	private String todoName;
	private String todoContent;
	private Date todoEnrollDate;
	private String todoStatus;
	
}