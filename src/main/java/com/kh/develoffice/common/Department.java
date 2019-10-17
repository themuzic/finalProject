package com.kh.develoffice.common;


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
public class Department {
	
	private int deptCode;		//부서코드
	private String deptName;	//부서이름
	private int count;			//부서당 인원수

}
