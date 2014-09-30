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
			<h3 class="panel-title">View Remarks</h3>
		</div>
		<div class="panel-body">
		<table class="panel panel-body">
		<tr>
		<td><div class="panel panel-body">
		<fieldset class="panel-body"><legend>View Remarks By ID</legend>
		<form action="" method="post">
		<table align=center>
		<tr><td>Employee ID:</td><td width="150"><input type="email" name="empid1" placeholder="Enter Employee ID" required class="input-sm"/></td><td><input type="submit" name="submit-viewall" value="Go" class="btn btn-info"/></td></tr>
<!-- 	<tr><td width="150">Date:</td><td width="150"><input type="date" name="dt" class="input-sm" required/>&nbsp;&nbsp;<input type="submit" name="submit-viewall" value="Go" class="btn btn-info"/></td></tr> -->
		</table>
		</form>
		</fieldset>
		</div></td>
		<td><div class="panel panel-body">
		<fieldset class="panel-body"><legend>View Remarks By Time Period</legend>
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
		if((request.getParameter("empid1")!=null))
		{
			String query = "select * from emp_remarks where emp_id='"+request.getParameter("empid1")+"' and mgr_id='"+session.getAttribute("uname")+"'";
			ResultSet rSet= Connect.executeMyQuery(query);
			%>
			<div class="alert alert-success">Viewing all Remarks of <% out.println(request.getParameter("empid1")); %></div>
			<%				
			while(rSet.next()){
				%>
				<div class="panel panel-info"  style="float:left;width:95%;margin-left:15;height:auto;margin-top:15;">
				<div class="panel-heading">
				<h3 class="panel-title"><% out.println(rSet.getDate("dt")); %></h3>
				</div>
				<div class="panel-body">
				<p><% out.println(rSet.getString("remark")); %></p>
				</div>
				</div>
				<%
			}
		}
		%>
		</div>
		<%
		
		if((request.getParameter("empid2")!=null)&&(request.getParameter("dt2")!=null)&&(request.getParameter("dt3")!=null))
		{
			String dt2 = (String)MyDate.getMyDate(request.getParameter("dt2").trim());
			String dt3 = (String)MyDate.getMyDate(request.getParameter("dt3").trim());
			String query = "select * from emp_remarks where emp_id='"+request.getParameter("empid2")+"' and mgr_id='"+session.getAttribute("uname")+"' and dt between '"+dt2+"' and '"+dt3+"'";
			ResultSet rSet= Connect.executeMyQuery(query);
			%>
			<div class="alert alert-success">Viewing all Remarks of <% out.println(request.getParameter("empid2")); %> From:<% out.println(request.getParameter("dt2")+" To: "+ request.getParameter("dt3")); %></div>
			<%				
			while(rSet.next()){
				%>
				<div class="panel panel-info"  style="float:left;width:95%;margin-left:15;height:auto;margin-top:15;">
				<div class="panel-heading">
				<h3 class="panel-title"><% out.println(rSet.getDate("dt")); %></h3>
				</div>
				<div class="panel-body">
				<p><% out.println(rSet.getString("remark")); %></p>
				</div>
				</div>
				<%
			}
			%>
			</div>
			<%
		}
		%>
		</div>
	</div>
<%@include file="footer.jsp"%>