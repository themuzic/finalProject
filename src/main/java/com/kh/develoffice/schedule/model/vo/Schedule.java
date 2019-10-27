package com.kh.develoffice.schedule.model.vo;

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
public class Schedule {
	
	private int sNo;
	private int empId;
	private String sTitle;
	private String sContent;
	private int sType;
	private Date startDate;
	private Date endDate;
	private Date allDay;
	private String fontColor;
	private String backColor;
	private String sUrl;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	
	
	
	
	

}
