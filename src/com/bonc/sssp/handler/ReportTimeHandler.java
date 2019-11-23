package com.bonc.sssp.handler;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bonc.sssp.entities.ReportTime;
import com.bonc.sssp.service.ReportCate1Service;
import com.bonc.sssp.service.ReportCate2Service;
import com.bonc.sssp.service.ReportTimeService;

@Controller
public class ReportTimeHandler {

	@Autowired
	private ReportTimeService reportTimeService;
	
	@Autowired
	private ReportCate1Service reportCate1Service;
	
	@Autowired
	private ReportCate2Service reportCate2Service;
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/del/{id}",method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id){
		reportTimeService.delete(id);
		return "redirect:/view";
	}
	
	/**
	 * 添加
	 * @param reportTime
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String save(ReportTime reportTime){
		reportTimeService.save(reportTime);
		return "redirect:/view";
	}
	
	/**
	 * 添加前的回显
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Map<String, Object> map){
		map.put("reportCate1", reportCate1Service.getAll());
		map.put("reportCate2", reportCate2Service.getAll());
		map.put("reportTime", new ReportTime());
		return "addReport";
	}
	
	@ModelAttribute
	public void getEmployee(@RequestParam(value = "id", required = false) Integer id,
			Map<String, Object> map) {
		if (id != null) {
			ReportTime reportTime = reportTimeService.getById(id);
			reportTime.setCate1_id(null);
			reportTime.setCate2_id(null);
			map.put("reportTime", reportTime);
		}
	}
	
	@RequestMapping(value="/upd/{id}",method=RequestMethod.PUT)
	public String update(ReportTime reportTime){
		System.out.println(reportTime);
		reportTimeService.save(reportTime);
		return "redirect:/view";
	}
	
	/**
	 * 回显要修改的信息
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/upd/{id}",method=RequestMethod.GET)
	public String getInformation(@PathVariable("id") Integer id,Map<String, Object> map){
		ReportTime reportTime = reportTimeService.getById(id);
		map.put("reportCate1", reportCate1Service.getAll());
		map.put("reportCate2", reportCate2Service.getAll());
		map.put("reportTime", reportTime);
		return "update";
	}
	
	/**
	 * 查看
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/view/{id}",method=RequestMethod.GET)
	public String getById(@PathVariable("id") Integer id,Map<String, Object> map){
		ReportTime reportTime = reportTimeService.getById(id);
		map.put("reportTime", reportTime);
		return "show";
	}
	
	/**
	 * 分页查询
	 * @param pageNoStr
	 * @param map
	 * @return
	 */
	@RequestMapping("/view")
	public String list(@RequestParam(value="pageNo",required=false,defaultValue="1") String pageNoStr,
			Map<String, Object> map){
		int pageNo = 1;
		try {
			//对pageNo
			pageNo = Integer.parseInt(pageNoStr);
			if(pageNo < 1){
				pageNo = 1;
			}
		} catch (Exception e) {
		}
		Page<ReportTime> page = reportTimeService.getPage(pageNo, 5);
		map.put("page", page);
		
		return "list";
	}
}
