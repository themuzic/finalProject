package com.kh.develoffice.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.chat.model.vo.Chat;
import com.kh.develoffice.chat.model.vo.Message;
import com.kh.develoffice.employee.model.vo.Employee;

@Repository("cDao")
public class ChatDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Employee> selectEmpList() {
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAllEmp");
	}

	public ArrayList<Chat> selectChatList(int empId) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList", empId);
		
	}

	public ArrayList<Message> selectMsgList(int chatId) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectMsgList", chatId);
		
	}

	public ArrayList<Message> selectChatProfile() {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatProfile");
		
	}

	
}
