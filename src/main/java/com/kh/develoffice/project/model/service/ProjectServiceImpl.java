package com.kh.develoffice.project.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.project.model.dao.ProjectDao;

@Service("pService")
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao pDao;
	
	
}
