package com.kh.develoffice.schedule.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.schedule.model.dao.ScheduleDao;
import com.kh.develoffice.schedule.model.vo.Schedule;

@Service("sService")
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDao sDao;

	@Override
	public int getListCount(Schedule s) {
		return sDao.getListCount(s);
	}

	@Override
	public ArrayList<Schedule> teamScheduleList(PageInfo pi, Schedule s) {
		
		return sDao.teamScheduleList(pi, s);
	}

	@Override
	public int insertSchedule(Schedule s) {
		
		return sDao.insertSchedule(s);
	}

	@Override
	public ArrayList<Schedule> addScheduleList(Schedule s) {
		
		return sDao.addScheduleList(s);
	}

	@Override
	public int deleteSchedule(Schedule s) {
		
		return sDao.deleteSchedule(s);
	}

	@Override
	public int updateSchedule(Schedule s) {
		
		return sDao.updateSchedule(s);
	}

	@Override
	public int movingSchedule(Schedule s) {
		
		return sDao.movingSchedule(s);
	}

	@Override
	public String scheduleType(int sno) {
	
		return sDao.scheduleType(sno);
	}

}
