<%@include file="header.jsp" %>
<%@include file="checkEmpAccess.jsp" %>
<%@page import ="java.sql.*" %>
<%@page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>

<%@page import = "in.rgukt.Connector" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">Write Remark for <% out.println(request.getParameter("to")); %></h3>
		</div>
		<div class="panel-body">
		<form action="" method="post">
		<table class="table table-bordered" style="{margin-left:75;margin-right:75;}">
		<tr><td>Remark on:</td><td><input type="text" name="to" class="input-sm" value="<% out.println(request.getParameter("to")); %>" disabled></td></tr>
		<tr><td>Write Remarks:</td><td><textarea required name="remark" placeholder="Write the Remarks here" class="input-sm" cols=80 rows=6></textarea></td></tr>
		<tr><td colspan=2 align=right><input type="submit" value="Add Remark" class="btn btn-info"></td></tr>
		</form>
		</table>
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		<jsp:useBean id="MyDate" scope="session" class="in.rgukt.MyDate" />
		<jsp:setProperty name="MyDate" property="*" />
		<%
		if((request.getParameter("remark")!=null))
		{
			boolean stmt = false;
			Date dt = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");
			String dt1 = sf.format(dt).toUpperCase();			
			String emp_id = request.getParameter("to");
			String remark = request.getParameter("remark");
			String mgr_id = session.getAttribute("uname").toString();
			String query ="insert into emp_remarks values('"+emp_id+"','"+dt1+"','"+remark+"','"+mgr_id+"')";
// 			try{
			stmt = Connect.executeMyStatements(query);
// 			}catch(SQLException ex){
// 				out.println(ex);
// 			}
			if(stmt){
			%>
			<div class="alert alert-success">Written Remark successfully</div>
			<%
			}
			else{
			%>
				<div class="alert alert-warning">Failed to Write the remark</div>
			<%
			}
		}
		%>
		</div>
</div>
<%@include file="footer.jsp" %>	