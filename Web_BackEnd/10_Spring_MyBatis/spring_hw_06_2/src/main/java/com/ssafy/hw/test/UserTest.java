package com.ssafy.hw.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.ssafy.hw.model.dao.UserDao;
import com.ssafy.hw.model.dto.User;

public class UserTest {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		UserDao user = context.getBean(UserDao.class);
		user.insert(new User("sadf","asdf","adsf","asdf",123));
		List<User> users = user.selectAll();
		for(User u:users) {
			System.out.println(u);
		}
	}
}
