package com.kh.develoffice.chat.model.service;

import java.util.ArrayList;

import com.kh.develoffice.chat.model.vo.Chat;
import com.kh.develoffice.chat.model.vo.Message;
import com.kh.develoffice.employee.model.vo.Employee;

public interface ChatService {
	
	// 유저 목록 조회 서비스
	ArrayList<Employee> selectEmpList();

	// 채팅방 조회 서비스
	ArrayList<Chat> selectChatList(int empId);

	ArrayList<Message> selectMsgList(int chatId);

	ArrayList<Message> selectChatProfile();

}
