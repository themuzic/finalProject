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
	
	public int getlistCount() {
		
		return sqlSession.selectOne("mailMapper.getListCount");
	}
	
	public ArrayList<Mail> receiveMailList(PageInfo pi, Employee e){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.receiveMailList", e, rowBounds);
	}
	
	public ArrayList<Mail> sendMailList(PageInfo pi, Employee e){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.sendMailList", e, rowBounds);
	}
	
	public ArrayList<Mail> deleteMailList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.deleteMailList", null, rowBounds);
	}
	
	
	public int insertMail(Mail m) {
		
		return sqlSession.insert("mailMapper.insertMail", m);
	}
	
	public Mail receiveDetail(int mailNum) {
		
		return sqlSession.selectOne("mailMapper.receiveDetail", mailNum);
	}
	
	public int getSearchListCount(SearchCondition sc) {
		
		return sqlSession.selectOne("mailMapper.selectSearchCount", sc);
	}
	
	public ArrayList<Mail> selectSearchList(SearchCondition sc, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSearchList", sc, rowBounds);
	}
	
	public int updateMail(int mailNum) {
		
		return sqlSession.update("mailMapper.updateMail", mailNum);
	}
	
	public int deleteMail(int mailNum) {
		
		return sqlSession.delete("mailMapper.deleteMail", mailNum);
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


}
