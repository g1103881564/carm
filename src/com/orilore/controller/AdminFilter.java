package com.orilore.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.orilore.model.Admin;

public class AdminFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest rq, ServletResponse rp,
			FilterChain fc) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)rq;
		HttpServletResponse response = (HttpServletResponse)rp;
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin!=null && admin.getId()>0){
			fc.doFilter(rq, rp);
		}else{
			response.sendRedirect("../login.jsp");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
}
