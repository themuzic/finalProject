package com.kh.develoffice.document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.develoffice.document.model.service.DocumentService;

@Controller
public class DocumentController {
	
	@Autowired
	private DocumentService dService;
	
	@RequestMapping("insertDocumentForm.do")
	public String insertDocumentForm() {
		return "document/document";
	}
	
	@RequestMapping("documentTable.do")
	public String documentTableList() {
		return "document/dcTable";
	}
	
	
	@RequestMapping("documentDetailView.do")
	public String documentDetailView() {
		return "document/dcDetailA";
		/* return "common/test1"; */
	}
	
	

}
