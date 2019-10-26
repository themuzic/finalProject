package com.kh.develoffice.todo.model.service;

import java.util.ArrayList;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.todo.model.vo.Todo;
import com.kh.develoffice.todo.model.vo.TodoBoard;

public interface TodoService {
	
	///////////	TODO Board 생성 ///////////
	int insertTodoBoard(TodoBoard t);
	
	///////////	TODO Board List 불러오기 ///////////
	ArrayList<TodoBoard> selectBoardList(TodoBoard tb);
	
	/////////// TODO 리스트 조회 ///////////
	// 전체 리스트 조회
	ArrayList<Todo> selectTodoAList(Todo t);
	// 진행중 리스트 조회
	ArrayList<Todo> selectTodoOList(Todo t);
	// 대기 리스트 조회
	ArrayList<Todo> selectTodoWList(Todo t);
	// 완료 리스트 조회
	ArrayList<Todo> selectTodoCList(Todo t);
	
	/////////// 체크된 todo 삭제 ///////////
	int deleteTodo(Todo t);
	
	/////////// TODO 생성 ///////////
	int insertTodo(Todo t);

}
