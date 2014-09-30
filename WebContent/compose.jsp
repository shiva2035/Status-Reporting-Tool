<%@include file="header.jsp" %>
<%@include file="checkAccess.jsp" %>
<%@page import ="java.sql.*" %>
<%@page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>

<%@page import = "in.rgukt.Connector" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">Compose Message to <% out.println(request.getParameter("to")); %></h3>
		</div>
		<div class="panel-body">
		<form action="" method="post">
		<table class="table table-bordered" style="{margin-left:75;margin-right:75;}">
		<tr><td>To:</td><td><input type="text" name="to" class="input-sm" required placeholder="Enter recepient email ID"></td></tr>
		<tr><td>Compose Message:</td><td><textarea required name="message" placeholder="Write the Message here" class="input-sm" cols=80 rows=6></textarea></td></tr>
		<tr><td colspan=2 align=right><input type="submit" value="Send Message" class="btn btn-info"></td></tr>
		</form>
		</table>
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		<jsp:useBean id="MyDate" scope="session" class="in.rgukt.MyDate" />
		<jsp:setProperty name="MyDate" property="*" />
		<%
		if((request.getParameter("message")!=null))
		{
			boolean stmt = false;
			Date dt = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");
			String dt1 = sf.format(dt).toUpperCase();			
			String to = request.getParameter("to");
			String message = request.getParameter("message");
			String from = session.getAttribute("uname").toString();
			String query ="insert into box values('"+to+"','"+message+"','"+dt1+"','"+from+"')";
// 			try{
			stmt = Connect.executeMyStatements(query);
// 			}catch(SQLException ex){
// 				out.println(ex);
// 			}
			if(stmt){
			%>
			<div class="alert alert-success">Sent Message successfully</div>
			<%
			}
			else{
			%>
				<div class="alert alert-warning">Failed to Send the Message</div>
			<%
			}
		}
		%>
		</div>
</div>
<%@include file="footer.jsp" %>	