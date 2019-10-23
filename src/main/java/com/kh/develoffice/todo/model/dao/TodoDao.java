package com.kh.develoffice.todo.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.todo.model.vo.Todo;
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
	
	/////////// 게시판 총 갯수 조회 ///////////
	public int getListCount() {
		return sqlSession.selectOne("todoMapper.getListCount");
	}
	
	/////////// TODO 리스트 조회 ///////////
	public ArrayList<Todo> selectTodoList(/* PageInfo pi, */Todo t){
		
		System.out.println(t);
		
		/*
		 * int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); RowBounds
		 * rowBounds = new RowBounds(offset, pi.getBoardLimit());
		 */
		//int i = e.getEmpId();
		//System.out.println(i);
		//ArrayList<Todo> list = (ArrayList)sqlSession.selectList("todoMapper.selectTodoList", t/* , rowBounds */);
		
		//System.out.println(list);
		
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodoList", t/* , rowBounds */);
		
	}
	
}
