package com.kh.develoffice.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.chat.model.vo.Chat;

@Repository("cDao")
public class ChatDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Chat> selectChatList(int empId) {
		
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList", empId);
		
	}
	
}
