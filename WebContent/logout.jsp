<%@include file="header.jsp" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
	<div class="panel-heading">
	<h3 class="panel-title">Successfully Logged out of your session</h3>
	</div>
	<div class="panel-body">
		<%@page import="java.util.*"%>
		<%
			session.invalidate();
			response.sendRedirect("login.jsp");
		%>
	</div>
</div>
<%@include file="footer.jsp"%>