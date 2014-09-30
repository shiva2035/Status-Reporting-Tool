<%
if((session.getAttribute("uname")==null)||(session.getAttribute("utype").equals("employee"))){
	response.sendRedirect("error.jsp");
}
%>