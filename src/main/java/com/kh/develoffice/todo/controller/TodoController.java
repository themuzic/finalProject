package com.kh.develoffice.todo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.develoffice.todo.model.service.TodoService;
import com.kh.develoffice.todo.model.vo.TodoBoard;

@Controller
public class TodoController {
	
	
	@Autowired
	private TodoService tService;
	
	
	/////////// TODO Board 리스트로 이동 ///////////
	@RequestMapping("todoBoardList.do")
	public String todoBoardList() {
		return "todo/tdBoardListView";
	}
	
	///////////	TODO Board 생성 ///////////
	@RequestMapping("insertTodoBoard.do")
	public String insertTodoBoard(TodoBoard t, HttpServletRequest request, Model model) {
		
		int result = tService.insertTodoBoard(t);
		
		if(result > 0) {
			return "redirect.todoBoardList.do";
		} else {
			
		}
		
		
		return "todo/insertTdBoard";
	}
	
	///////////
	@RequestMapping("todoList.do")
	public String todoList() {
		return "todo/todoListView";
	}
	
	///////////
	@RequestMapping("allTodo.do")
	public String allTodo() {
		return "todo/allTodo";
	}
	
	///////////
	@RequestMapping("ongoingTodo.do")
	public String ongoingTodo() {
		return "todo/ongoingTodo";
	}
	
	///////////
	@RequestMapping("completionTodo.do")
	public String completionTodo() {
		return "todo/completionTodo";
	}
	
	///////////
	@RequestMapping("waitingTodo.do")
	public String waitingTodo() {
		return "todo/waitingTodo";
	}
	
	///////////
	@RequestMapping("todoDetail.do")
	public String todoDetail() {
		return "todo/todoDetailView";
	}
	
	///////////
	@RequestMapping("insertTodo.do")
	public String insertTodo() {
		return "todo/insertTodo";
	}
}
