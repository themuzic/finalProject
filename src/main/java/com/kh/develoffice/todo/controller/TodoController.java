package com.kh.develoffice.todo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.todo.model.service.TodoService;
import com.kh.develoffice.todo.model.vo.Help;
import com.kh.develoffice.todo.model.vo.Todo;
import com.kh.develoffice.todo.model.vo.TodoBoard;


@Controller
public class TodoController {
	
	
	@Autowired
	private TodoService tService;
	@Autowired
	private EmployeeService eService;
	
	
	
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
		//int tbNo = todoBoardList.get(0).getTdBoardNo();
		//System.out.println(tbNo);
		
		//mv.addObject("tbNo", tbNo)
		mv.addObject("todoBoardList", todoBoardList).setViewName("todo/tdBoardListView");
		
		//System.out.println(todoBoardList);
		
		return mv;
	}
	
	
	/////////// Todo 리스트뷰로 이동 ///////////
	@RequestMapping("todoList.do")
	public ModelAndView selectTodoList(ModelAndView mv, HttpSession session, Todo t) {
		System.out.println("t : "+t);
		Employee e = (Employee)session.getAttribute("loginUser");
		t.setEmpId(e.getEmpId());
		
		// 전체리스트 (15개)
		ArrayList<Todo> todoAList = tService.selectTodoAList(t);
		// 진행중 리스트 (5개)
		ArrayList<Todo> todoOList = tService.selectTodoOList(t);
		// 대기 리스트 (5개)
		ArrayList<Todo> todoWList = tService.selectTodoWList(t);
		// 완료 리스트 (5개)
		ArrayList<Todo> todoCList = tService.selectTodoCList(t);
		// 진짜 전체 Todo
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		//ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		//int tbNo = todoBoardList.get(0).getTdBoardNo();
		
		//t.setTdBoardNo(tbNo);
		
		//ArrayList<Todo> allTodo = tService.allTodo(t);
		//System.out.println(tbNo);
		mv.addObject("tdBoardNo", t.getTdBoardNo());
		
		mv.addObject("todoAList", todoAList).addObject("todoOList", todoOList)
		.addObject("todoWList", todoWList).addObject("todoCList", todoCList)
		.setViewName("todo/todoListView");
		
		return mv;	
	}
	
	
	/////////// TODO 생성 뷰로 이동 ///////////
	@RequestMapping("insertTodoView.do")
	public ModelAndView insertTodoView(HttpSession session, Todo t, ModelAndView mv) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		//int tbNo = todoBoardList.get(0).getTdBoardNo();
		//System.out.println(tbNo);
		
		t.setEmpId(e.getEmpId());
		//t.setTdBoardNo(tbNo);
		mv.addObject("tdBoardNo", t.getTdBoardNo());
		//mv.addObject("tbNo", tbNo)
		mv.setViewName("todo/insertTodo");
		
		return mv;
	}
	
	/////////// TODO 생성 ///////////
	@ResponseBody
	@RequestMapping("insertTodo.do")
	public ModelAndView insertTodo(Todo t, ModelAndView mv, HttpSession session,
								   HttpServletRequest request
								   ) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		int empId = e.getEmpId();
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		//ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		//int tdBoardNo = todoBoardList.get(0).getTdBoardNo();
		//System.out.println(tdBoardNo);
		
		t.setEmpId(e.getEmpId());
		//t.setTdBoardNo(tdBoardNo);
		
		int result = tService.insertTodo(t);
		
		if(result > 0) {
			mv.addObject("tdBoardNo", t.getTdBoardNo());
			mv.addObject("empId", empId).setViewName("redirect:todoList.do");
			//addObject("tdBoardNo", tdBoardNo).
			//.setViewName("todo/todoListView");
			//return "redirect:todoList.do";
		} else {
			mv.addObject("msg", "수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	/////////// 체크된 todo 삭제 ///////////
	@ResponseBody
	@RequestMapping("deleteTodo.do")
	public String deleteTodo(Todo t) {
		
		int result = tService.deleteTodo(t);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	/////////// allTodo ///////////
	@RequestMapping("allTodoView.do")
	public ModelAndView allTodo(ModelAndView mv, HttpSession session, Todo t) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		//ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		//int tbNo = todoBoardList.get(0).getTdBoardNo();
		
		t.setEmpId(e.getEmpId());
		//t.setTdBoardNo(tbNo);
		
		ArrayList<Todo> allTodo = tService.allTodo(t);
		mv.addObject("tdBoardNo", t.getTdBoardNo());
		mv.addObject("allTodo", allTodo).setViewName("todo/allTodo");
		return mv;
	}
	
	/////////// 진행중인 TODO 리스트로 뷰로 이동
	@RequestMapping("ongoingTodoView.do")
	public ModelAndView onTodo(ModelAndView mv, HttpSession session, Todo t) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		//ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		//int tbNo = todoBoardList.get(0).getTdBoardNo();
		
		t.setEmpId(e.getEmpId());
		//t.setTdBoardNo(tbNo);
		
		ArrayList<Todo> onTodo = tService.onTodo(t);
		mv.addObject("tdBoardNo", t.getTdBoardNo());
		mv.addObject("onTodo", onTodo).setViewName("todo/ongoingTodo");
		return mv;
	}
	
	/////////// 대기 TODO 리스트로 뷰로 이동
	@RequestMapping("waitingTodoView.do")
	public ModelAndView waTodo(ModelAndView mv, HttpSession session, Todo t) {
			
		System.out.println(t);
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		//ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		//int tbNo = todoBoardList.get(0).getTdBoardNo();
		
		t.setEmpId(e.getEmpId());
		//t.getTdBoardNo();
		
		ArrayList<Todo> waTodo = tService.waTodo(t);
		
		mv.addObject("tdBoardNo", t.getTdBoardNo());
		mv.addObject("waTodo", waTodo).setViewName("todo/waitingTodo");
		return mv;
	}
	
	/////////// 완료 TODO 리스트로 뷰로 이동
	@RequestMapping("completionTodoView.do")
	public ModelAndView comTodo(ModelAndView mv, HttpSession session, Todo t) {
			
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		//ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		//int tbNo = todoBoardList.get(0).getTdBoardNo();
		
		t.setEmpId(e.getEmpId());
		//t.setTdBoardNo(tbNo);
		
		ArrayList<Todo> comTodo = tService.comTodo(t);
		mv.addObject("tdBoardNo", t.getTdBoardNo());
		mv.addObject("comTodo", comTodo).setViewName("todo/completionTodo");
		return mv;
	}
	
	/////////// todo 상세 조회
	@RequestMapping("todoDetail.do")
	public ModelAndView todoDetail(int todoNo, ModelAndView mv) {
		
		//System.out.println(todoNo);
		Todo todoDetail = tService.todoDetail(todoNo);
		//System.out.println(todoDetail);
		
		if(todoDetail != null) {
			mv.addObject("todoDetail", todoDetail).setViewName("todo/todoDetail");
		} else {
			mv.addObject("msg", "실패..").setViewName("todo/todoDetail");
		}
		return mv;
	}
	
	// Todo 수정
	@RequestMapping("updateTodo.do")
	public ModelAndView updateTodo(Todo t, ModelAndView mv) {
		
		System.out.println(t);
		int result = tService.updateTodo(t);
		
		if(result > 0) {
			mv.addObject("tdBoardNo", t.getTdBoardNo()).setViewName("redirect:todoList.do");
		}else {
			mv.addObject("msg", "수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("help.do")
	public ModelAndView help(ModelAndView mv, int empId) {
		//ArrayList<Help> bringList = tService.selectBringHelpList(empId);
		
		//mv.addObject("bringList", bringList);
		mv.setViewName("help/help");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("insertHelp.do")
	public String insertHelp(Help h) {
		
		int result = tService.insertHelp(h);
		
		if(result > 0) {
			
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteHelp.do")
	public String deleteHelp(Help h) {
		
		int result = tService.deleteHelp(h);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("updateHelp.do")
	public String updateHelp(Help h) {
		int result = tService.updateHelp(h);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("completeHelp.do")
	public String completeHelp(Help h, HttpSession session) {
		
		int result = tService.completeHelp(h);
		int result2 = eService.updateStar(h.getHelperId());
		if(result > 0 && result2 > 0) {
			((Employee)session.getAttribute("loginUser")).setStar(((Employee)session.getAttribute("loginUser")).getStar()+1);
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("selectHelp.do")
	public void selectHelp(int empId, String condition, HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Help> helpList = new ArrayList<>();
		if(condition.equals("all")) {
			helpList = tService.selectAllHelpList();
		} else {
			helpList = tService.selectMyHelpList(empId);
		}
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(helpList, response.getWriter());
	}
	
	@RequestMapping("selectBringHelp.do")
	public void selectBringHelp(Help h, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Help> helpList = tService.selectBringHelpList(h.getHelperId());
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(helpList, response.getWriter());
	}
	
	@ResponseBody
	@RequestMapping("updateTodoWidget.do")
	public String updateTodoWidget(Todo t) {
		System.out.println("수정하려고 넘긴 todo : "+t);
		int result = tService.updateTodoWidget(t);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("callTodoList.do")
	public void callTodoList(Todo t, HttpServletResponse response) throws JsonIOException, IOException{
		System.out.println(t);
		ArrayList<Todo> todoGoingList = tService.callTodoList(t);
		System.out.println(todoGoingList);
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(todoGoingList, response.getWriter());
	}
	
	
	
	
	
	

	
	
}
