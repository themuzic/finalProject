package com.kh.develoffice.todo.model.service;

import java.util.ArrayList;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.todo.model.vo.Todo;
import com.kh.develoffice.todo.model.vo.TodoBoard;

public interface TodoService {
	
	///////////	TODO Board 생성 ///////////
	int insertTodoBoard(TodoBoard t);
	
	///////////	TODO Board List 불러오기 ///////////
	ArrayList<TodoBoard> selectBoardList();
	
	/////////// 게시판 총 갯수 조회 ///////////
	int getListCount();
	
	/////////// TODO 리스트 조회 ///////////
	ArrayList<Todo> selectTodoList(/* PageInfo pi, */Employee e);
	

}
