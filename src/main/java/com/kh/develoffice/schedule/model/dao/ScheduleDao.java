package com.kh.develoffice.schedule.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.schedule.model.vo.Schedule;

@Repository("sDao")
public class ScheduleDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(Schedule s) {
		
		return sqlSession.selectOne("scheduleMapper.getListCount", s);
	}

	public ArrayList<Schedule> teamScheduleList(PageInfo pi, Schedule s) {
	
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("scheduleMapper.teamScheduleList",s, rowBounds);
	}

	public int insertSchedule(Schedule s) {
		
		return sqlSession.insert("scheduleMapper.insertSchedule", s);
	}

	public ArrayList<Schedule> addScheduleList(Schedule s) {
		
		return (ArrayList)sqlSession.selectList("scheduleMapper.teamScheduleList",s);
	}

	public int deleteSchedule(Schedule s) {
		
		return sqlSession.update("scheduleMapper.deleteSchedule", s);
	
	}

	public int updateSchedule(Schedule s) {
		
		return sqlSession.update("scheduleMapper.updateSchedule", s);
	}
		
	

}
