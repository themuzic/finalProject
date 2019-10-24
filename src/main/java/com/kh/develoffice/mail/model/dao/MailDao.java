package com.kh.develoffice.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.mail.model.vo.Mail;
import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.mail.model.vo.SearchCondition;

@Repository("mDao")
public class MailDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getlistCount(Mail m) {
		
		return sqlSession.selectOne("mailMapper.getListCount", m);
	}
	
	public ArrayList<Mail> receiveMailList(PageInfo pi, Mail m){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.receiveMailList", m, rowBounds);
	}
	
	public ArrayList<Mail> sendMailList(PageInfo pi, Mail m){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.sendMailList", m, rowBounds);
	}
	
	public ArrayList<Mail> deleteMailList(PageInfo pi, Employee e){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.deleteMailList", e, rowBounds);
	}
	
	
	public int insertMail(Mail m) {
		
		return sqlSession.insert("mailMapper.insertMail", m);
	}
	
	public Mail receiveDetail(int mailNum) {
		
		return sqlSession.selectOne("mailMapper.receiveDetail", mailNum);
	}
	
	public int getSearchListCount(Mail m) {
		
		return sqlSession.selectOne("mailMapper.selectSearchCount", m);
	}
	
	public ArrayList<Mail> selectSearchList(Mail m, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSearchList", m, rowBounds);
	}
	
	public ArrayList<Mail> deleteSearchList(Mail m, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.deleteSearchList", m, rowBounds);
	}
	
	public int updateMail(Mail m) {
		
		return sqlSession.update("mailMapper.updateMail", m);
	}
	
	public int deleteMail(Mail m) {
		
		return sqlSession.delete("mailMapper.deleteMail", m);
	}
	
	public Mail selectMail(int mailNum) {
		
		return sqlSession.selectOne("mailMapper.receiveDetail", mailNum);
	}
	
	public int selectEmpId(String toEmail) {
		if(sqlSession.selectOne("mailMapper.selectEmpId", toEmail) == null) {
		
			return 0;
			
		}else {
			
			return sqlSession.selectOne("mailMapper.selectEmpId", toEmail);
		}
	}

	public int insertStatusMail(int empId) {
		
		return sqlSession.insert("mailMapper.insertStatusMail", empId);
	}

	public int restoreMail(Mail m) {
		
		return sqlSession.update("mailMapper.restoreMail", m);
	}


}
