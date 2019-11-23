package com.bonc.sssp.handler;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bonc.sssp.entities.User;
import com.bonc.sssp.service.ReportTimeService;
import com.bonc.sssp.service.UserService;

@Controller
public class UserHandler {
	

	@Autowired
	private ReportTimeService reportTimeService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/quit",method=RequestMethod.GET)
	public String quit(HttpServletRequest request){
		request.getSession().invalidate();
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/updatePwd/{id}",method=RequestMethod.PUT)
	public String pwd(User user,Model model){
		User us = userService.get(user.getId());
		if(user.getId() != null){
			if(!user.getPassword().equals(us.getPassword())){
				model.addAttribute("error", "旧密码不正确!");
				return "pwd";
			}else{
				user.setPassword(user.getNewpass());
				userService.save(user);
				return "redirect:/view";
			}
		}
		return null;
	}
	
	@RequestMapping(value="/find/{id}",method=RequestMethod.GET)
	public String get(@PathVariable("id") Integer id,Map<String, Object> map,Model model){
		if(id == null || id.equals("")){
			model.addAttribute("error", "你还没有登录，请先登录!");
			return "redirect:/index";
		}else {
			map.put("user", userService.get(id));
			return "pwd";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/validateVerifyCode",method=RequestMethod.POST)
	public String validateVerifyCode(@RequestParam(value="verifyCode",required=true) String verifyCode,
			HttpServletRequest req){
		if(verifyCode != null){
			String vcode = (String) req.getSession().getAttribute("vCode");
			boolean bool = verifyCode.equalsIgnoreCase(vcode);
			if(bool == true){
				return "0";
			}else {
				return "1";
			}
		}
		return null;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String getByNameAndPassword(@RequestParam(value="name",required=true) String name,
				@RequestParam(value="password",required=true) String password,Model model,
				HttpServletRequest req,HttpServletResponse resp){
		User user = reportTimeService.getByNameAndPassword(name, password);
		if(user == null){
			model.addAttribute("error", "该用户不存在或密码错?");
			return "forward:/index.jsp";
		}else {
			req.getSession().setAttribute("sessionUser", user);
			String loginname = user.getName();
			Cookie cookie = new Cookie("loginname", loginname);
			cookie.setMaxAge(60 * 60 * 24 * 365);// 保存一年
			resp.addCookie(cookie);
			return "main";
		}
	}

}
