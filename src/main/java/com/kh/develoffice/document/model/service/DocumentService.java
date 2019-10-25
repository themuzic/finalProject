package com.kh.develoffice.document.model.service;

import java.util.ArrayList;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.vo.Approval;
import com.kh.develoffice.document.model.vo.DocuA;
import com.kh.develoffice.document.model.vo.DocuB;
import com.kh.develoffice.document.model.vo.Document;
import com.kh.develoffice.document.model.vo.DocumentFile;
import com.kh.develoffice.document.model.vo.Reference;

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
	
	// 나와 관련된 전자결재 문서 호출
	ArrayList<Document> selectDocuList(int empId);
	
	// 내가 기안자인 전자결재 문서 호출
	ArrayList<Approval> selectMyApproval(int empId);
	
	// 내가 참조인인 전자결재 문서 호출
	ArrayList<Reference> selectMyReference(int empId);
	
	// 해당 결재 문서의 결재 라인 호출
	ArrayList<Approval> approvalCheck(int docuNum);
	
	// 해당 결재 문서의 참조 라인 호출
	ArrayList<Reference> referenceCheck(int docuNum);
	
	// 문서 정보 1개 불러오기
	Document selectDocument(int docuNum);
	
	// 지출결의서 내용 불러오기
	DocuA selectDocuA(int docuNum);
	
	// 그 외 문서 내용 불러오기
	DocuB selectDocuB(int docuNum);
	
	// 첨부파일 정보 불러오기
	DocumentFile selectDocuFile(int docuNum);
	
	// 결제 확인 상태 바꾸기
	int apCheck(Approval ap);
	
	// 참조 확인 상태 바꾸기
	int rfCheck(Reference rf);
	
	
	
	
}
