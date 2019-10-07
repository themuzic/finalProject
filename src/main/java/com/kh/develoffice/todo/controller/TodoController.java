package com.kh.develoffice.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.develoffice.todo.model.service.TodoService;

@Controller
public class TodoController {
	
	@Autowired
	private TodoService tService;
	
	@RequestMapping("toDoBoardList.do")
	public String toDoBoardList() {
		return "todo/todoBoard";
	}
}
