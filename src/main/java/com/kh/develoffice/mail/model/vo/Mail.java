package com.kh.develoffice.mail.model.vo;

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
public class Mail {
	
	private int mailNum;
	private int empId;
	private String mailFrom;
	private String mailTo;
	private String fromEmp;
	private String toEmp;
	private String mailCc;
	private String mailTitle;
	private String mailContent;
	private String originalFileName;
	private String renameFileName;
	private Date mailDate;
	private String formatDate;
	private int mailType;
	private int mailImportant;
	private String status;
	
	private String writer;
	private String title;
	private String content;
	
	

}
