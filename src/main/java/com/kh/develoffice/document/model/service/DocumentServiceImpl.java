package com.kh.develoffice.document.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.document.model.dao.DocumentDao;

@Service("dService")
public class DocumentServiceImpl implements DocumentService {
	
	@Autowired
	private DocumentDao dDao;

}
