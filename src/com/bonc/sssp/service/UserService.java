package com.bonc.sssp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bonc.sssp.entities.User;
import com.bonc.sssp.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional(readOnly=true)
	public User get(Integer id){
		return userRepository.findOne(id);
	}
	
	@Transactional
	public void save(User user){
		userRepository.saveAndFlush(user);
	}
}
