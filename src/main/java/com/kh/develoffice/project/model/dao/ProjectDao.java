package com.kh.develoffice.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectTask;

@Repository("pDao")
public class ProjectDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// task 리스트 조회
	public ArrayList<ProjectTask> selectTaskList(ProjectTask p){
		return (ArrayList)sqlSession.selectList("projectMapper.selectTaskList",p);
	}
	
	// project 리스트 조회
	public ArrayList<Project> selectPlist(Project p){
		return (ArrayList)sqlSession.selectList("projectMapper.selectPlist", p);
	}
}
