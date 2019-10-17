package com.kh.develoffice.employee.model.vo;


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
public class Widget {
	
	private int widgetType;		//위젯타입
	private int empId;			//사번
	private int left;			//LEFT좌표
	private int top;			//TOP좌표
	private String fold;		//FOLD여부
	private String status;		//활성화상태

}
