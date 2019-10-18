package com.kh.develoffice.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.mail.model.vo.Mail;
import com.kh.develoffice.mail.model.vo.PageInfo;

@Repository("mDao")
public class MailDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getlistCount() {
		
		return sqlSession.selectOne("mailMapper.getListCount");
	}
	
	public ArrayList<Mail> receiveMailList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mailMapper.receiveMailList", null, rowBounds);
	}
	
	
	public int insertMail(Mail m) {
		
		return sqlSession.insert("mailMapper.insertMail", m);
	}
	
	public Mail receiveDetail(int mailNum) {
		
		return sqlSession.selectOne("mailMapper.receiveDetail", mailNum);
	}

}
