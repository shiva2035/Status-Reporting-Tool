<%@include file="header.jsp" %>
<%@ page import ="java.util.*" %>
<%@page import ="java.sql.*" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import = "in.rgukt.Connector" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">Dashboard/Settings</h3>
		</div>
		<div class="panel panel-warning"  style="float:left;width:95%;margin-left:15;min-height:200;height:auto;margin-top:15;">
		<div class="panel-heading">
		<h3 class="panel-title">Forgot Password: Request Password Update</h3>
		</div>
		<div class="panel-body">
		<form action="" method="post">
		<table class="panel-body" align=center>
		<tr><td>Username: </td><td><input type="email" name="uname" required placeholder="Enter Username" class="input-sm"/></td></tr>
		<tr><td>Security Question: </td><td><input type="text" name="secq" required placeholder="Security Question?" class="input-sm"/></td></tr>
		<tr><td>Security Answer:</td><td><input type="text" name="seca" required placeholder="Enter Security Answer" class="input-sm"/></td></tr>
		<tr><td colspan=2 align=right><input type="submit" name="submit" value="Request Password Change" class="btn btn-info"/></td></tr>
		</table>
		</form>
		</div>
		</div>
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		<%
		if((request.getParameter("uname")!=null)&&(request.getParameter("secq")!=null)&&(request.getParameter("seca")!=null))
		{
			String query = "select * from user_login where emp_id='"+request.getParameter("uname")+"'";
			ResultSet rSet= Connect.executeMyQuery(query);
			boolean stmt = false;
			while(rSet.next()){
				if(request.getParameter("seca").equals(rSet.getString("seca"))){
					%>
					<p class="alert alert-info">Your Password is:<b><% out.println(rSet.getString("pwd")); %></b></p>
					<%
				}
				else{
					%>
					<p class="alert alert-warning">Information Provided is Not found in our records</b></p>
					<%
				}
			}
		}
		%>
</div>
<%@include file="footer.jsp"%>