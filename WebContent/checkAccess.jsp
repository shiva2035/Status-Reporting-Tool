<%
if(session.getAttribute("uname")==null){
	response.sendRedirect("error.jsp");
}
%>