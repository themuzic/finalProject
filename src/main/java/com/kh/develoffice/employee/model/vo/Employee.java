package com.kh.develoffice.employee.model.vo;

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
public class Employee {
	
	private int empId;			//사번
	private String empName;		//이름
	private String empPwd;		//비밀번호
	private String gender;		//성별
	private Date birth;		//생년월일(yyyymmdd)
	private int deptCode;		//부서코드
	private String deptName;	//부서이름
	private int jobCode;		//직급코드
	private String jobName;		//직급이름
	private String phone;		//휴대폰번호
	private String email;		//이메일
	private String address;		//주소
	private int salary;			//기본급
	private String account;		//급여계좌
	private int star;			//별갯수
	private Date enrollDate;	//입사날짜
	private Date retireDate;	//퇴사날짜
	private String empStatus;	//상태(y/n)
	private String profilePath; //프사경로
	
	
	
	public Employee(String empName, String gender, Date birth, int deptCode, int jobCode, String phone, String email,
			String address, int salary, String account) {
		super();
		this.empName = empName;
		this.gender = gender;
		this.birth = birth;
		this.deptCode = deptCode;
		this.jobCode = jobCode;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.salary = salary;
		this.account = account;
	}
	
	
	
	

}
