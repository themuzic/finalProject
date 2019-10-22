package com.kh.develoffice.chat.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.develoffice.employee.model.vo.Employee;


public class EchoHandler extends TextWebSocketHandler{

private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    

    private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    private static Map<String, ArrayList<WebSocketSession>> chatList = new HashMap<>();

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
//    	String username = (String)session.getUserProperties().get("username");
    	System.out.println(session.getAttributes());
    	String[] messageList = message.getPayload().split(":"); //받은 메세지를 :을 구분자로 스플릿
    	
    	if(messageList.length == 2 && messageList[0].equals("chatId")) {// 스플릿한 배열의 길이가 2(chatId:15)면서 0번 인덱스가 chatId일때
    		ArrayList<WebSocketSession> list;	
    		if(!chatList.containsKey(messageList[1])) {	// chatId에 키값이 존재하지 않을때
    			list = new ArrayList<>();				// 새로 ArrayList생성
    		}else {										// 존재할때
    			list = chatList.get(messageList[1]);	// 기존 map에서 ArrayList 추출
    		}
    		list.add(session);					// ArrayList에 세션을 담는다.
			chatList.put(messageList[1], list);	// 채팅방 리스트에 chatId와 웹소켓세션을 담는다
    	}
    	if(messageList.length == 3 && messageList[0].equals("chatId")) {	// 스플릿한 배열의 길이가 3이고, 0번 인덱스가 chatId일때
    		ArrayList<WebSocketSession> list = chatList.get(messageList[1]);	// 방에 들어있는 소켓 ArrayList를 가져온다.
    		int empId = ((Employee)session.getAttributes().get("loginUser")).getEmpId();	// 보낸사람 아이디 출력
    		for(WebSocketSession sess : list) {									// 그 방에 있는 세션 전체 반복문 실행
    			int otherId = ((Employee)sess.getAttributes().get("loginUser")).getEmpId();	// 받는사람 아이디 출력
    			if(empId == otherId){		// 보낸사람과 받는사람이 아이디가 같으면
    				sess.sendMessage(new TextMessage("나:"+ messageList[2]));	//메세지 출력
    			}else {						// 다르면
    				sess.sendMessage(new TextMessage("상대방:"+ messageList[2]));	// 메세지 출력
    			}
    		}
    	}
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        
//        for(WebSocketSession sess : sessionList){
//        	if(session.getAttributes().get("bId") == null) {	// 방에 안들어왔으면
//        		
//        		if(session.getId().equals(sess.getId())) {		// 보낸사람 id와 보내야되는 사람 id 가 같을때
//        			sess.sendMessage(new TextMessage("나:"+ message.getPayload()));   // 나 : 메세지 내용 출력
//        		}else {											// 다를때
//        			sess.sendMessage(new TextMessage("상대방:"+ message.getPayload()));// 아이디 : 메세지 내용 출력        		
//        		}
//        		
//        	}else {												// 방에 들어왔으면
//        		if(session.getAttributes().get("bId") == sess.getAttributes().get("bId")) {	// 보낸사람 bId와 보내야되는사람 bId가 같을때
//        			if(session.getId().equals(sess.getId())) {
//            			sess.sendMessage(new TextMessage("나:"+ message.getPayload()));   
//            		}else {
//            			sess.sendMessage(new TextMessage("상대방:"+ message.getPayload())); 
//            		}
//        		}
//        		
//        	}
//
//        }

    }

    /**

     * 클라이언트가 연결을 끊었을 때 실행되는 메소드

     */

    @Override

    public void afterConnectionClosed(WebSocketSession session,

            CloseStatus status) throws Exception {
        sessionList.remove(session);
        
        logger.info("{} 연결 끊김", session.getId());

    }

}