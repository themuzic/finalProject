package com.kh.develoffice.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.develoffice.todo.model.service.TodoService;

@Controller
public class TodoController {
	
	@Autowired
	private TodoService tService;
	
	@RequestMapping("todoBoardList.do")
	public String todoBoardList() {
		return "todo/tdBoardListView";
	}
	
	@RequestMapping("todoDetail.do")
	public String todoDetail() {
		return "todo/todoListView";
	}
	
	@RequestMapping("insertTodoBoard.do")
	public String insertTodoBoard() {
		return "todo/insertTdBoard";
	}
	
	@RequestMapping("allTodo.do")
	public String allTodo() {
		return "todo/allTodo";
	}
	
	@RequestMapping("ongoingTodo.do")
	public String ongoingTodo() {
		return "todo/ongoingTodo";
	}
	
	@RequestMapping("completionTodo.do")
	public String completionTodo() {
		return "todo/completionTodo";
	}
	
	@RequestMapping("waitingTodo.do")
	public String waitingTodo() {
		return "todo/waitingTodo";
	}
}
