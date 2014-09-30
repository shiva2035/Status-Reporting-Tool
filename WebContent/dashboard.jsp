<%@include file="header.jsp" %>
<%@include file="checkAccess.jsp" %>
<%@ page import ="java.util.*" %>
<%@page import ="java.sql.*" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import = "in.rgukt.Connector" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">Dashboard</h3>
		</div>
		<div class="panel panel-warning"  style="float:left;width:95%;margin-left:15;height:auto;margin-top:15;">
		<div class="panel-heading">
		<h3 class="panel-title">Change Password</h3>
		</div>
		<div class="panel-body">
		<form action="" method="post">
		<table class="panel panel-body" align=center>
		<tr><td>Old Password: </td><td><input type="password" name="opwd" required placeholder="Enter Old Password" class="input-sm"/></td></tr>
		<tr><td>New Password: </td><td><input type="password" name="npwd1" required placeholder="Enter New Password" class="input-sm"/></td></tr>
		<tr><td>New Password<font color=red size=2>(Again)</font>: </td><td><input type="password" name="npwd2" required placeholder="Enter New Password Again" class="input-sm"/></td></tr>
		<tr><td colspan=2 align=right><input type="submit" name="submit" value="Change Password" class="btn btn-info"/></td></tr>
		</table>
		</form>
		</div>
		</div>
		<div class="panel panel-warning"  style="float:left;width:95%;margin-left:15;min-height:300;height:auto;margin-top:15;">
		<div class="panel-heading">
		<h3 class="panel-title">Profile Settings</h3>
		</div>
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		<div class="panel-body">
		
		<form action="" method="post">
		<table class="panel panel-body" align=center>		
		<%
		if(session.getAttribute("uname")!=null)
		{
			String query = "select * from users where emp_id='"+session.getAttribute("uname")+"'";
			ResultSet rSet= Connect.executeMyQuery(query);
			while(rSet.next()){
				%>
					<tr><td>Permanent Address: </td><td><input type="text" name="addr" required placeholder="Enter Permanent Addr" class="input-sm" value="<% out.println(rSet.getString("address"));%>"/></td></tr>
					<tr><td>Mobile No:</td><td><input type="text" name="mobile" required placeholder="Enter 10-digit Mobile No" class="input-sm" value="<% out.println(rSet.getString("phone"));%>"/></td></tr>
					<tr><td>email: </td><td><input type="email" name="email" required placeholder="Enter email" class="input-sm" value="<% out.println(rSet.getString("email"));%>"/></td></tr>
					<tr><td colspan=2 align=right><input type="reset" value="Cancel" class="btn btn-warning"/>&nbsp;&nbsp;<input type="submit" name="submit" value="Update Profile" class="btn btn-info"/></td></tr>
				<%
			}
		}
		%>
		</table>		
		</form>
		</div>

		<%
		if((request.getParameter("opwd")!=null)&&(request.getParameter("npwd1")!=null)&&(request.getParameter("npwd2")!=null))
		{
			String query = "select * from user_login where emp_id='"+session.getAttribute("uname")+"'";
			ResultSet rSet= Connect.executeMyQuery(query);
			boolean stmt = false;
			while(rSet.next()){
				if(rSet.getString("pwd").equals(request.getParameter("opwd"))){
					String query1="update user_login set pwd='"+request.getParameter("npwd1")+"' where emp_id='"+session.getAttribute("uname")+"'";
					stmt = Connect.executeMyStatements(query1);
				}
				if(stmt){
					%>
					<div class="alert alert-success">Successfully Updated the Password</div>
					<%
				}
				else{
					%>
					<div class="alert alert-warning">Sorry,Failed to Update Password</div>
					<%
				}
			}
		}
		%>
		</div>
		<%
		if((request.getParameter("addr")!=null)&&(request.getParameter("mobile")!=null)&&(request.getParameter("email")!=null))
		{
				boolean stmtx = false;
				String queryx="update users set address='"+request.getParameter("addr")+"',phone='"+request.getParameter("mobile")+"', email='"+request.getParameter("email")+"' where emp_id='"+session.getAttribute("uname")+"'";
				stmtx = Connect.executeMyStatements(queryx);
				out.println(stmtx);
				if(stmtx){
					%>
					<div class="alert alert-success">Successfully Updated the Profile Data</div>
					<%
				}
				else{
					%>
					<div class="alert alert-warning">Sorry,Failed to Update Profile</div>
					<%
				}
		}
		%>
	</div>
<%@include file="footer.jsp"%>