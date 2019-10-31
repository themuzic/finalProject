package com.kh.develoffice.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectMember;
import com.kh.develoffice.project.model.vo.ProjectTask;

@Repository("pDao")
public class ProjectDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// project 생성
	public int insertProject(Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	// project 생성 시 pm 멤버 테이블에 추가
	public int insertPm(ProjectMember m) {
		return sqlSession.insert("projectMapper.insertPm", m);
	}

	// task 리스트 조회
	public ArrayList<ProjectTask> selectTaskList(int pNo){
		return (ArrayList)sqlSession.selectList("projectMapper.selectTaskList", pNo);
	}
	
	// project 리스트 조회
	public ArrayList<Project> selectPlist(int empId){
		//System.out.println("dao : " + empId);
		ArrayList<Project> list = (ArrayList)sqlSession.selectList("projectMapper.selectPlist", empId);
		//System.out.println(list);
		return list;
	}
	
	//업무 추가
	public int insertTask(ProjectTask t) {
		return sqlSession.insert("projectMapper.insertTask", t);
	}
	
	// 프로젝트 상세 조회
	public Project projectDetail(int pNo) {
		Project p = sqlSession.selectOne("projectMapper.projectDetail", pNo);
		System.out.println("dao : " + p);
		return p;
	}
	
	// 진행상황 수정
	public int updateProgress(int empId) {
		return sqlSession.update("projectMapper.updateProgress", empId);
	}
}
