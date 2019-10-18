package com.kh.develoffice.chat.model.service;

import java.util.ArrayList;

import com.kh.develoffice.chat.model.vo.Chat;

public interface ChatService {
	
	// 채팅방 조회 서비스
	ArrayList<Chat> selectChatList(int empId);
}
