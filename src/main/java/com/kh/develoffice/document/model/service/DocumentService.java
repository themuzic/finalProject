package com.kh.develoffice.document.model.service;

import java.util.ArrayList;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.vo.DocuA;
import com.kh.develoffice.document.model.vo.DocuB;
import com.kh.develoffice.document.model.vo.Document;
import com.kh.develoffice.document.model.vo.DocumentFile;

public interface DocumentService {
	
	// 부서테이블 호출
	ArrayList<Department> selectDept();
	
	// 통합문서 테이블 insert
	int insertDocument(Document document);
	
	// 지출 결의서 insert
	int insertDocuA(DocuA docuA);
	
	// 회람,품의서 insert
	int insertDocuB(DocuB docuB);
	
	// 결제라인 insert
	int insertApproval(int empId);
	
	// 참조라인 insert
	int insertReference(int empId);
	
	// 첨부파일 insert
	int insertFile(DocumentFile dFile);
	
}
