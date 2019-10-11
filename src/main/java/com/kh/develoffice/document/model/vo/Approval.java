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
public class Approval {
	
	private int docuNum;		// 문서번호
	private int empId;			// 결재선에 포함된 직원ID
	private String status;		// 결재상태
	
	
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
