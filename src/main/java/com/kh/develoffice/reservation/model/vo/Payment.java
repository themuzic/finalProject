package com.kh.develoffice.reservation.model.vo;

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
public class Payment {
	
	private String payNum;		//결제번호
	private int empId;			//결제한직원ID
	private int price;			//결제가격
	private String product;		//결제한상품
	private int quantity;		//결제한수량
	private Date payDate;		//결제일시

}
