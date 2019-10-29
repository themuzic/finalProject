package com.kh.develoffice.todo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		// 전체리스트
		ArrayList<Todo> todoAList = tService.selectTodoAList(t);
		// 진행중 리스트
		ArrayList<Todo> todoOList = tService.selectTodoOList(t);
		// 대기 리스트
		ArrayList<Todo> todoWList = tService.selectTodoWList(t);
		// 완료 리스트
		ArrayList<Todo> todoCList = tService.selectTodoCList(t);
		
		
		mv.addObject("todoAList", todoAList).addObject("todoOList", todoOList)
		.addObject("todoWList", todoWList).addObject("todoCList", todoCList).setViewName("todo/todoListView");
		System.out.println(todoAList);
		
		return mv;	
	}
	
	
	/////////// TODO 생성 뷰로 이동 ///////////
	@RequestMapping("insertTodoView.do")
	public String insertTodoView(HttpSession session, Todo t) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		int tbNo = todoBoardList.get(0).getTdBoardNo();
		System.out.println(tbNo);
		
		t.setEmpId(e.getEmpId());
		t.setTdBoardNo(tbNo);
		
		return "todo/insertTodo";
	}
	
	/////////// TODO 생성 ///////////
	@RequestMapping("insertTodo.do")
	public String insertTodo(Todo t, HttpServletRequest request, HttpSession session, Model model) {
		
		int result = tService.insertTodo(t);
		
		if(result > 0) {
			return "redirect:todoList.do";
		} else {
			model.addAttribute("msg", "TO-DO 생성에 실패하였습니다.");
			return "common/blankPage";
		}
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
		
		ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		int tbNo = todoBoardList.get(0).getTdBoardNo();
		
		t.setEmpId(e.getEmpId());
		t.setTdBoardNo(tbNo);
		
		ArrayList<Todo> allTodo = tService.allTodo(t);
		
		mv.addObject("allTodo", allTodo).setViewName("todo/allTodo");
		return mv;
	}
	
	/////////// 진행중인 TODO 리스트로 뷰로 이동
	@RequestMapping("ongoingTodoView.do")
	public ModelAndView onTodo(ModelAndView mv, HttpSession session, Todo t) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		int tbNo = todoBoardList.get(0).getTdBoardNo();
		
		t.setEmpId(e.getEmpId());
		t.setTdBoardNo(tbNo);
		
		ArrayList<Todo> onTodo = tService.onTodo(t);
		
		mv.addObject("onTodo", onTodo).setViewName("todo/ongoingTodo");
		return mv;
	}
	
	/////////// 대기 TODO 리스트로 뷰로 이동
	@RequestMapping("waitingTodoView.do")
	public ModelAndView waTodo(ModelAndView mv, HttpSession session, Todo t) {
			
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		int tbNo = todoBoardList.get(0).getTdBoardNo();
		
		t.setEmpId(e.getEmpId());
		t.setTdBoardNo(tbNo);
		
		ArrayList<Todo> waTodo = tService.waTodo(t);
		
		mv.addObject("waTodo", waTodo).setViewName("todo/waitingTodo");
		return mv;
	}
	
	/////////// 완료 TODO 리스트로 뷰로 이동
	@RequestMapping("completionTodoView.do")
	public ModelAndView comTodo(ModelAndView mv, HttpSession session, Todo t) {
			
		Employee e = (Employee)session.getAttribute("loginUser");
		
		TodoBoard tb = new TodoBoard();
		tb.setEmpId(e.getEmpId());
		
		ArrayList<TodoBoard> todoBoardList = tService.selectBoardList(tb);
		int tbNo = todoBoardList.get(0).getTdBoardNo();
		
		t.setEmpId(e.getEmpId());
		t.setTdBoardNo(tbNo);
		
		ArrayList<Todo> comTodo = tService.comTodo(t);
		
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
	
	/*@RequestMapping("updateTodo.do")
	public String updateTodo(HttpServletRequest request,
							 @RequestParam(name="todoNo", required=false) Integer todoNo) {
		
		System.out.println("todoNo : " + todoNo);
		
		int result = tService.updateTodo(todoNo);

		if(result > 0) {
			return "redirect:todoDetail.do";
		} else {
			return "common/errorPage";
		}
	}*/
	
	@RequestMapping("updateTodo.do")
	public ModelAndView updateTodo(Todo t, ModelAndView mv,
						HttpServletRequest request, 
						@RequestParam(name="todoNo", required=false) Integer todoNo) {
		
		System.out.println(todoNo);
		int result = tService.updateTodo(t);
		
		if(result > 0) {
			mv.addObject("todoNo", t.getTodoNo()).setViewName("redirect:todoDetail.do");
		}else {
			mv.addObject("msg", "수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	
	@RequestMapping("help.do")
	public ModelAndView help(ModelAndView mv) {
		
		mv.setViewName("todo/help");
		
		return mv;
	}
	
	

	
	
}
