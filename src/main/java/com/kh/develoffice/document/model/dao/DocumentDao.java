package com.kh.develoffice.document.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.vo.Approval;
import com.kh.develoffice.document.model.vo.DocuA;
import com.kh.develoffice.document.model.vo.DocuB;
import com.kh.develoffice.document.model.vo.Document;
import com.kh.develoffice.document.model.vo.DocumentFile;
import com.kh.develoffice.document.model.vo.Reference;
import com.kh.develoffice.employee.model.vo.Employee;

@Repository("dDao")
public class DocumentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Department> selectDept(){
		
		return (ArrayList)sqlSession.selectList("documentMapper.selectDept");
	}
	
	
	public int insertDocument(Document document) {
		return sqlSession.insert("documentMapper.insertDocument",document);
	}
	
	
	public int insertDocuA(DocuA docuA) {
		return sqlSession.insert("documentMapper.insertDocuA",docuA);
	}
	
	
	public int insertDocuB(DocuB docuB) {
		return sqlSession.insert("documentMapper.insertDocuB",docuB);
	}
	
	
	public int insertApproval(int empId) {
		return sqlSession.insert("documentMapper.insertApproval",empId);
	}
	
	
	public int insertReference(int empId) {
		return sqlSession.insert("documentMapper.insertReference",empId);
	}
	
	
	public int insertFile(DocumentFile dFile) {
		return sqlSession.insert("documentMapper.insertFile",dFile);
	}
	
	
	public ArrayList<Document> selectDocuList(int empId){
		return (ArrayList)sqlSession.selectList("documentMapper.selectDocuList",empId);
	}
	
	
	public ArrayList<Approval> selectMyApproval(int empId){
		return (ArrayList)sqlSession.selectList("documentMapper.selectMyApproval",empId);
	}

	
	public ArrayList<Reference> selectMyReference(int empId){
		return (ArrayList)sqlSession.selectList("documentMapper.selectMyReference",empId);
	}
	
	
	public ArrayList<Approval> approvalCheck(int docuNum) {
		return (ArrayList)sqlSession.selectList("documentMapper.approvalCheck",docuNum);
	}
	
	
	public ArrayList<Reference> referenceCheck(int docuNum){
		return (ArrayList)sqlSession.selectList("documentMapper.referenceCheck",docuNum);
	}
	
	
	public Document selectDocument(int docuNum) {
		return sqlSession.selectOne("documentMapper.selectDocument",docuNum);
	}
	
	
	public DocuA selectDocuA(int docuNum) {
		return sqlSession.selectOne("documentMapper.selectDocuA",docuNum);
	}
	
	
	public DocuB selectDocuB(int docuNum) {
		return sqlSession.selectOne("documentMapper.selectDocuB",docuNum);
	}
	
	
	public DocumentFile selectDocuFile(int docuNum) {
		return sqlSession.selectOne("documentMapper.selectDocuFile",docuNum);
	}
	
	
	public int apCheck(Approval ap) {
		return sqlSession.update("documentMapper.apCheck",ap);
	}
	
	
	public int rfCheck(Reference rf) {
		return sqlSession.update("documentMapper.rfCheck",rf);
	}
	
	
	
	
	
}
