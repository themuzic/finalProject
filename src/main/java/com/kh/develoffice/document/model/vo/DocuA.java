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
public class DocuA {
	
	private int docuNum;				//문서번호
	private String accountingType;		//결제타입(개인/법인)
	private int spendingYear;			//회계기준년도
	private int spendingMonth;			//회계기준월
	private String spenderName;			//지출자이름
	private String accountName;			//계정과목(지출내용)
	private String expenseDate;			//지출일자
	private String departmentName;		//지출부서(코스트센터)
	private String price;				//금액
	private String customer;			//거래처
	private String brief;				//적요(사유)
	private String status;				//활성화상태
	
	

}
