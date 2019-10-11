package com.kh.develoffice.document.model.vo;

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
public class DocuB {
	
	private int docuNum;		//문서번호
	private String title;		//문서제목
	private String content;		//문서내용
	private String status;		//활성화상태
	
	
	
	public DocuB(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}
	
}
