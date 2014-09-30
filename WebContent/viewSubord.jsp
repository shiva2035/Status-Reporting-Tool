<%@include file="header.jsp" %>
<%@include file="checkEmpAccess.jsp" %>
<%@page import ="java.sql.*" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import = "in.rgukt.Connector" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">List of Subordinates</h3>
		</div>
		<div class="panel-body">
		<table class="table table-bordered" style="{margin-left:75;margin-right:75;}">
		<tr><th width=80>Sl. No</th><th width=100>Emp ID</th><th width="300">Emp Name</th><th width=200>Add Remark</th><th width=200>View Profile</th><th width=200>Status</th></tr>
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		<%
			int sl=0;
			String superior = session.getAttribute("uname").toString();
			String query = "select * from users where emp_id in (select emp_id from assign_mgr where sup_id='"+ session.getAttribute("uname")+"' group by emp_id)";
			ResultSet rSet= Connect.executeMyQuery(query);
			while(rSet.next()){
				sl++;
				%>
	<tr><td width=80><%=sl %></td><td width=100><% out.println(rSet.getString("emp_id")); %></td><td width="300"><% out.println(rSet.getString("name")+" ("+ rSet.getString("position")+")"); %></td><td width=200><a href="addRemark.jsp?to=<% out.println(rSet.getString("emp_id")); %>">Add Remark</a></td><td width=200><a href="viewProfile.jsp?id=<% out.println(rSet.getString("emp_id")); %>">View Profile</a></td><td><a href="remove.jsp?id=<% out.println(rSet.getString("emp_id"));%>">Remove</a></td></tr>
				<%
			}
		%>
		</table>
		</div>
</div>
<%@include file="footer.jsp" %>