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
			<h3 class="panel-title">Manage Employees</h3>
		</div>
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		<div class="panel-body">
		<table class="panel panel-body">
		<tr>
		<td><div class="panel panel-body">
		<fieldset class="panel-body"><legend>Add New Employee</legend>
		<form action="" method="post">
		<table>
		<tr><td>Emp Name:</td><td><input type="text" name="ename" class="input-sm" required placeholder="Enter Employee Name"/></td></tr>
		<tr><td>Emp ID:</td><td><input type="email" name="empnid1" class="input-sm" required placeholder="Enter Employee ID"/></td></tr>
		<tr><td>Designation:</td><td><select name="pos" class="input-sm" required><option value="">Select Position</option><option value="employee">Employee</option><option value="manager">manager</option></select></td></tr>
		<tr><td colspan=2 align=right><input type="submit" name="submit-viewall" value="Go" class="btn btn-info"/></td></tr>
		</table>
		</form>
		</fieldset>
		</div></td>
<!-- 		<td><div class="panel panel-body"> -->
<!-- 		<fieldset class="panel-body"><legend>Import Bulk Employee</legend> -->
<!-- 		<form action="" method="post"> -->
<!-- 		<table> -->
<!-- 		<tr><td width="150"><input type="file" name="file" class="input-sm" required style="border:1 solid 	skyblue"/></td><td><input type="submit" name="submit" value="Go" class="btn btn-info"/></td></tr> -->
<!-- 		</table> -->
<!-- 		</form> -->
<!-- 		</fieldset> -->
<!-- 		</div></td> -->
		</tr>
		</table>
		<%
		if(request.getParameter("empnid1")!=null)
		{
			boolean stmt = false;
			boolean stmt1 = false;
			boolean stmt2 = false;
			String query ="insert into assign_mgr values('"+ request.getParameter("empnid1") +"','"+ session.getAttribute("uname") +"','Department')";
			String query1= "insert into users values('"+request.getParameter("empnid1")+"','"+request.getParameter("ename")+"','0123456789','email@ot.com','"+request.getParameter("pos")+"','Update your address')";
			String query2 = "insert into user_login values('"+request.getParameter("empnid1")+"','Welcome123$','Phone No','0123456789','"+request.getParameter("pos")+"','Y')";
			stmt = Connect.executeMyStatements(query);//T
			stmt1 = Connect.executeMyStatements(query1);//T
			stmt2 = Connect.executeMyStatements(query2);//T
			if(stmt && stmt1 && stmt2){
			%>
			<div class="alert alert-success">Successfully Added employee as your subordinate</div>
			<%
			}
			else{
			%>
				<div class="alert alert-warning">Failed to add the Employee</div>
			<%
			}
		}
		if((request.getParameter("file")!=null))
		{
			out.println("<br>Inserting Bulk employee data ");
		}
		%>
		</div>
	</div>
<%@include file="footer.jsp"%>