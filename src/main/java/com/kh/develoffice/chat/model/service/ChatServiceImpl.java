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
	public ArrayList<Message> selectMsgList(int chatId) {
		
		return cDao.selectMsgList(chatId);
		
	}

	@Override
	public ArrayList<Message> selectChatProfile() {
		
		return cDao.selectChatProfile();
		
	}

}
