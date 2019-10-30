package com.kh.develoffice.schedule.model.service;

import java.util.ArrayList;

import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.schedule.model.vo.Schedule;

public interface ScheduleService {

	int getListCount(Schedule s);

	ArrayList<Schedule> teamScheduleList(PageInfo pi, Schedule s);

	int insertSchedule(Schedule s);

	ArrayList<Schedule> addScheduleList(Schedule s);

	int deleteSchedule(Schedule s);

	int updateSchedule(Schedule s);

}
