<%@include file="header.jsp" %>
<%@include file="checkEmpAccess.jsp" %>
<%@ page import ="java.util.*" %>

<%@page import ="java.sql.*" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import = "in.rgukt.Connector" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">View Reports</h3>
		</div>
		<div class="panel-body">
		<table class="panel panel-body" style="margin-left:-15">
		<tr>
		<td><div class="panel panel-body">
		<fieldset class="panel-body"><legend>View All by Date</legend>
		<form action="" method="post">
		<table><tr><td><input type="date" name="dt0" class="input-sm" required/></td><td><input type="submit" name="submit-viewall" value="Go" class="btn btn-info"/></td></tr></table>
		</form>
		</fieldset>
		</div></td>
		<td><div class="panel panel-body">
		<fieldset class="panel-body"><legend>View Single By Date</legend>
		<form action="" method="post">
		<table>
		<tr><td width="150">Emp ID:</td><td width="150"><input type="email" name="empid1" placeholder="Enter Employee ID" required class="input-sm"/></td></tr>
		<tr><td width="150">Date:</td><td width="150"><input type="date" name="dt1" class="input-sm" required/></td><td><input type="submit" name="submit-viewall" value="Go" class="btn btn-info"/></td></tr>
		</table>
		</form>
		</fieldset>
		</div></td>
		<td><div class="panel panel-body">
		<fieldset class="panel-body"><legend>By Time Period</legend>
		<form action="" method="post">
		<table>
		<tr><td width="150">Emp ID:</td><td width="150" colspan=2><input type="email" name="empid2" placeholder="Enter Employee ID" required class="input-sm"/></td></tr>
		<tr><td width="100">From:</td><td width="150" colspan=2><input type="date" name="dt2" class="input-sm" required/></td></tr>
		<tr><td width="100">To:</td><td width="150"><input type="date" name="dt3" class="input-sm" required/></td><td><input type="submit" name="submit" value="Go" class="btn btn-info"/></td></tr>
		</table>
		</form>
		</fieldset>
		</div></td>
		</tr>
		</table>
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		
		<jsp:useBean id="MyDate" scope="session" class="in.rgukt.MyDate" />
		<jsp:setProperty name="MyDate" property="*" />
		<%
		if(request.getParameter("dt0")!=null)
		{
			String dt = (String)MyDate.getMyDate(request.getParameter("dt0").trim());
			String query = "select * from emp_status where dt='"+dt+"' ";
			ResultSet rSet= Connect.executeMyQuery(query);
			%>
			<div class="alert alert-success">Viewing all Employee reports as on:  <%= dt %></div>
			<%				
			while(rSet.next()){
				%>
				<div class="panel panel-info"  style="float:left;width:95%;margin-left:15;height:auto;margin-top:15;">
				<div class="panel-heading">
				<h3 class="panel-title"><% out.println(rSet.getString("emp_id")); %></h3>
				</div>
				<div class="panel-body">
				<p><% out.println(rSet.getString("status")); %>
				<a href="sendMsg.jsp?to=<% out.println(rSet.getString("emp_id"));%>" class="btn btn-info">Send Message</a></p>
<!-- 				<p align=right><form action="sendMsg.jsp" method="post">Compose Message: <input type="text" name="msg" placeholder="Write Message Here" class="input-sm" required />&nbsp; <input type="submit" value="Send Message" class="btn btn-info"/></form></p> -->
				</div>
				</div>
				<%
			}
		}
		if((request.getParameter("empid1")!=null)&&(request.getParameter("dt1")!=null))
		{
			String dt = (String)MyDate.getMyDate(request.getParameter("dt1").trim());
			String empid=request.getParameter("empid1");
			String query = "select * from emp_status where emp_id='"+empid+"' and dt='"+dt+"'";
			ResultSet rSet= Connect.executeMyQuery(query);
			%>
			<div class="alert alert-success">Showing Status Report of <%=empid %> on: <%=dt %></div>
			<%	
				while(rSet.next()){
					%>
					<div class="panel panel-info"  style="float:left;width:95%;margin-left:15;height:auto;margin-top:15;">
					<div class="panel-heading">
					<h3 class="panel-title"><% out.println(rSet.getString("emp_id")); %></h3>
					</div>
					<div class="panel-body">
					<p><% out.println(rSet.getString("status")); %></p>
					</div>
					</div>
					<%
				}
		}
		if((request.getParameter("empid2")!=null)&&(request.getParameter("dt2")!=null)&&(request.getParameter("dt3")!=null))
		{
			String dt2 = (String)MyDate.getMyDate(request.getParameter("dt2").trim());
			String dt3 = (String)MyDate.getMyDate(request.getParameter("dt3").trim());
			String empid=request.getParameter("empid2");
			String query = "select * from emp_status where emp_id='"+empid+"' and  dt between '"+dt2+"' and '"+dt3+"'";
			ResultSet rSet= Connect.executeMyQuery(query);
			%>
			<div class="alert alert-success">Showing Status Report of <%=empid %> From:<%=dt2 %> To:<%=dt3 %></div>
			<%	
			while(rSet.next()){
				%>
				<div class="panel panel-info"  style="float:left;width:95%;margin-left:15;height:auto;margin-top:15;">
				<div class="panel-heading">
				<h3 class="panel-title"><% out.println(rSet.getString("emp_id")); %></h3>
				</div>
				<div class="panel-body">
				<p><b> Sent On: </b><% out.println(rSet.getDate("dt")); %><br><% out.println(rSet.getString("status")); %></p>
				</div>
				</div>
			<%
			}
		}
		%>
		</div>
</div>
<%@include file="footer.jsp"%>