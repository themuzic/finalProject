package com.kh.develoffice.teamboard.model.vo;

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
public class TeamBoard {

	private int tbId;
	private String tbTitle;
	private String tbWriter;
	private int deptCode;
	private String empName;
	private String tbContent;
	private String originalFileName;
	private String renameFileName;
	private int tbCount;
	private String tbCreateDate;
	private String tbModifyDate;
	private String tbStatus;
}
