package com.kh.develoffice.project.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.project.model.dao.ProjectDao;
import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectMember;
import com.kh.develoffice.project.model.vo.ProjectReply;
import com.kh.develoffice.project.model.vo.ProjectTask;

@Service("pService")
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDao pDao;
	
	// project 생성
	@Override
	public int insertProject(Project p) {
		return pDao.insertProject(p);
	}
	
	// project 생성 시 pm 멤버 테이블에 추가
	@Override
	public int insertPm(ProjectMember m) {
		return pDao.insertPm(m);
	}

	// task 리스트 조회
	@Override
	public ArrayList<ProjectTask> selectTaskList(int pNo) {
		return pDao.selectTaskList(pNo);
	}

	// 프로젝트 리스트 조회
	@Override
	public ArrayList<Project> selectPlist(int empId) {
		return pDao.selectPlist(empId);
	}
	
	// 프로젝트멤버 리스트 조회
	@Override
	public ArrayList<ProjectMember> selectMlist() {
		return pDao.selectMlist();
	}

	// 업무 추가
	@Override
	public int insertTask(ProjectTask t) {
		return pDao.insertTask(t);
	}

	// 프로젝트 상세 조회
	@Override
	public Project projectDetail(int pNo) {
		return pDao.projectDetail(pNo);
	}

	// 진행상황 수정
	@Override
	public int updateProgress(Project p) {
		return pDao.updateProgress(p);
	}

	// 프로젝트 멤버 추가하기
	@Override
	public int insertMem(String[] empIds, int pNo) {
		/*for(int i = 0; i < empIds.length; i++) {
			System.out.println("service: " + empIds[i]);
		}*/
		return pDao.insertMem(empIds, pNo);
	}

	// task 상세 조회
	@Override
	public ProjectTask taskDetail(int taskNo) {
		return pDao.taskDetail(taskNo);
	}

	// task에 딸려있는 댓글 리스트 조회
	@Override
	public ArrayList<ProjectReply> selectReplyList(int taskNo) {
		return pDao.selectReplyList(taskNo);
	}

	// task 댓글 작성하기
	@Override
	public int insertReply(ProjectReply r) {
		return pDao.insertReply(r);
	}

	

	

	
	
	
}
