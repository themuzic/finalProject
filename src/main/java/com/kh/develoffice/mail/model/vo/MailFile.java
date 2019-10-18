package com.kh.develoffice.mail.model.vo;

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
public class MailFile {
	
	private int fileNum;			// 파일번호
	private String filePath;		// 저장경로
	private String originName;		// 원래 이름
	private String changeName;		// 바뀐 이름
	private Date createDate;		// 저장한 날짜
	private String status;			// 상태(y/n)
	
	
	
	
}
