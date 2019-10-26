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
	public ArrayList<TodoBoard> selectBoardList(TodoBoard tb){
		ArrayList<TodoBoard> list = (ArrayList)sqlSession.selectList("todoMapper.selectBoardList", tb);
		//return (ArrayList)sqlSession.selectList("todoMapper.selectBoardList", tb);
		//System.out.println(list);
		
		return list;	
	}
	
	/////////// 게시판 총 갯수 조회 ///////////
	public int getListCount() {
		return sqlSession.selectOne("todoMapper.getListCount");
	}
	
	/////////// TODO 리스트 조회 ///////////
	// 전체 리스트 조회
	public ArrayList<Todo> selectTodoAList(Todo t){
		//System.out.println(t);
		ArrayList<Todo> list = (ArrayList)sqlSession.selectList("todoMapper.selectTodoAList", t);
		//System.out.println(list);
		return list;
	}
	// 진행중 리스트 조회
	public ArrayList<Todo> selectTodoOList(Todo t){
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodoOList", t);
	}
	// 대기 리스트 조회
	public ArrayList<Todo> selectTodoWList(Todo t){
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodoWList", t);
	}
	// 완료 리스트 조회
	public ArrayList<Todo> selectTodoCList(Todo t){
		return (ArrayList)sqlSession.selectList("todoMapper.selectTodoCList", t);
	}
	
	/////////// 체크된 todo 삭제 ///////////
	public int deleteTodo(Todo t) {
		return sqlSession.update("todoMapper.deleteTodo", t);
	}
	
	/////////// TODO 생성 ///////////
	public int insertTodo(Todo t) {
		return sqlSession.insert("todoMapper.insertTodo", t);
	}
	
	/////////// allTodo /////////// 
	public ArrayList<Todo> allTodo(Todo t){
		return (ArrayList)sqlSession.selectList("todoMapper.allTodo", t);
	}
	
	/////////// onTodo /////////// 
	public ArrayList<Todo> onTodo(Todo t){
		return (ArrayList)sqlSession.selectList("todoMapper.onTodo", t);
	}
	
	/////////// waitingTodo /////////// 
	public ArrayList<Todo> waTodo(Todo t){
		return (ArrayList)sqlSession.selectList("todoMapper.waTodo", t);
	}
	
	/////////// completionTodo /////////// 
	public ArrayList<Todo> comTodo(Todo t){
	return (ArrayList)sqlSession.selectList("todoMapper.comTodo", t);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
