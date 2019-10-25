package com.kh.develoffice.todo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.todo.model.service.TodoService;
import com.kh.develoffice.todo.model.vo.Todo;
import com.kh.develoffice.todo.model.vo.TodoBoard;


@Controller
public class TodoController {
	
	
	@Autowired
	private TodoService tService;
	
	
	
	
	/////////// TODO Board 생성 뷰로 이동 ///////////
	@RequestMapping("insertTodoBoardView.do")
	public String insertTodoBoardView() {
		return "todo/insertTdBoard";
	}
	
	
	///////////	TODO Board 생성 ///////////
	@RequestMapping("insertTodoBoard.do")
	public String insertTodoBoard(TodoBoard t, HttpServletRequest request, Model model) {
		
		//t.setEmpId(loginMember.getEmpId());
		
		int result = tService.insertTodoBoard(t);
		
		if(result > 0) {
			return "redirect:todoBoardList.do";
		}else {
			model.addAttribute("msg", "보드 생성에 실패하였습니다.");
			return "common/blankPage";
		}
	}
	
	
	/////////// TODO Board 리스트로 이동 ///////////
	@RequestMapping("todoBoardList.do")
	public ModelAndView todoBoardList(ModelAndView mv, HttpSession session, Model model) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		
		tb.setEmpId(e.getEmpId());
		
		//System.out.println(tb);
		
		ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		
//		session.setAttribute("todoBoardList", todoBoardList);
//		model.addAttribute("todoBoardList", todoBoardList);
		
		mv.addObject("todoBoardList", todoBoardList).setViewName("todo/tdBoardListView");
		
		//System.out.println(todoBoardList);
		
		return mv;
		
		//return "todo/tdBoardListView";
	}
	
	
	/////////// Todo 리스트뷰로 이동 ///////////
	@RequestMapping("todoList.do")
	public ModelAndView selectTodoList(ModelAndView mv, HttpSession session, Todo t) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		int tbNo = todoBoardList.get(0).getTdBoardNo();
		//System.out.println(tbNo);
		
		t.setEmpId(e.getEmpId());
		t.setTdBoardNo(tbNo);
		
		//System.out.println(t);
		
		ArrayList<Todo> todoList = tService.selectTodoList(t);
		
		//session.setAttribute("todoList", todoList);
		
		mv.addObject("todoList", todoList).setViewName("todo/todoListView");
		//System.out.println(todoList);
		
		return mv;
		
	}
	
	/////////// TODO 생성 뷰로 이동 ///////////
	@RequestMapping("insertTodoView.do")
	public String insertTodoView() {
		return "todo/insertTodo";
	}
	
	/////////// TODO 생성 ///////////
	@RequestMapping("insertTodo.do")
	public String insertTodo(Todo t, HttpServletRequest request, Model model) {
		
		int result = tService.insertTodo(t);
		
		if(result > 0) {
			return "redirect:todoList.do";
		} else {
			model.addAttribute("msg", "TO-DO 생성에 실패하였습니다.");
			return "common/blankPage";
		}
	}
	
	
	/////////// 체크된 todo 삭제 ///////////
	@RequestMapping("deleteTodo.do")
	public String delteTodo(Todo t) {
		
		int result = tService.deleteTodo(t);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
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
	
	
}
