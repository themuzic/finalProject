package com.kh.develoffice.todo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.common.Pagination;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.mail.model.vo.PageInfo;
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
	public ModelAndView todoBoardList(ModelAndView mv) {
		
		ArrayList<TodoBoard> list = tService.selectBoardList();
		
		mv.addObject("list", list).setViewName("todo/tdBoardListView");
		
		return mv;
	}
	
	
	/////////// Todo 리스트뷰로 이동 ///////////
	@RequestMapping("todoList.do")
	public ModelAndView selectTodoList(ModelAndView mv, HttpSession session/*, 
									   @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage*/) {

		// 게시글 총 갯수
		//int listCount = tService.getListCount();
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		//PageInfo pi = Pagination.getPageInfo(currentPage,  listCount);
		
		ArrayList<Todo> list = tService.selectTodoList(/* pi, */ e);
		
		System.out.println(e);
		System.out.println(list);
		
		mv./* addObject("pi", pi). */addObject("list", list).setViewName("todo/todoListView");
		
		return mv;
		
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
