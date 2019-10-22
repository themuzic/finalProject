package com.kh.develoffice.todo.model.service;

import java.util.ArrayList;

import com.kh.develoffice.todo.model.vo.TodoBoard;

public interface TodoService {
	
	///////////	TODO Board 생성 ///////////
	int insertTodoBoard(TodoBoard t);
	
	///////////	TODO Board List 불러오기 ///////////
	ArrayList<TodoBoard> selectBoardList();

}
