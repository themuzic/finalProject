package com.kh.develoffice.document.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.dao.DocumentDao;
import com.kh.develoffice.document.model.vo.DocuA;
import com.kh.develoffice.document.model.vo.DocuB;
import com.kh.develoffice.document.model.vo.Document;
import com.kh.develoffice.document.model.vo.DocumentFile;
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

	

}
