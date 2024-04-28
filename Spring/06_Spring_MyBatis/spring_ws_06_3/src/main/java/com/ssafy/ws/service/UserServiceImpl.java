package com.ssafy.ws.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.ws.model.dao.UserDao;
import com.ssafy.ws.model.dto.User;
@Service
public class UserServiceImpl implements UserService{
	
	private final UserDao userdao;
	
	@Autowired
	public UserServiceImpl(UserDao userdao) {
		this.userdao = userdao;
	}
	
	@Override
	public User getUser(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
