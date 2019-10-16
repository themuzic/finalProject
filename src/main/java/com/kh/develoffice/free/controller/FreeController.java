package com.kh.develoffice.free.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.develoffice.free.model.service.FreeService;

@Controller
public class FreeController {

	@Autowired
	private FreeService fService;
	
	@RequestMapping("listFree.do")
	public String  freeList() {
		return "free/freeListView";
	}
	
	@RequestMapping("insertFree.do")
	public String insertFree() {
		return "free/insertFree";
	}
	
	@RequestMapping("freeDetail.do")
	public String freeDetail() {
		return "free/freeDetailView";
	}
	
	@RequestMapping("freeUpdate.do")
	public String freeUpdate() {
		return "free/freeUpdate";
	}
	
}
