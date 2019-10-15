package com.kh.develoffice.schedule.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.schedule.model.dao.ScheduleDao;

@Service("sService")
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDao sDao;

}
