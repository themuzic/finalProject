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
public class TodoBoard {
	
	private int tdBoardNo;
	private String tdBoardName;
	private int empId;
	private String tdBoardContent;
	private String tdBoardColor;
	private Date tdBoardEnrollDate;
	private Date tdBoardModifyDate;
	private String tdBoardStatus;
	
	
	
}

	