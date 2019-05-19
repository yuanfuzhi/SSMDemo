package com.yuanfz.service;

import com.yuanfz.dao.UserDao;
import com.yuanfz.model.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	private UserDao userDao;
	public User getUserById(int userId) {
		return userDao.selectByPrimaryKey(userId);
	}


}
