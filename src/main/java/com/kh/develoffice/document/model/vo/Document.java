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
	private String empName;		// 작성환직원이름
	private String deptName;	// 부서이름
	private String title;		// 문서제목
	private int saveTerm;		// 보존연한
	private String security;	// 보안등급
	private String docuDate;		// 작성날짜
	private String modifyDate;	// 수정된날짜
	private String status;		// 활성화 상태
	private String fileStatus;	//파일유무
	private String dv;			//구분
	
	
	
	
}
