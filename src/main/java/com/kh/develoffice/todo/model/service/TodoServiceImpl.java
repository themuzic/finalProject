package com.kh.develoffice.todo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.todo.model.dao.TodoDao;
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
}
