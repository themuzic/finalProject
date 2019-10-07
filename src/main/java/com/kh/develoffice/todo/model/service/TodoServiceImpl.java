package com.kh.develoffice.todo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.todo.model.dao.TodoDao;

@Service("tService")
public class TodoServiceImpl implements TodoService {

	@Autowired
	private TodoDao tDao;
}
