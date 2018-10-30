package com.orilore.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.IAdminBiz;
import com.orilore.model.Admin;
import com.orilore.util.MD5;

@Controller
public class CtrAdmin {
	@Resource
	private IAdminBiz biz;
	
	@RequestMapping("/admin/check/{code}")
	public @ResponseBody boolean check(@PathVariable("code") String code,HttpSession session){
		String vcode = (String)session.getAttribute("vcode");
		if(vcode!=null && code!=null && code.toLowerCase().equals(vcode.toLowerCase())){
			return true;
		}else{
			return false;
		}
	}
	
	@RequestMapping("/admin/login")
	public @ResponseBody Admin login(Admin bean,HttpSession session){
		if(bean!=null){
			String vcode = ((String)session.getAttribute("vcode"));
			String code = bean.getCode();
			if(vcode!=null && code!=null){
				vcode = vcode.toLowerCase();
				code  = code.toLowerCase();
				if(vcode.equals(code)){
					String pwd = bean.getPassword();
					bean.setPassword(MD5.getMd5(pwd));
					Admin admin = biz.getAdmin(bean);
					if(admin!=null && admin.getId()>0){
						session.setAttribute("admin", admin);
					}
					return admin; 
				}else{
					return null;
				}
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	
	@RequestMapping("/pages/admin/update")
	public @ResponseBody boolean update(HttpServletRequest request){
		String ypwd = request.getParameter("ypwd");
		String npwd = request.getParameter("npwd");
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		boolean flog = false;
		if(ypwd!=null && npwd!=null && admin.getPassword().equals(MD5.getMd5(ypwd))){
			admin.setPassword(MD5.getMd5(npwd));
			flog = biz.modifyAdmin(admin);
			if(flog){
				session.setAttribute("admin", admin);
			}
		}
		return flog;
	}
}
