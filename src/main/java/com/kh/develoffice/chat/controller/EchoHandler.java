package com.kh.develoffice.chat.controller;


import java.util.ArrayList;
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
import com.kh.develoffice.chat.model.vo.Message;
import com.kh.develoffice.employee.model.vo.Employee;


public class EchoHandler extends TextWebSocketHandler{

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    
	@Autowired
	private ChatService cService;
	
    private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    private static Map<String, ArrayList<WebSocketSession>> chatList = new HashMap<>();
    private static List<WebSocketSession> messengerList = new ArrayList<WebSocketSession>();

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
    	
    	if(messageList.length == 2 && messageList[0].equals("chatId")) {// 스플릿한 배열의 길이가 2(chatId:15)면서 0번 인덱스가 chatId일때
    		
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
			
    	}
    	if(message.getPayload().equals("채팅방 연결")) {		// 채팅방 리스트가 연결되었으면
    		messengerList.add(session);					// 세션을 messengerList에 저장
    	}
    	if(messageList.length == 3 && messageList[0].equals("chatId")) {	// 스플릿한 배열의 길이가 3이고, 0번 인덱스가 chatId일때

			ArrayList<WebSocketSession> list = chatList.get(messageList[1]);	// 방에 들어있는 소켓 ArrayList를 가져온다.
			int empId = ((Employee)session.getAttributes().get("loginUser")).getEmpId();	// 보낸사람 아이디 출력
			String profilePath = ((Employee)session.getAttributes().get("loginUser")).getProfilePath();	// 보낸사람 프로필경로 출력
			
			Message m = new Message();
			m.setChatId(Integer.parseInt(messageList[1]));
			m.setEmpId(empId);
			m.setContent(messageList[2]);
			System.out.println(m);
			int result = cService.insertMessage(m);		// 메세지 db에 저장
			ArrayList<Message> people = cService.selectUsers(Integer.parseInt(messageList[1]));	// 방에 소속된 사람들 id 담을 ArrayList
			
			if(result > 0) {	// 저장 됐으면
				int result2 = cService.updateChatMod(Integer.parseInt(messageList[1]));	// 채팅방 갱신날짜 db에 저장
				if(result2 > 0) {	// 저장 됐으면
					for(WebSocketSession sess : list) {									// 그 방에 있는 세션 전체 반복문 실행
						int otherId = ((Employee)sess.getAttributes().get("loginUser")).getEmpId();	// 받는사람 아이디 출력
						System.out.println(otherId);
						if(empId == otherId){		// 보낸사람과 받는사람이 아이디가 같으면
							int update = cService.updateJoinMod(m);	// 채팅방 확인 갱신
							if(update > 0) {					// 갱신됐으면
								System.out.println("나 갱신됨");
								sess.sendMessage(new TextMessage("나:"+ messageList[2]));	//메세지 출력								
							}
						}else {						// 다르면
							int update = cService.updateJoinMod(m);	// 채팅방 확인 갱신
							if(update > 0) {					// 갱신됐으면
								System.out.println("상대방 갱신됨");
								sess.sendMessage(new TextMessage("상대방:"+ messageList[2] + ":" + profilePath));	// 메세지 출력
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