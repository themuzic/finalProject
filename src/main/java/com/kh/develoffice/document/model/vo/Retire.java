package com.kh.develoffice.document.model.vo;

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
public class Retire {
	
	private int docuNum;
	private String enrollDate;
	private String retireDate;
	private String reason;
	private String empName;
	private String jobName;
	private String deptName;
	
	
	

}
