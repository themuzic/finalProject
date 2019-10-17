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
public class Job {
	
	private int jobCode;		// 직급코드
	private String jobName;		// 직급이름

}
