<%@include file="header.jsp" %>
<%@include file="checkAccess.jsp" %>
<%@ page import ="java.util.*" %>
<%@page import ="java.sql.*" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import = "in.rgukt.Connector" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">View Profile</h3>
		</div>
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		<div class="panel-body">
		<table class="table table-bordered" style="{margin-left:75;margin-right:75;}">
		<%
			if(request.getParameter("id")!=null){
				String query = "select * from users where emp_id='"+request.getParameter("id")+"' ";
				ResultSet rSet = null;
				ResultSet rset1 = null;
				try{
				rSet= Connect.executeMyQuery(query);
				while(rSet.next()){
				%>
					<tr><td colspan=2><b>Organizational Information</b></td></tr>
					<tr><td width=200>Employee Name</td><td width=400><% out.println(rSet.getString("name")); %><img src="images/shiva.jpg" style="margin-left:200;" class="img-thumbnail"/></td></tr>
					<tr><td>Employee ID</td><td><% out.println(rSet.getString("emp_id")); %></td></tr>
					<tr><td>Email</td><td><a href="mailto:<%out.println(rSet.getString("email")); %>"><% out.println(rSet.getString("email")); %></a></td></tr>
					<tr><td>Designation</td><td><% out.println(rSet.getString("position")); %></td></tr>
					<tr><td>Superior</td><td><%
					rset1 = Connect.executeMyQuery("select distinct sup_id from assign_mgr where emp_id='"+request.getParameter("id")+"'");
					while(rset1.next()){
						out.println(rset1.getString("sup_id")+",");
					}
					%></td></tr>
					<tr><td colspan=2><b>Personal Information</b></td></tr>
					<tr><td>Permanent Address</td><td><% out.println(rSet.getString("address")); %></td></tr>
					<tr><td>Mobile No</td><td><a><% out.println(rSet.getString("phone")); %></a></td></tr>
				<%
				}
				}catch(Exception e){
					out.println("err"+e);
				}
				finally{
					rSet.close();
					Connect.close();
				}
			}else{
			String query = "select * from users where emp_id='"+session.getAttribute("uname")+"' ";
			ResultSet rSet = null;
			ResultSet rset1 = null;
			try{
			rSet= Connect.executeMyQuery(query);
			while(rSet.next()){
			%>
				<tr><td colspan=2><b>Organizational Information</b></td></tr>
				<tr><td width=200>Employee Name</td><td width=400><% out.println(rSet.getString("name")); %><img src="images/shiva.jpg" style="margin-left:200;" class="img-thumbnail"/></td></tr>
				<tr><td>Employee ID</td><td><% out.println(rSet.getString("emp_id")); %></td></tr>
				<tr><td>Email</td><td><a href="mailto:<%out.println(rSet.getString("email")); %>"><% out.println(rSet.getString("email")); %></a></td></tr>
				<tr><td>Designation</td><td><% out.println(rSet.getString("position")); %></td></tr>
				<tr><td>Superior</td><td><%
				rset1 = Connect.executeMyQuery("select distinct sup_id from assign_mgr where emp_id='"+session.getAttribute("uname")+"'");
				while(rset1.next()){
					out.println(rset1.getString("sup_id")+",");
				}
				%></td></tr>
				<tr><td colspan=2><b>Personal Information</b></td></tr>
				<tr><td>Permanent Address</td><td><% out.println(rSet.getString("address")); %></td></tr>
				<tr><td>Mobile No</td><td><a><% out.println(rSet.getString("phone")); %></a></td></tr>
			<%
			}
			}catch(Exception e){
				out.println("err"+e);
			}
			finally{
				rSet.close();
				Connect.close();
			}
			}
			%>
		</table>	
		</div>
	</div>
<%@include file="footer.jsp"%>