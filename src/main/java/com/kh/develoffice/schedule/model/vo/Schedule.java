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
	private String shedule;
	private Date startDate;
	private Date endDate;
	private String allDay;
	private String backColor;
	private Date createDate;
	private Date modifyDate;
	private String scheType;

}
