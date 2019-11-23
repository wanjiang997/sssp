package com.bonc.sssp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bonc.sssp.entities.ReportCate2;
import com.bonc.sssp.repository.ReportCate2Repository;

@Service
public class ReportCate2Service {
	
	@Autowired
	private ReportCate2Repository reportCate2Repository;
	
	@Transactional(readOnly=true)
	public List<ReportCate2> getAll(){
		return reportCate2Repository.getAll();
	}
}
