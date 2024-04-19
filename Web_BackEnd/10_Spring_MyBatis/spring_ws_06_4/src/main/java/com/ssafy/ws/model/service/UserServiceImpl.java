package com.ssafy.ws.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ws.model.dao.UserDao;
import com.ssafy.ws.model.dto.User;
@Service
public class UserServiceImpl implements UserService {
	private final UserDao uDao;
	@Autowired
	public UserServiceImpl(UserDao uDao) {
		this.uDao = uDao;
	}
	@Override
	public User getUser(String id) {
		// TODO Auto-generated method stub
		return uDao.getUserById(id);
	}

}
