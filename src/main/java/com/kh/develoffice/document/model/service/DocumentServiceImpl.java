package com.kh.develoffice.document.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.dao.DocumentDao;
import com.kh.develoffice.employee.model.vo.Employee;

@Service("dService")
public class DocumentServiceImpl implements DocumentService {
	
	@Autowired
	private DocumentDao dDao;

	@Override
	public ArrayList<Department> selectDept() {
		return dDao.selectDept();
	}

	

}
