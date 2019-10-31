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
	public ArrayList<Message> selectMsgList(Chat c) {
		
		return cDao.selectMsgList(c);
		
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

	@Override
	public ArrayList<String> selectChatNameList(int chatId) {
		return cDao.selectChatNameList(chatId);
	}

	@Override
	public int inviteJoinChat(Chat c) {
		return cDao.inviteJoinChat(c);
	}

	@Override
	public int updateDefaultChatName(Chat c) {
		return cDao.updateDefaultChatName(c);
	}

	@Override
	public Chat selectUserChatName(Chat c) {
		return cDao.selectUserChatName(c);
	}

	@Override
	public int selectNewChatId() {
		return cDao.selectNewChatId();
	}

	@Override
	public int updateChatStatus(Chat c) {
		return cDao.updateChatStatus(c);
	}

	@Override
	public int deleteChat(Chat c) {
		return cDao.deleteChat(c);
	}

	@Override
	public String selectAlarm(Chat c) {
		return cDao.selectAlarm(c);
	}

	@Override
	public int updateAlarm(Chat c) {
		return cDao.updateAlarm(c);
	}

	@Override
	public int deleteChatStatus(Chat c) {
		return cDao.deleteChatStatus(c);
	}

	@Override
	public ArrayList<Chat> selectAlarmList(Chat c) {
		return cDao.selectAlarmList(c);
	}

	@Override
	public ArrayList<Employee> searchEmpList(String search) {
		return cDao.searchEmpList(search);
	}

	@Override
	public ArrayList<Chat> searchChatList(Chat c) {
		return cDao.searchChatList(c);
	}

	@Override
	public int updateChatName(Chat c) {
		return cDao.updateChatName(c);
	}

	@Override
	public int updateChatNameReturn(Chat c) {
		return cDao.updateChatNameReturn(c);
	}


}
