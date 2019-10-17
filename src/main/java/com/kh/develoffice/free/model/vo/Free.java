package com.kh.develoffice.free.model.vo;

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
public class Free {
	
	private int frId;
	private String frTitle;
	private String frWriter;
	private String frContent;
	private String originalFileName;
	private String renameFileName;
	private int frCount;
	private Date frCreateDate;
	private Date frModifyDate;
	private String frStatus;
	private int frLikeCount;

}
