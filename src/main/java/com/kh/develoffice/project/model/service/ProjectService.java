package com.kh.develoffice.project.model.service;

import java.util.ArrayList;

import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectMember;
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
	
	// 프로젝트 상세조회
	Project projectDetail(int pNo); 
	
	// 업무 추가
	int insertTask(ProjectTask t);
}
