package com.kh.develoffice.project.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.develoffice.project.model.dao.ProjectDao;

public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao pDao;
	
	
}
