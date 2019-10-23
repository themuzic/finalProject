package com.kh.develoffice.chat.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.develoffice.employee.model.vo.Employee;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Chat {
	
	private int chatId;						// 채팅방 번호
	private String chatName;				// 채팅방 이름
	private Date createDate;				// 생성일자 
	private Date modifyDate;				// 갱신일자
	private String lastMsg;					// 마지막 메세지
	private int chatType;					// 단톡인지 아닌지
	private int count;						// 채팅방 인원수
	private int unRead;						// 안읽은 메세지 수
	private ArrayList<Message> profileList;	// 채팅방 프로필 경로들
	

	
	
	
	
}
