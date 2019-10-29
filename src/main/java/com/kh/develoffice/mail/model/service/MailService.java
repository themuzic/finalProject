package com.kh.develoffice.mail.model.service;

import java.util.ArrayList;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.mail.model.vo.Mail;
import com.kh.develoffice.mail.model.vo.PageInfo;

public interface MailService {
	
	int getListCount(Mail m);
	
	// 받은 메일함
	ArrayList<Mail> receiveMailList(PageInfo pi, Mail m);
	
	// 보낸 메일함
	ArrayList<Mail> sendMailList(PageInfo pi, Mail m);
	
	// 휴지통
	ArrayList<Mail> deleteMailList(PageInfo pi, Employee e);
	
	// 메일 보내기
	int insertMail(Mail m);
	
	// 메일함 상세페이지
	Mail receiveDetail(Mail m);
	
	// 검색처리 리스트 불러오기
	int getSearchListCount(Mail m);
	
	// 검색처리 게시글 불러오기
	ArrayList<Mail> selectSearchList(Mail m, PageInfo pi);
	
	// 검색처리 휴지통 게시글 불러오기
	ArrayList<Mail> deleteSearchList(Mail m, PageInfo pi);
	
	// 단순히 메일만 조회
	Mail selectMail(int mailNum);
	
	// 메일 완전히 삭제
	int deleteMail(Mail m);
	
	// 메일 이동
	int updateMail(Mail m);

	int selectEmpId(String email);

	int insertStatusMail(int empId);
	
	int restoreMail(Mail m);
	
	// 중요 메일함으로 엡데이트
	int updateImportant(Mail m);
	
	// 중요 메일함 셀렉
	ArrayList<Mail> importantMailList(PageInfo pi, Employee e);
	
	// 증요 메일함 검색
	ArrayList<Mail> importantSearchList(Mail m, PageInfo pi);
	
	// 해당 계정의 전체 메일 불러오기
	ArrayList<Mail> selectMyMail(Employee loginUser);
	

}
