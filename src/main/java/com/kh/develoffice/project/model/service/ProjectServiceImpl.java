package com.kh.develoffice.project.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.project.model.dao.ProjectDao;
import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectTask;

@Service("pService")
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao pDao;

	// task 리스트 조회
	@Override
	public ArrayList<ProjectTask> selectTaskList(ProjectTask p) {
		return pDao.selectTaskList(p);
	}

	// 프로젝트 리스트 조회
	@Override
	public ArrayList<Project> selectPlist(Project p) {
		return pDao.selectPlist(p);
	}
	
	
}
