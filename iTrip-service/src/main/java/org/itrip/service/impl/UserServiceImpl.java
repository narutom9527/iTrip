package org.itrip.service.impl;

import java.util.List;

import org.itrip.mapper.UserMapper;
import org.itrip.pojo.User;
import org.itrip.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
	@Override
	@Cacheable(value="getAll",keyGenerator = "customKeyGenerator")
	public List<User> getAll() {
		return userMapper.getAll();
	}
	
	@Override
	@Cacheable(value="login",keyGenerator = "customKeyGenerator")
	public User login(User user) {
		return userMapper.login(user);
	}
}
