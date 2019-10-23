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

@SessionAttributes("TodoBoardList")
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
	public ModelAndView todoBoardList(ModelAndView mv, HttpSession session) {
		
		ArrayList<TodoBoard> TodoBoardList = tService.selectBoardList();
		
		mv.addObject("TodoBoardList", TodoBoardList).setViewName("todo/tdBoardListView");
		
		session.setAttribute("TodoBoardList", TodoBoardList);
		
		return mv;
	}
	
	
	/////////// Todo 리스트뷰로 이동 ///////////
	@RequestMapping("todoList.do")
	public ModelAndView selectTodoList(ModelAndView mv, HttpSession session/*, 
									   @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage*/) {

		// 게시글 총 갯수
		//int listCount = tService.getListCount();
		
		Employee e = (Employee)session.getAttribute("loginUser");
		TodoBoard tb = (TodoBoard)session.getAttribute("TodoBoardList");
		
		Todo t = new Todo();
		
		t.setEmpId(e.getEmpId());
		t.setTdBoardNo(tb.getTdBoardNo());
		
		
		//PageInfo pi = Pagination.getPageInfo(currentPage,  listCount);
		
		ArrayList<Todo> TodoList = tService.selectTodoList(/* pi, */ t);
		
		System.out.println(t);
		System.out.println(TodoList);
		
		mv./* addObject("pi", pi). */addObject("TodoList", TodoList).setViewName("todo/todoListView");
		
		System.out.println(TodoList);
		
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
