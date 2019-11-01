package com.kh.develoffice.todo.model.service;

import java.util.ArrayList;

import com.kh.develoffice.todo.model.vo.Help;
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
	
	/////////// 전체 TODO 리스트 이동 ///////////
	ArrayList<Todo> allTodo(Todo t);
	
	/////////// 진행중 TODO 리스트 이동 ///////////
	ArrayList<Todo> onTodo(Todo t);
	
	/////////// 대기 TODO 리스트 이동 ///////////
	ArrayList<Todo> waTodo(Todo t);
	
	/////////// 완료 TODO 리스트 이동 ///////////
	ArrayList<Todo> comTodo(Todo t);
	
	// Todo 상세 조회
	Todo todoDetail(int todoNo);
	
	// Todo 상태 변경 - 진행
	int updateTodo(Todo t);
	
	// 위젯용 진행중 리스트 호출
	ArrayList<Todo> selectWidgetGoingTodoList(int id);
	// 위젯용 대기중 리스트 호출
	ArrayList<Todo> selectWidgetWaitTodoList(int id);
	// 위젯에서 todo 상태 업데이트
	int updateTodoWidget(Todo t);
	
	// 위젯에서 쓸 todo 리스트 호출
	ArrayList<Todo> callTodoList(Todo t);
	
	// all helplist
	ArrayList<Help> selectAllHelpList();
	// my helplist
	ArrayList<Help> selectMyHelpList(int empId);
	// bring helplist
	ArrayList<Help> selectBringHelpList(int empId);
	// insert Help
	int insertHelp(Help h);
	

}
