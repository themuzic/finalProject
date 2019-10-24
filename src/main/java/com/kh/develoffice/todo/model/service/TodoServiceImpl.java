package com.kh.develoffice.todo.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.mail.model.vo.PageInfo;
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


	/////////// 게시판 총 갯수 조회 ///////////
	@Override
	public int getListCount() {
		return tDao.getListCount();
	}


	/////////// TODO 리스트 조회 ///////////
	@Override
	public ArrayList<Todo> selectTodoList(Todo t) {
		return tDao.selectTodoList(t);
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
}
