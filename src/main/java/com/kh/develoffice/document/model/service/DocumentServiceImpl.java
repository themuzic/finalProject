package com.kh.develoffice.document.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.dao.DocumentDao;
import com.kh.develoffice.document.model.vo.Approval;
import com.kh.develoffice.document.model.vo.DocuA;
import com.kh.develoffice.document.model.vo.DocuB;
import com.kh.develoffice.document.model.vo.Document;
import com.kh.develoffice.document.model.vo.DocumentFile;
import com.kh.develoffice.document.model.vo.Reference;
import com.kh.develoffice.employee.model.vo.Employee;

@Service("dService")
public class DocumentServiceImpl implements DocumentService {
	
	@Autowired
	private DocumentDao dDao;

	@Override
	public ArrayList<Department> selectDept() {
		return dDao.selectDept();
	}

	@Override
	public int insertDocument(Document document) {
		return dDao.insertDocument(document);
	}

	@Override
	public int insertDocuA(DocuA docuA) {
		return dDao.insertDocuA(docuA);
	}

	@Override
	public int insertDocuB(DocuB docuB) {
		return dDao.insertDocuB(docuB);
	}

	@Override
	public int insertApproval(int empId) {
		return dDao.insertApproval(empId);
	}

	@Override
	public int insertReference(int empId) {
		return dDao.insertReference(empId);
	}

	@Override
	public int insertFile(DocumentFile dFile) {
		return dDao.insertFile(dFile);
	}

	@Override
	public ArrayList<Document> selectDocuList(int empId) {
		return dDao.selectDocuList(empId);
	}

	@Override
	public ArrayList<Approval> selectMyApproval(int empId) {
		return dDao.selectMyApproval(empId);
	}

	@Override
	public ArrayList<Reference> selectMyReference(int empId) {
		return dDao.selectMyReference(empId);
	}

	@Override
	public ArrayList<Approval> approvalCheck(int docuNum) {
		return dDao.approvalCheck(docuNum);
	}

	@Override
	public ArrayList<Reference> referenceCheck(int docuNum) {
		return dDao.referenceCheck(docuNum);
	}

	@Override
	public Document selectDocument(int docuNum) {
		return dDao.selectDocument(docuNum);
	}

	@Override
	public DocuA selectDocuA(int docuNum) {
		return dDao.selectDocuA(docuNum);
	}

	@Override
	public DocuB selectDocuB(int docuNum) {
		return dDao.selectDocuB(docuNum);
	}

	@Override
	public DocumentFile selectDocuFile(int docuNum) {
		return dDao.selectDocuFile(docuNum);
	}

	@Override
	public int apCheck(Approval ap) {
		return dDao.apCheck(ap);
	}

	@Override
	public int rfCheck(Reference rf) {
		return dDao.rfCheck(rf);
	}

	

}
