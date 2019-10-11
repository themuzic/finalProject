package com.kh.develoffice.document.model.vo;

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
public class DocumentFile {
	
	private int fileNo;
	private int docuNum;
	private String filePath;
	private String originName;
	private String changeName;
	private Date createDate;
	private String status;
	
	
	public DocumentFile(String filePath, String originName, String changeName, Date createDate) {
		super();
		this.filePath = filePath;
		this.originName = originName;
		this.changeName = changeName;
		this.createDate = createDate;
	}
	
	
	
	
}
