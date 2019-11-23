package com.bonc.sssp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bonc.sssp.entities.ReportTime;
import com.bonc.sssp.entities.User;
import com.bonc.sssp.repository.ReportTimeRepository;

@Service
public class ReportTimeService {
	
	@Autowired
	private ReportTimeRepository reportTimeRepository;
	
	/**
	 * 删除
	 * @param id
	 */
	@Transactional
	public void delete(Integer id){
		reportTimeRepository.delete(id);
	}
	
	/**
	 * 表单回显
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public ReportTime getById(Integer id){
		return reportTimeRepository.findOne(id);
	}
	
	/**
	 * 添加
	 * @param reportTime
	 */
	@Transactional
	public void save(ReportTime reportTime){
		reportTimeRepository.saveAndFlush(reportTime);
	}
	
	/**
	 * 登录
	 * @param name
	 * @param password
	 * @return
	 */
	@Transactional(readOnly=true)
	public User getByNameAndPassword(String name,String password){
		return reportTimeRepository.login(name, password);
	}
	
	/**
	 * 分页查询
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@Transactional(readOnly=true)
	public Page<ReportTime> getPage(int pageNo, int pageSize){
		PageRequest pageable = new PageRequest(pageNo - 1, pageSize);
		return reportTimeRepository.findAll(pageable);
	}
}
