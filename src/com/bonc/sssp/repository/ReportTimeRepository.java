package com.bonc.sssp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bonc.sssp.entities.ReportTime;
import com.bonc.sssp.entities.User;

public interface ReportTimeRepository extends JpaRepository<ReportTime, Integer> {
	
	@Query("SELECT u FROM User u WHERE u.name= :name AND u.password= :password")
	User login(@Param("name") String name,@Param("password") String password);
}
