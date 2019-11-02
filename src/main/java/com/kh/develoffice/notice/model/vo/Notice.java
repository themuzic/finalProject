package com.kh.develoffice.notice.model.vo;

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
public class Notice {

	private int noId;
	private String noTitle;
	private String noWriter;
	private int deptCode;
	private String empName;
	private String noContent;
	private String originalFileName;
	private String renameFileName;
	private int noCount;
	private String noCreateDate;
	private String noModifyDate;
	private String noStatus;
	
}
