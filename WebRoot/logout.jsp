<%@ page pageEncoding="utf-8"%>
<%
	session.removeAttribute("admin");
	session.invalidate();
	response.sendRedirect("login.jsp");
%>