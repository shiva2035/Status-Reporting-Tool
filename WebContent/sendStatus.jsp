<%@include file="header.jsp" %>
<%@include file="checkAccess.jsp" %>
<%@page import ="java.sql.*" %>
<%@page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>

<%@page import = "in.rgukt.Connector" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">Sending Status Report to Manager</h3>
		</div>
		<div class="panel-body">
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		<form action="" method="post">
		<table class="table table-bordered" style="{margin-left:75;margin-right:75;}">
		<tr><td>To:</td><td><select name="to" required class="input-sm"><option value="">Select Your Manager</option>
		<%
			String querya = "select distinct sup_id from assign_mgr where emp_id='"+session.getAttribute("uname")+"'";
			ResultSet rSet= Connect.executeMyQuery(querya);
			%>
			<%				
			while(rSet.next()){
				%>
				<option value="<% out.println(rSet.getString("sup_id")); %>"><% out.println(rSet.getString("sup_id")); %></option>
				<%
			}
		%></select></td></tr>
		<tr><td>Write Status:</td><td><textarea required name="status" placeholder="Write the Status here" class="input-sm" cols=80 rows=6></textarea></td></tr>
		<tr><td colspan=2 align=center><input type="submit" value="Send Status" class="btn btn-info"></td></tr>
		</form>
		</table>
		<jsp:useBean id="MyDate" scope="session" class="in.rgukt.MyDate" />
		<jsp:setProperty name="MyDate" property="*" />
		<%
		if((request.getParameter("status")!=null))
		{
			boolean stmt = false;
			Date dt = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");
			String dt1 = sf.format(dt).toUpperCase();			
			String mgr_id = request.getParameter("to");
			String status = request.getParameter("status");
			String emp_id = session.getAttribute("uname").toString();
			String query ="insert into emp_status values('"+emp_id+"','"+dt1+"','"+status+"','"+mgr_id+"')";
// 			try{
			stmt = Connect.executeMyStatements(query);
// 			}catch(SQLException ex){
// 				out.println(ex);
// 			}
			if(stmt){
			%>
			<div class="alert alert-success">Sent Status successfully</div>
			<%
			}
			else{
			%>
				<div class="alert alert-warning">Failed to Send the Status</div>
			<%
			}
		}
		%>
		</div>
</div>
<%@include file="footer.jsp" %>	