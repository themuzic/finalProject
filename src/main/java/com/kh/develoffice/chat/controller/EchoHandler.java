package com.kh.develoffice.chat.controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.develoffice.chat.model.service.ChatService;
import com.kh.develoffice.chat.model.vo.Chat;
import com.kh.develoffice.chat.model.vo.Message;
import com.kh.develoffice.employee.model.vo.Employee;


public class EchoHandler extends TextWebSocketHandler{

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    @Autowired
    private ChatController cController;
    
	@Autowired
	private ChatService cService;
	
    private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();	// 그냥 사람들
    private static List<WebSocketSession> alarmList = new ArrayList<WebSocketSession>();	// 알람 쏴줄 사람들
    private static Map<String, ArrayList<WebSocketSession>> chatList = new HashMap<>();		// 채팅방 번호, 그안에 사람들
    private static List<WebSocketSession> messengerList = new ArrayList<WebSocketSession>();// 메신져 켰을때 사람들

    /**

     * 클라이언트 연결 이후에 실행되는 메소드

     */

    @Override

    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	sessionList.add(session);

        logger.info("{} 연결됨", session.getId());
    }

    /**

     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드

     */

    @Override

    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
    	String[] messageList = message.getPayload().split(":"); //받은 메세지를 :을 구분자로 스플릿
    	System.out.println("받은 메세지 = " +message.getPayload());
    	if(message.getPayload().equals("알람연결")) {
    		alarmList.add(session);
    	}else if(message.getPayload().equals("채팅방 연결")) {		// 채팅방 리스트가 연결되었으면
    		messengerList.add(session);					// 세션을 messengerList에 저장
    		
    	}else if(messageList[0].equals("채팅방 퇴장")) {
    		int empId = Integer.parseInt(messageList[2]);
    		int chatId = Integer.parseInt(messageList[3]);
			Chat c = new Chat();
			c.setChatId(chatId);
			c.setEmpId(empId);
			ArrayList<Message> people = cService.selectUsers(chatId);	// 방에 소속된 사람들 id 담을 ArrayList
    		if(Integer.parseInt(messageList[1]) == 1) {
    			int result = cService.deleteChatStatus(c);
    		}else {
    			String content = messageList[4];
    			Message m = new Message();
    			m.setEmpId(empId);
    			m.setChatId(chatId);
    			m.setContent(content);
    			m.setMsgType(2);
    			int result = cService.insertMessage(m);
    			int result2 = cService.deleteChat(c);
    			ArrayList<String> chatNameList = cService.selectChatNameList(chatId);	// 채팅방 이름 설정할 arraylist
    			Collections.sort(chatNameList);		// 오름차순 정렬
    			String chatName = String.join(", ", chatNameList);	// 채팅방 이름 설정
    			c.setChatName(chatName);
    			int result3 = cService.updateDefaultChatName(c);	// 채팅방에 속해있는 인원들 중 채팅방 이름 설정을 따로 안했을 경우 바꿔줌
    			ArrayList<WebSocketSession> list = chatList.get(messageList[3]);	// 채팅방에 있는 인원들 세션
        		for(WebSocketSession sess : list) {
        			sess.sendMessage(new TextMessage("system:" + content));
        		}
    			for(WebSocketSession sess : messengerList) {
    				
    				for(Message user : people) {
    					if(((Employee)sess.getAttributes().get("loginUser")).getEmpId() == user.getEmpId())
    						
    						sess.sendMessage(new TextMessage("채팅방 갱신")); // 메세지 전달
    				}
    			}
    		}
    	}else if(messageList[0].equals("system")) {	// 시스템 메세지가 전달 됐을 때
    		int chatId = Integer.parseInt(messageList[2]);	// 기본 chatId는 초대한 방 번호
    		int empId = ((Employee)session.getAttributes().get("loginUser")).getEmpId();	// 보낸사람 아이디 출력
    		
    		if(messageList[5].equals("1")) {		// 초대한 방이 갠톡이면
    			ArrayList<Message> users = cService.selectUsers(chatId);	// 갠톡 두명 사번 따와서
    			Message m = new Message();			// Message객체 생성
    			m.setEmpId(empId);					// empId에는 내 사번 넣고
    			m.setMsgType(2);					// chatType이 들어갈 msgType에는 2(단톡)넣고
    			for(Message user : users) {			// 갠톡 두명 돌려서
    				if(user.getEmpId() != empId) {	// 나랑 empId다르면
    					m.setChatId(user.getEmpId());	// chatId에 상대 사번 넣고
    				}
    			}
    			System.out.println(m);
    			Chat c = cController.insertChat(m);	// 일단 갠톡 두명으로 방 만들고
    			chatId = c.getChatId();				// 생성한 방 번호 가져옴
    		}
    		
    		String[] empList = messageList[3].split("_");	// 초대 받은 사람들 아이디 배열에 저장
    		Message m = new Message();						
			m.setChatId(chatId);							// 채팅방 번호 담고
			m.setEmpId(empId);								// 보낸사람 아이디 담고
			m.setContent(messageList[4]);					// 시스템 메세지 내용 담고
			m.setMsgType(2);								// 메세지 타입 설정 하고
			int result = cService.insertMessage(m);		// 메세지 db에 저장
			if(result > 0) {
				ArrayList<String> chatNameList = cService.selectChatNameList(chatId);	// 채팅방 이름 설정할 arraylist
				
				for(String emp:empList) {		// 추가할 인원들 수만큼 반복문
					String empName = cService.selectChatName(Integer.parseInt(emp));	// 그 인원 이름 직급 추출
					chatNameList.add(empName);		// 채팅방 이름에 담음
				}
				Collections.sort(chatNameList);		// 오름차순 정렬
				
				String chatName = String.join(", ", chatNameList);	// 채팅방 이름 설정
				Chat c = new Chat();		
				for(String emp:empList) {		// 추가할 인원들 수만큼 반복문
					c.setChatId(chatId);		// 채팅방 번호
					c.setChatName(chatName);	// 채팅방 이름
					c.setEmpId(Integer.parseInt(emp));	// 사번
					int result2 = cService.inviteJoinChat(c);	// 채팅방 인원 db에 저장
				}
				int result3 = cService.updateDefaultChatName(c);	// 채팅방에 속해있는 인원들 중 채팅방 이름 설정을 따로 안했을 경우 바꿔줌
			}
			if(messageList[5].equals("1")) {
				Chat c = new Chat();
				c.setChatId(chatId);
				c.setEmpId(empId);
				c = cService.selectUserChatName(c);
				for(WebSocketSession sess : chatList.get(messageList[2])) {
					if(empId == ((Employee)sess.getAttributes().get("loginUser")).getEmpId()) {
						sess.sendMessage(new TextMessage("chatId:" + c.getChatId() + ":chatName:" +  c.getChatName()));
					}
				}
				
			}else {
				ArrayList<WebSocketSession> list = chatList.get(String.valueOf(chatId));	// 방에 들어있는 소켓 ArrayList를 가져온다.
				for(WebSocketSession sess : list) {
					sess.sendMessage(new TextMessage("system:" + messageList[4]));
				}
			}
			ArrayList<Message> people = cService.selectUsers(chatId);	// 방에 소속된 사람들 id 담을 ArrayList
			for(WebSocketSession sess : messengerList) {
				
				for(Message user : people) {
					if(((Employee)sess.getAttributes().get("loginUser")).getEmpId() == user.getEmpId())
						
						sess.sendMessage(new TextMessage("채팅방 갱신")); // 메세지 전달
				}
			}
    	}else if(messageList.length == 2 && messageList[0].equals("chatId")) {// 스플릿한 배열의 길이가 2(chatId:15)면서 0번 인덱스가 chatId일때
    		
    		ArrayList<WebSocketSession> list;
    		int empId = ((Employee)session.getAttributes().get("loginUser")).getEmpId();	// 채팅창 연 아이디 출력
    		if(!chatList.containsKey(messageList[1])) {	// chatId에 키값이 존재하지 않을때
    			list = new ArrayList<>();				// 새로 ArrayList생성
    		}else {										// 존재할때
    			list = chatList.get(messageList[1]);	// 기존 map에서 ArrayList 추출
    		}
			Message m = new Message();			// 메세지 객체 생성
			m.setEmpId(empId);					// 채팅방 연 아이디 담음
			m.setChatId(Integer.parseInt(messageList[1]));	// 채팅방 번호 담음
			
			int update = cService.updateJoinMod(m);	// 채팅방 확인 갱신
			if(update > 0) {
				System.out.println("연결 갱신됨");
				list.add(session);					// ArrayList에 세션을 담는다.
				chatList.put(messageList[1], list);	// 채팅방 리스트에 chatId와 웹소켓세션을 담는다
			}
			
			for(WebSocketSession sess : messengerList) {					// 채팅방 리스트에 접속한 세션 전체 반복문 실행
					if(empId == ((Employee)sess.getAttributes().get("loginUser")).getEmpId()){
						// 방에 있는 세션의 empId와 채팅방 리스트에 접속한 세션의 empId가 같으면
						sess.sendMessage(new TextMessage("채팅방 갱신")); // 메세지 전달
					}
					
			}
    	}else if(messageList.length >= 3 && messageList[0].equals("chatId")) {	// 스플릿한 배열의 길이가 3이상이고, 0번 인덱스가 chatId일때
			
    		String content = message.getPayload().substring(message.getPayload().indexOf(":",message.getPayload().indexOf(":")+1)+1);	// 채팅 내용
    		ArrayList<WebSocketSession> list = chatList.get(messageList[1]);	// 방에 들어있는 소켓 ArrayList를 가져온다.
			int empId = ((Employee)session.getAttributes().get("loginUser")).getEmpId();	// 보낸사람 아이디 출력
			String profilePath = ((Employee)session.getAttributes().get("loginUser")).getProfilePath();	// 보낸사람 프로필경로 출력
			String empName = cService.selectChatName(empId);	// 보낸사람 이름
			Message m = new Message();						// 메세지 객체 생성
			m.setChatId(Integer.parseInt(messageList[1]));	// 방번호 담고
			m.setEmpId(empId);								// 쓴사람 담고
			m.setContent(content);							// 내용 담고
			m.setMsgType(1);								// 채팅 타입(시스템메세지 아님)담고
			System.out.println(m);
			int result = cService.insertMessage(m);		// 메세지 db에 저장
			ArrayList<Message> people = cService.selectUsers(Integer.parseInt(messageList[1]));	// 방에 소속된 사람들 id 담을 ArrayList
			
			if(result > 0) {	// 저장 됐으면
				int result2 = cService.updateChatMod(Integer.parseInt(messageList[1]));	// 채팅방 갱신날짜 db에 저장
				if(result2 > 0) {	// 저장 됐으면
					ArrayList<Chat> alarmEmpList = cService.selectAlarmList(Integer.parseInt(messageList[1]));
					for(WebSocketSession sess : list) {									// 그 방에 있는 세션 전체 반복문 실행
						int otherId = ((Employee)sess.getAttributes().get("loginUser")).getEmpId();	// 받는사람 아이디 출력
						m.setEmpId(otherId);
						if(empId == otherId){		// 보낸사람과 받는사람이 아이디가 같으면
							int update = cService.updateJoinMod(m);	// 채팅방 확인 갱신
							if(update > 0) {					// 갱신됐으면
								sess.sendMessage(new TextMessage("나:"+ content));	//메세지 출력								
							}
						}else {						// 다르면
							int update = cService.updateJoinMod(m);	// 채팅방 확인 갱신
							if(update > 0) {					// 갱신됐으면
								sess.sendMessage(new TextMessage(empName +":"+ profilePath + ":" + content));	// 메세지 출력
							}
						}
					}
					for(WebSocketSession sess2 : messengerList) {						// 채팅방 리스트에 접속한 세션 전체 반복문 실행
						for(Message user : people) {
							if(user.getEmpId() == ((Employee)sess2.getAttributes().get("loginUser")).getEmpId()){
								// 방에 있는 세션의 empId와 채팅방 리스트에 접속한 세션의 empId가 같으면
								sess2.sendMessage(new TextMessage("채팅방 갱신")); // 메세지 전달
							}
						}
					}
					for(WebSocketSession sess3 : alarmList) {
						for(Chat c : alarmEmpList) {
							if(((Employee)sess3.getAttributes().get("loginUser")).getEmpId() == c.getEmpId()) {
								sess3.sendMessage(new TextMessage(messageList[1] + ":" + c.getChatName() + ":" + c.getChatType()));
							}
						}
					}
					
				}else {
					System.out.println("채팅방 갱신 실패!");
				}
			}else {
				System.out.println("메세지 입력 실패!");
			}
		}
	    logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
	
	}
	
	/**

     * 클라이언트가 연결을 끊었을 때 실행되는 메소드

     */

    @Override

    public void afterConnectionClosed(WebSocketSession session,

            CloseStatus status) throws Exception {
    	
        sessionList.remove(session);
        alarmList.remove(session);
        messengerList.remove(session);
        for(String key : chatList.keySet()) {
        	ArrayList<WebSocketSession> list = chatList.get(key);
        	for(WebSocketSession sess : list) {
        		if(sess.getId() == session.getId()){
        			list.remove(sess);
        			break;
        		}
        	}
        	chatList.put(key, list);
        }
        logger.info("{} 연결 끊김", session.getId());

    }

}