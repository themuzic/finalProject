package com.kh.develoffice.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.free.model.vo.FreeReply;
import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectMember;
import com.kh.develoffice.project.model.vo.ProjectReply;
import com.kh.develoffice.project.model.vo.ProjectTask;

@Repository("pDao")
public class ProjectDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// project 생성
	public int insertProject(Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}
	
	// project 생성 시 멤버 테이블에 추가
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
	
	// 프로젝트 멤버 리스트 조회
	public ArrayList<ProjectMember> selectMlist(){
		return (ArrayList)sqlSession.selectList("projectMapper.selectMlist");
	}
	
	//업무 추가
	public int insertTask(ProjectTask t) {
		return sqlSession.insert("projectMapper.insertTask", t);
	}
	
	// 프로젝트 상세 조회
	public Project projectDetail(int pNo) {
		Project p = sqlSession.selectOne("projectMapper.projectDetail", pNo);
		//System.out.println("dao : " + p);
		return p;
	}
	
	// 내가 포함된 프로젝트 갯수 조회
	public int countProject(int empId) {
		return sqlSession.selectOne("projectMapper.countProject", empId);
	}
	
	// 진행상황 수정
	public int updateProgress(Project p) {
		return sqlSession.update("projectMapper.updateProgress", p);
	}
	
	// 프로젝트 멤버 추가
	public int insertMem(String[] empIds, int pNo) {

		int result = 0;
				
		for(int i=0; i<empIds.length; i++) {
			System.out.println(pNo + ", dao: " + empIds[i]);
	
			ProjectMember mem = new ProjectMember(pNo, Integer.parseInt(empIds[i]));
			result = sqlSession.insert("projectMapper.insertMem", mem);
		}
		return result;
	}
	
	// task 상세 조회
	public ProjectTask taskDetail(int taskNo) {
		return sqlSession.selectOne("projectMapper.taskDetail", taskNo);
	}
	
	// task 수정
	public int updateTask(ProjectTask p) {
		return sqlSession.update("projectMapper.updateTask", p);
	}
	
	// task 삭제
	public int deleteTask(int taskNo) {
		return sqlSession.update("projectMapper.deleteTask", taskNo);
	}
	
	// task에 딸려있는 댓글 리스트 조회
	public ArrayList<ProjectReply> selectReplyList(int taskNo){
		return (ArrayList)sqlSession.selectList("projectMapper.selectReplyList", taskNo);
	}
	
	// task 댓글 작성하기
	public int insertReply(ProjectReply r) {
		//System.out.println(r.gettRContent());
		return sqlSession.insert("projectMapper.insertReply", r);
	}
	
	// 댓글 수정
	public int rupdate(ProjectReply r) {
		System.out.println("dao-rId : " + r.gettRId());
		System.out.println("dao-taskNo : " + r.getTaskNo());
		System.out.println(r.gettRContent());
		return sqlSession.update("projectMapper.rupdate", r);
	}

	// 댓글 삭제
	public int rdelete(ProjectReply r) {
		System.out.println("tRId : " + r.gettRId());
		System.out.println("taskNo : " + r.getTaskNo());
		return sqlSession.update("projectMapper.rdelete", r);
	}
}
