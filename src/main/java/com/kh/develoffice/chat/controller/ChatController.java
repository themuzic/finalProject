package com.kh.develoffice.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.chat.model.service.ChatService;
import com.kh.develoffice.chat.model.vo.Chat;
import com.kh.develoffice.chat.model.vo.Message;
import com.kh.develoffice.employee.model.vo.Employee;

@Controller
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
		mv.addObject("empList", empList);
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
		
		mv.addObject("chatList", chatList).setViewName("chat/chatListView");
		
		return mv;
	}
	@RequestMapping("chatting.do")
	public ModelAndView chattingList(ModelAndView mv, int chatId, String chatName) {
		
		ArrayList<Message> msgList = cService.selectMsgList(chatId);
		Chat c = new Chat();
		c.setChatId(chatId);
		c.setChatName(chatName);
		
		mv.addObject("msgList", msgList).addObject("c", c).setViewName("chat/chattingView");
		
		return mv;
	}
}
