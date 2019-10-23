package com.kh.develoffice.document.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.vo.DocuA;
import com.kh.develoffice.document.model.vo.DocuB;
import com.kh.develoffice.document.model.vo.Document;
import com.kh.develoffice.document.model.vo.DocumentFile;
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
	

}
