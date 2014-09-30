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
			<h3 class="panel-title">View Inbox</h3>
		</div>
		<div class="panel-body">
		
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		
		<jsp:useBean id="MyDate" scope="session" class="in.rgukt.MyDate" />
		<jsp:setProperty name="MyDate" property="*" />
		<%
		String query = "select * from box where to1='"+session.getAttribute("uname")+"'";
		ResultSet rSet= Connect.executeMyQuery(query);
		while(rSet.next()){
			%>
			<div class="panel panel-info"  style="float:left;width:95%;margin-left:15;height:auto;margin-top:15;">
			<div class="panel-heading">
			<h3 class="panel-title"><% out.println(rSet.getString("from1")); %></h3>
			</div>
			<div class="panel-body">
			<p><b>Message:</b><% out.println(rSet.getString("message")); %></p>
			<p><b>Sent on:</b><% out.println(rSet.getDate("dt")); %></p>
			</div>
			</div>
			<%
		}
		%>
		</div>
			</div>
		</div>
	</div>
<%@include file="footer.jsp"%>