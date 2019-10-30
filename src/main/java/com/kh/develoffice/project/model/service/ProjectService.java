package com.kh.develoffice.project.model.service;

import java.util.ArrayList;

import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectTask;

public interface ProjectService {

	// Task 리스트 조회
	ArrayList<ProjectTask> selectTaskList(ProjectTask p);
	
	// project 리스트 조회
	ArrayList<Project> selectPlist(Project p);
}
