package com.kh.develoffice.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.chat.model.dao.ChatDao;
import com.kh.develoffice.chat.model.vo.Chat;
import com.kh.develoffice.chat.model.vo.Message;
import com.kh.develoffice.employee.model.vo.Employee;

@Service("cService")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao cDao;

	@Override
	public ArrayList<Employee> selectEmpList() {
		
		return cDao.selectEmpList();
		
	}
	
	@Override
	public ArrayList<Chat> selectChatList(int empId) {
		
		return cDao.selectChatList(empId);
		
	}
	
	@Override
	public ArrayList<Message> selectChatProfile(int empId) {
		
		return cDao.selectChatProfile(empId);
		
	}

	@Override
	public ArrayList<Message> selectMsgList(int chatId) {
		
		return cDao.selectMsgList(chatId);
		
	}

	@Override
	public int insertMessage(Message m) {
		return cDao.insertMessage(m);
		
	}

	@Override
	public int updateChatMod(int chatId) {
		return cDao.updateChatMod(chatId);
	}

	@Override
	public int updateJoinMod(Message m) {
		return cDao.updateJoinMod(m);
	}

	@Override
	public ArrayList<Message> selectUsers(int chatId) {
		return cDao.selectUsers(chatId);
	}

	@Override
	public int getChatStatus(Message m) {
		return cDao.getChatStatus(m);
		
	}

	@Override
	public int insertChat(int type) {
		return cDao.insertChat(type);
	}

	@Override
	public Chat selectChatId(Message m) {
		return cDao.selectChatId(m);
	}

	@Override
	public String selectChatName(int empId) {
		return cDao.selectChatName(empId);
	}

	@Override
	public int insertJoinChat(Chat myChat) {
		return cDao.insertJoinChat(myChat);
	}

	@Override
	public ArrayList<Employee> selectInviteList(int chatId) {
		return cDao.selectInviteList(chatId);
	}


}
