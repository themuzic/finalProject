package com.kh.develoffice.free.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class FreeReply {
	
	private int frrId;
	private int reffrId;
	private int frrWriter;
	private String empName;
	private String frrContent;
	private String frrCreateDate;
	private String frrModifyDate;
	private String frrStatus;
	
	
	
}
