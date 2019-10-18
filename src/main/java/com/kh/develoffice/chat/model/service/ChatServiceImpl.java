package com.kh.develoffice.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.chat.model.dao.ChatDao;
import com.kh.develoffice.chat.model.vo.Chat;

@Service("cService")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao cDao;

	@Override
	public ArrayList<Chat> selectChatList(int empId) {
		
		return cDao.selectChatList(empId);
		
	}
}
