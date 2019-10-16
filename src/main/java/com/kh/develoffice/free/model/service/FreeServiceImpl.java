package com.kh.develoffice.free.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.free.model.dao.FreeDao;

@Service("fService")
public class FreeServiceImpl implements FreeService{

	@Autowired
	private FreeDao fDao;
	
}
