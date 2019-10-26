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
public class Vacation {
	
	private int docuNum;
	private String vacationType;
	private String vacationName;
	private String startDate;
	private String endDate;
	private String reason;
	private double useDay;

}
