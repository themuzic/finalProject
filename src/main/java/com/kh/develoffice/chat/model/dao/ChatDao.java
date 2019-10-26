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
	
	public ArrayList<Message> selectChatProfile(int empId) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatProfile", empId);
		
	}

	public ArrayList<Message> selectMsgList(Chat c) {
		System.out.println(c.getChatId() + " " + c.getChatName() + " "  + c.getEmpId());
		return (ArrayList)sqlSession.selectList("chatMapper.selectMsgList", c);
		
	}

	public int insertMessage(Message m) {
		
		return sqlSession.insert("chatMapper.insertMessage", m);
	}

	public int updateChatMod(int chatId) {
		
		return sqlSession.update("chatMapper.updateChatMod",chatId);
	}

	public int updateJoinMod(Message m) {
		return sqlSession.update("chatMapper.updateJoinMod",m);
	}

	public ArrayList<Message> selectUsers(int chatId) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectUsers", chatId);
	}

	public int getChatStatus(Message m) {
		int result = 0;
		if(sqlSession.selectOne("chatMapper.getChatStatus", m) != null) {
			result = sqlSession.selectOne("chatMapper.getChatStatus", m);
		}
		return result;
	}

	public int insertChat(int type) {
		return sqlSession.insert("chatMapper.insertChat", type);
	}

	public String selectChatName(int empId) {
		return sqlSession.selectOne("chatMapper.selectChatName", empId);
	}

	public int insertJoinChat(Chat myChat) {
		return sqlSession.insert("chatMapper.insertJoinChat", myChat);
	}

	public ArrayList<Employee> selectInviteList(int chatId) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectInviteList", chatId);
	}

	public ArrayList<String> selectChatNameList(int chatId) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatNameList", chatId);
	}

	public int inviteJoinChat(Chat c) {
		return sqlSession.insert("chatMapper.inviteJoinChat", c);
	}

	public int updateDefaultChatName(Chat c) {
		return sqlSession.update("chatMapper.updateDefaultChatName", c);
	}

	public Chat selectUserChatName(Chat c) {
		return sqlSession.selectOne("chatMapper.selectUserChatName", c);
	}

	public int selectNewChatId() {
		return sqlSession.selectOne("chatMapper.selectNewChatId");
	}

	public Chat selectChatId(Message m) {
		return sqlSession.selectOne("chatMapper.selectChatId", m);
	}


	
}
