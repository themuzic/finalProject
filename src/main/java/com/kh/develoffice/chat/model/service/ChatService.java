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
	
	// 자기 자신을 제외한 프로필 조회 서비스
	ArrayList<Message> selectChatProfile(int empId);
	
	// 메세지 내역 조회 서비스
	ArrayList<Message> selectMsgList(int chatId);

	// 메세지 등록 서비스
	int insertMessage(Message m);

	// 채팅방 갱신 서비스
	int updateChatMod(int chatId);

	// 채팅방 인원 확인 갱신 서비스
	int updateJoinMod(Message m);

	// 채팅방 소속 사람들 조회 서비스
	ArrayList<Message> selectUsers(int chatId);

}
