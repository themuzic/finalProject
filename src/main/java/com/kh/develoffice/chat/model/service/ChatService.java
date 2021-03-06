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
	ArrayList<Message> selectMsgList(Chat c);

	// 메세지 등록 서비스
	int insertMessage(Message m);

	// 채팅방 갱신 서비스
	int updateChatMod(int chatId);

	// 채팅방 인원 확인 갱신 서비스
	int updateJoinMod(Message m);

	// 채팅방 소속 사람들 사번 조회 서비스
	ArrayList<Message> selectUsers(int chatId);

	// 갠톡 생성 유무 서비스
	int getChatStatus(Message m);

	// 채팅방 생성 서비스
	int insertChat(int type);

	// 갠톡 상대 이름 조회
	String selectChatName(int empId);

	// 갠톡 채팅방 인원 등록 서비스
	int insertJoinChat(Chat myChat);

	// 초대 할 인원 조회 서비스
	ArrayList<Employee> selectInviteList(int chatId);
	
	// 단톡에 속해있는 사람들 이름 직급 조회 서비스
	ArrayList<String> selectChatNameList(int chatId);
	
	// 채팅방 초대 인원 추가 서비스
	int inviteJoinChat(Chat c);
	
	// 채팅방 인원 추가시 이름 변경
	int updateDefaultChatName(Chat c);

	// 채팅방 이름 조회
	Chat selectUserChatName(Chat c);

	// 마지막에 생성한 채팅방
	int selectNewChatId();

	// 방번호, 방이름, 방타입, 방삭제여부 조회 서비스
	Chat selectChatId(Message m);

	// 채팅방 삭제 갱신용 서비스
	int updateChatStatus(Chat c);

	// 채팅방 삭제 서비스
	int deleteChat(Chat c);

	// 알람 켜있는지 여부 조회 서비스
	String selectAlarm(Chat c);

	// 알람 키고 끄는 서비스
	int updateAlarm(Chat c);

	// 갠톡 채팅방 삭제  서비스
	int deleteChatStatus(Chat c);

	// 방에 알람 켜 있는 사람 조회 서비스
	ArrayList<Chat> selectAlarmList(Chat c);

	// 사원 검색 서비스
	ArrayList<Employee> searchEmpList(String search);

	// 대화방 검색 서비스
	ArrayList<Chat> searchChatList(Chat c);

	// 채팅방 이름 변경 서비스
	int updateChatName(Chat c);

	// 채팅방 이름 원래대로 바꾸는 서비스
	int updateChatNameReturn(Chat c);


}
