package com.kh.develoffice.document.model.vo;

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
public class Approval {
	
	private int apPk;
	private int docuNum;		// 문서번호
	private int empId;			// 결재선에 포함된 직원ID
	private String empName;		// 결재선에 포함된 직원 이름
	private String jobName;
	private String status;		// 결재상태
	private String approvalDate;		// 결재한날짜
	
	
	public Approval(int docuNum, int empId) {
		super();
		this.docuNum = docuNum;
		this.empId = empId;
	}


	public Approval(int empId) {
		super();
		this.empId = empId;
	}
	
	
	

}
