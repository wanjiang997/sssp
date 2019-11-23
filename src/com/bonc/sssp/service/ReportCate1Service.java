package com.bonc.sssp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bonc.sssp.entities.ReportCate1;
import com.bonc.sssp.repository.ReportCate1Repository;

@Service
public class ReportCate1Service {
	
	@Autowired
	private ReportCate1Repository reportCate1Repository;
	
	@Transactional(readOnly=true)
	public List<ReportCate1> getAll(){
		return reportCate1Repository.getAll();
	}

}
