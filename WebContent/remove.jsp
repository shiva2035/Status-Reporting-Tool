<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
<jsp:setProperty name="Connect" property="*" />
<% 
if((request.getParameter("id")!=null))
{
	boolean stmt = false;
	boolean stmt1 = false;
	out.println(request.getParameter("empnid2b"));
	String querys ="delete from assign_mgr where emp_id ='"+ request.getParameter("id") +"' and sup_id='"+session.getAttribute("uname")+"'";
	stmt = Connect.executeMyStatements(querys);
	if(stmt){
		response.sendRedirect("viewSubord.jsp");
	}
}	
%>