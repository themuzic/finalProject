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
public class Reference {
	
	private int docuNum;		// 문서번호
	private int empId;			// 참조인에 포함된 직원ID
	private String status;		// 확인상태
	private Date checkDate;		// 확인한날짜
	
	
	public Reference(int docuNum, int empId) {
		super();
		this.docuNum = docuNum;
		this.empId = empId;
	}


	public Reference(int empId) {
		super();
		this.empId = empId;
	}
	
	

}
