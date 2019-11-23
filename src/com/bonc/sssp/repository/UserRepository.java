package com.bonc.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bonc.sssp.entities.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
}
