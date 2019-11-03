package com.kh.develoffice.project.model.service;

import java.util.ArrayList;

import com.kh.develoffice.free.model.vo.FreeReply;
import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectMember;
import com.kh.develoffice.project.model.vo.ProjectReply;
import com.kh.develoffice.project.model.vo.ProjectTask;

public interface ProjectService {

	// 프로젝트 생성
	int insertProject(Project p);
	
	// 프로젝트 생성 시 pm 멤버 테이블에 추가
	int insertPm(ProjectMember m);
	
	// Task 리스트 조회
	ArrayList<ProjectTask> selectTaskList(int pNo);
	
	// project 리스트 조회
	ArrayList<Project> selectPlist(int empId);
	
	// projectMember 리스트 조회
	ArrayList<ProjectMember> selectMlist();
	
	// 내가 포함된 project 갯수 조회
	int countProject(int empId);
	
	// 프로젝트 상세조회
	Project projectDetail(int pNo); 
	
	// 업무 추가
	int insertTask(ProjectTask t);
	
	// 진행상황 수정
	int updateProgress(Project p);
	
	// 프로젝트 멤버 추가하기
	int insertMem(String[] empIds, int pNo);
	
	// task 상세 조회
	ProjectTask taskDetail(int taskNo);
	
	// task 수정
	int updateTask(ProjectTask p);
	
	// task 삭제
	int deleteTask(int taskNo);
	
	// task에 딸려있는 댓글 리스트 조회
	ArrayList<ProjectReply> selectReplyList(int taskNo);
	
	// task 댓글 작성하기
	int insertReply(ProjectReply r);

	// 댓글 수정하기
	int rupdate(ProjectReply r);
	
	// 댓글 삭제하기
	int rdelete(ProjectReply r);
}
