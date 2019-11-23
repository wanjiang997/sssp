package com.bonc.sssp.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;

import com.bonc.sssp.entities.ReportCate1;

public interface ReportCate1Repository extends JpaRepository<ReportCate1, Integer> {

	@QueryHints({@QueryHint(name=org.hibernate.ejb.QueryHints.HINT_CACHEABLE,value="true")})
	@Query("FROM ReportCate1 r")
	List<ReportCate1> getAll();
}
