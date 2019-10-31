package com.kh.develoffice.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.kh.develoffice.chat.model.service.ChatService;
import com.kh.develoffice.chat.model.vo.Chat;
import com.kh.develoffice.chat.model.vo.Message;
import com.kh.develoffice.employee.model.vo.Employee;

@Controller("cController")
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@RequestMapping("chat.do")
	public ModelAndView chatMainPage(ModelAndView mv, HttpSession session) {
		int empId = ((Employee)session.getAttribute("loginUser")).getEmpId();
		
		ArrayList<Employee> empList = cService.selectEmpList();
		
		
		for(int i=0; i<empList.size(); i++) {
			if(empId == empList.get(i).getEmpId()) {
				empList.remove(i);
				break;
			}
		}
		
		String test = new Gson().toJson(empList);
		mv.addObject("empList", empList).addObject("test", test);
		mv.setViewName("chat/chatMainView");
		return mv;
	}
	
	@RequestMapping("chatList.do")
	public ModelAndView chatListView(ModelAndView mv, HttpSession session) {
		int empId = ((Employee)session.getAttribute("loginUser")).getEmpId();
		
		ArrayList<Chat> chatList = cService.selectChatList(empId);
		ArrayList<Message> chatProfileList = cService.selectChatProfile(empId);
		for(Chat c:chatList) {
			ArrayList<Message> profile = new ArrayList<>();
			for(Message m:chatProfileList) {
				if(c.getChatId() == m.getChatId()) {
					profile.add(m);
				}
			}
			c.setProfileList(profile);
			
		}
		
		String test = new Gson().toJson(chatList);
		
		mv.addObject("chatList", chatList).addObject("test",test).setViewName("chat/chatListView");
		
		return mv;
	}
	
	@RequestMapping("refresh.do")
	public void refresh(int empId, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Chat> chatList = cService.selectChatList(empId);
		
		ArrayList<Message> chatProfileList = cService.selectChatProfile(empId);
		for(Chat c:chatList) {
			ArrayList<Message> profile = new ArrayList<>();
			for(Message m:chatProfileList) {
				if(c.getChatId() == m.getChatId()) {
					profile.add(m);
				}
			}
			c.setProfileList(profile);
		}
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(chatList, response.getWriter());
		
	}
	@RequestMapping("chatting.do")
	public ModelAndView chattingList(ModelAndView mv, HttpSession session, Chat c) {
		int empId = ((Employee)session.getAttribute("loginUser")).getEmpId();
		c.setEmpId(empId);
		c.setAlarm(cService.selectAlarm(c));
		
		ArrayList<Message> msgList = cService.selectMsgList(c);
		
		mv.addObject("msgList", msgList).addObject("c", c).setViewName("chat/chattingView");
		
		return mv;
	}
	
	@RequestMapping("chatStatus.do")
	public void chatStatus(HttpServletResponse response, int empId, int otherId) throws JsonIOException, IOException {
		Message m = new Message();
		m.setEmpId(empId);
		m.setChatId(otherId);
		m.setMsgType(1);
		Chat c = new Chat();
		int count = cService.getChatStatus(m);
		if(count == 0) {	// 채팅방이 없으면
			// 채팅방 생성하고 채팅방 번호랑 이름 ,타입 반환
			c = insertChat(m);					// 채팅방 생성하고 내 채팅방 번호, 이름, 타입 조회
		}else {		// 채팅방이 이미 있으면
			Message other = new Message();
			other.setEmpId(otherId);
			other.setChatId(empId);
			other.setMsgType(1);
			// 상대 채팅방 번호와 채팅방 이름 리턴
			Chat otherChat = cService.selectChatId(other);
			otherChat.setEmpId(otherId);
			// 내 채팅방 번호와 채팅방 이름 리턴
			c = cService.selectChatId(m);		// 내 채팅방 번호, 이름, 타입 조회
			c.setEmpId(empId);
			if(otherChat.getChatStatus().equals("N")) {
				int result = cService.updateChatStatus(otherChat);
			}else if(c.getChatStatus().equals("N")) {
				int result = cService.updateChatStatus(c);
			}
		}
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(c, response.getWriter());
	}
	
	
	public Chat insertChat(Message m) {
		// 채팅방 생성
		int type= m.getMsgType();
		int result = cService.insertChat(type);
		
		// 만들어진 채팅방, 채팅방 이름 반환할 Chat 객체 생성
		Chat c = new Chat();
		c.setEmpId(m.getEmpId());
		c.setChatType(type);
		c.setChatId(cService.selectNewChatId());
		if(result > 0) {
			// 채팅방 사람들 테이블에 생성
			int empId = m.getEmpId();		// 내 사번
			int otherId = m.getChatId();	// 상대 사번
			Chat myChat = new Chat();
			myChat.setEmpId(empId);
			myChat.setChatName(cService.selectChatName(otherId));			// 내 사번과 내 채팅방 이름 담음
			
			Chat otherChat = new Chat();
			otherChat.setEmpId(m.getChatId());
			otherChat.setChatName(cService.selectChatName(empId));	// 상대 사번과 상대 채팅방 이름 담음
			
			int myResult = cService.insertJoinChat(myChat);			// 나에 대한 채팅방 인원 등록
			int otherResult = cService.insertJoinChat(otherChat);	// 상대에 대한 채팅방 인원 등록
			
			if(myResult > 0 && otherResult > 0) {
				c = cService.selectUserChatName(c);			// 내 채팅방 번호, 이름 조회
			}
		}
		return c;
	}
	
	@RequestMapping("inviteList.do")
	public void selectInviteList(HttpServletResponse response, int chatId ) throws JsonIOException, IOException {
		ArrayList<Employee> inviteList = cService.selectInviteList(chatId);
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(inviteList, response.getWriter());
	}
	
	@ResponseBody
	@RequestMapping("updateAlarm.do")
	public String updateAlarm(HttpServletResponse response, Chat c) {
		int result = cService.updateAlarm(c);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("alarm.do")
	public ModelAndView alarmModal(ModelAndView mv, Chat c) {
		
		mv.addObject("c", c).setViewName("chat/alarm");
		return mv;
	}
	
	@RequestMapping("empListSearch.do")
	public void searchEmpList(String search, int empId, HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Employee> empList = cService.searchEmpList(search);
		for(int i=0; i<empList.size(); i++) {
			if(empList.get(i).getEmpId() == empId) {
				empList.remove(i);
				break;
			}
		}
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		gson.toJson(empList, response.getWriter());
	}
	
	@RequestMapping("chatListSearch.do")
	public void searchChatList(String search, int empId, HttpServletResponse response) throws JsonIOException, IOException {
		Chat searchList = new Chat();
		searchList.setEmpId(empId);
		searchList.setChatName(search);
		ArrayList<Chat> chatList = cService.searchChatList(searchList);
		ArrayList<Message> chatProfileList = cService.selectChatProfile(empId);
		for(Chat c:chatList) {
			ArrayList<Message> profile = new ArrayList<>();
			for(Message m:chatProfileList) {
				if(c.getChatId() == m.getChatId()) {
					profile.add(m);
				}
			}
			c.setProfileList(profile);
		}
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(chatList, response.getWriter());
	}
	
	@ResponseBody
	@RequestMapping("chatRename.do")
	public String renameChat(Chat c, HttpServletResponse response) {
		int result = cService.updateChatName(c);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="chatRenameReturn.do", produces="text/html; charset=utf-8")
	public String returnChatName(Chat c, HttpServletResponse response) {
		ArrayList<String> chatNameList = cService.selectChatNameList(c.getChatId());	// 채팅방 이름 설정할 arraylist
		
		Collections.sort(chatNameList);		// 오름차순 정렬
		
		String chatName = String.join(", ", chatNameList);	// 채팅방 이름 설정
		
		c.setChatName(chatName);
		
		int result = cService.updateChatNameReturn(c);
	//response.setContentType("text/html; charset=utf-8");
		
//		JsonObject json = new JsonObject();
//		json.add("chatName", chatName);
		if(result > 0) {
			return chatName;
		}else {
			return "fail";
		}
	}
}
