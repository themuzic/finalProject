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
public class Document {
	
	private int docuNum;		// 문서번호
	private String docuType;	// 문서종류
	private int docuCode;		// 문서번호
	private int empId;			// 작성한직원ID
	private int saveTerm;		// 보존연한
	private int security;		// 보안등급
	private Date docuDate;		// 작성날짜
	private String status;		// 활성화 상태
	
	
	public Document(int docuNum, String docuType, int docuCode, int empId, int saveTerm, int security, Date docuDate) {
		super();
		this.docuNum = docuNum;
		this.docuType = docuType;
		this.docuCode = docuCode;
		this.empId = empId;
		this.saveTerm = saveTerm;
		this.security = security;
		this.docuDate = docuDate;
	}


	public Document(String docuType, int docuCode, int empId, int saveTerm, int security, Date docuDate) {
		super();
		this.docuType = docuType;
		this.docuCode = docuCode;
		this.empId = empId;
		this.saveTerm = saveTerm;
		this.security = security;
		this.docuDate = docuDate;
	}
	
	
	
	
	
}
