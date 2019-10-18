package com.kh.develoffice.todo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.todo.model.vo.TodoBoard;

@Repository("tDao")
public class TodoDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	///////////	TODO Board 생성 ///////////
	public int insertTodoBoard(TodoBoard t) {
		return sqlSession.insert("todo-Mapper.insertTodoBoard", t);
	}
	
}
