package com.kh.develoffice.todo.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.todo.model.dao.TodoDao;
import com.kh.develoffice.todo.model.vo.Todo;
import com.kh.develoffice.todo.model.vo.TodoBoard;

@Service("tService")
public class TodoServiceImpl implements TodoService {

	@Autowired
	private TodoDao tDao;

	///////////	TODO Board 생성 ///////////
	@Override
	public int insertTodoBoard(TodoBoard t) {
		return tDao.insertTodoBoard(t);
	}

	
	///////////	TODO Board List 불러오기 ///////////
	@Override
	public ArrayList<TodoBoard> selectBoardList(TodoBoard tb) {
		return tDao.selectBoardList(tb);
	}


	/////////// TODO 리스트 조회 ///////////
	// 전체 리스트 조회
	@Override
	public ArrayList<Todo> selectTodoAList(Todo t) {
		return tDao.selectTodoAList(t);
	}
	// 진행중 리스트 조회
	@Override
	public ArrayList<Todo> selectTodoOList(Todo t) {
		return tDao.selectTodoOList(t);
	}
	// 대기 리스트 조회
	@Override
	public ArrayList<Todo> selectTodoWList(Todo t) {
		return tDao.selectTodoWList(t);
	}
	// 완료 리스트 조회
	@Override
	public ArrayList<Todo> selectTodoCList(Todo t) {
		return tDao.selectTodoCList(t);
	}

	/////////// 체크된 todo 삭제 ///////////
	@Override
	public int deleteTodo(Todo t) {
		return tDao.deleteTodo(t);
	}


	/////////// TODO 생성 ///////////
	@Override
	public int insertTodo(Todo t) {
		return tDao.insertTodo(t);
	}

	/////////// allTodo ///////////
	@Override
	public ArrayList<Todo> allTodo(Todo t) {
		return tDao.allTodo(t);
	}

	/////////// onTodo ///////////
	@Override
	public ArrayList<Todo> onTodo(Todo t) {
		return tDao.onTodo(t);
	}

	/////////// waitingTodo ///////////
	@Override
	public ArrayList<Todo> waTodo(Todo t) {
		return tDao.waTodo(t);
	}

	/////////// completionTodo ///////////
	@Override
	public ArrayList<Todo> comTodo(Todo t) {
		return tDao.comTodo(t);
	}


	// Todo 상세 조회
	@Override
	public Todo todoDetail(int todoNo) {
		return tDao.todoDetail(todoNo);
	}

	// Todo 상태변경 - 진행
	@Override
	public int updateTodo(Todo t) {
		return tDao.updateTodo(t);
	}


	@Override
	public ArrayList<Todo> selectWidgetGoingTodoList(int id) {
		return tDao.selectWidgetGoingTodoList(id);
	}


	@Override
	public ArrayList<Todo> selectWidgetWaitTodoList(int id) {
		return tDao.selectWidgetWaitTodoList(id);
	}


	


	
}
