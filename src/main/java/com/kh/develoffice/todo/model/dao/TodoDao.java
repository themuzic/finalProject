package com.kh.develoffice.todo.model.dao;

import java.util.ArrayList;

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
		
		//System.out.println(t.getEmpId());
		return sqlSession.insert("todoMapper.insertTodoBoard", t);
	}
	
	
	///////////	TODO Board List 불러오기 ///////////
	public ArrayList<TodoBoard> selectBoardList(){
		return (ArrayList)sqlSession.selectList("todoMapper.selectBoardList");
	}
	
}
