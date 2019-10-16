package com.kh.develoffice.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.develoffice.chat.model.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService cService;
}
