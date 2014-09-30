<%@include file="header.jsp" %>
<%@include file="checkAccess.jsp" %>
<%@page import ="java.sql.*" %>
<%@page import="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>

<%@page import = "in.rgukt.Connector" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		<jsp:useBean id="MyDate" scope="session" class="in.rgukt.MyDate" />
		<jsp:setProperty name="MyDate" property="*" />
		<%
			String empid=session.getAttribute("uname").toString();
			
			String query = "select * from emp_status where emp_id='"+empid+"'";
			ResultSet rSet= Connect.executeMyQuery(query);
			%>
			<div class="alert alert-success">Showing Status Report of <%=empid %></div>
			<%	
				while(rSet.next()){
					%>
					<div class="panel panel-info"  style="float:left;width:95%;margin-left:15;height:auto;margin-top:15;">
					<div class="panel-heading">
					<h3 class="panel-title"><% out.println(rSet.getDate("dt")); %></h3>
					</div>
					<div class="panel-body">
					<p><% out.println(rSet.getString("status")); %></p>
					</div>
					</div>
					<%
				}
		%>
		</div>
</div>
<%@include file="footer.jsp" %>	