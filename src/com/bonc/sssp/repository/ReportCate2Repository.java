package com.bonc.sssp.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;

import com.bonc.sssp.entities.ReportCate2;

public interface ReportCate2Repository extends JpaRepository<ReportCate2, Integer> {

	@QueryHints({@QueryHint(name=org.hibernate.ejb.QueryHints.HINT_CACHEABLE,value="true")})
	@Query("FROM ReportCate2 r")
	List<ReportCate2> getAll();
}
