package com.kh.develoffice.todo.model.vo;


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
public class Help {
	
	private int workId;
	private int empId;
	private String empName;
	private String workTitle;
	private String workContent;
	private String reason;
	private String registDate;
	private int helperId;
	private String status;
	

}
