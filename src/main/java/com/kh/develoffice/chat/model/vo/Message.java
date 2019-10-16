package com.kh.develoffice.chat.model.vo;

import java.sql.Date;

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
public class Message {
	
	private int msgId;			// 메세지번호
	private int chatId;			// 채팅방번호
	private String empName;		// 작성자 이름
	private String mContent;	// 작성 내용 or 사진 경로
	private String originName;	// (파일일 경우)원본명
	private String changeName;	// (파일일 경우)수정명
	private String status;		// 삭제 여부
	private Date validity;		// 유효기간
}
