package com.kh.develoffice.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.chat.model.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
	
	@RequestMapping("chat.do")
	public ModelAndView chatMainPage(ModelAndView mv) {
		
		mv.setViewName("chat/chatMainView");
		return mv;
	}
}
