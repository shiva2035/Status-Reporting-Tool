<html>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<title>OpenText India Pvt.Ltd</title>
    <link rel="shortcut icon" href="images/ot.ico" />
	<body style="margin-left:175px;-webkit-margin-left:175;margin-right:175;border:0 solid black;">
	<style type="text/css">
	#header{
			//background-color:0099FF;
			background-color:#0099FF;
			color:white;
			height:100;
			margin:-20 0 0;
			text-align:center;
			vertical-align: middle;
	}
	</style>
	<div id="header">
	<h2><br>Status Reporting Tool</h2>
	</div>
	<%
	boolean sesVar = false;
	String uType = null;
	if(session.getAttribute("uname")!=null){
		sesVar = true;
		uType = (String)session.getAttribute("utype");
	}
	if(sesVar){
	%>
	<div class="panel panel-success" style="text-align:right;"> Welcome Mr/Mrs. <b><a href="viewProfile.jsp"><% out.println(session.getAttribute("uname")); %></b></a>!!&nbsp;&nbsp;<a href="logout.jsp" class="btn btn-info">Logout&nbsp;<img src="icons/logout.png"></a></div>
	<% } else{ %>
	<div class="panel panel-success" style="text-align:right;"> Welcome Mr/Mrs<a href="#"><b>Guest</b></a>!!&nbsp;&nbsp;<a href="login.jsp" class="btn btn-info">Login&nbsp;<img src="icons/login.png"></a></div>
	<% }
	%>
	<div style="width:20%;min-height:600;height:auto;background-color:#f8f8f8;float:left;margin-top:-15;">
	<%
	if(sesVar && uType.equals("manager")){
		%>
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="index.jsp"><img src="icons/home.png">&nbsp;Home</a></li>
			<li><a href="viewReports.jsp"><img src="icons/report.png">&nbsp;View Reports</a></li>
			<li><a href="viewRemarks.jsp"><img src="icons/eye.png">&nbsp;View Remarks</a></li>
			<li><a href="viewSubord.jsp"><img src="icons/list.png">&nbsp;View Subordinates</a></li>
			<li><a href="manageEmployee.jsp"><img src="icons/add-usr.png">&nbsp;Manage Subordinates</a></li>			
			<li><a href="viewProfile.jsp"><img src="icons/user.png">&nbsp;View Profile</a></li>			
			<li><a href="dashboard.jsp"><img src="icons/settings.png">&nbsp;Dashboard</a></li>
			<li class="active"><a href="">Manager as Employee</a></li>
			<li><a href="sendStatus.jsp"><img src="icons/sends.png">&nbsp;Send Status</a></li>
			<li><a href="viewStatus.jsp"><img src="icons/record.png">&nbsp;View Status</a></li>
			<li><a href="todo.jsp"><img src="icons/todo.png">&nbsp;To-do's</a></li>
			<li class="active"><a>Extra Utilities</a></li>
			<li><a href="compose.jsp"><img src="icons/message.png">&nbsp;Compose</a></li>
			<li><a href="inbox.jsp"><img src="icons/inbox.png">&nbsp;InBox</a></li>
			<li><a href="outbox.jsp"><img src="icons/outbox.png">&nbsp;OutBox</a></li>			
		</ul>		
		<%
	}
	else if(sesVar && uType.equals("employee")){
		%>
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="index.jsp"><img src="icons/home.png">&nbsp;Home</a></li>
			<li><a href="sendStatus.jsp"><img src="icons/sends.png">&nbsp;Send Status</a></li>
			<li><a href="viewStatus.jsp"><img src="icons/record.png">&nbsp;View Status</a></li>
			<li><a href="todo.jsp"><img src="icons/todo.png">&nbsp;To-do's</a></li>
			<li><a href="dashboard.jsp"><img src="icons/settings.png">&nbsp;Dashboard</a></li>
			<li class="active"><a>Extra Utilities</a></li>
			<li><a href="compose.jsp"><img src="icons/message.png">&nbsp;Compose</a></li>
			<li><a href="inbox.jsp"><img src="icons/inbox.png">&nbsp;InBox</a></li>	
			<li><a href="outbox.jsp"><img src="icons/outbox.png">&nbsp;OutBox</a></li>			
								
		</ul>
		<%
	}
	else{
		%>
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="index.jsp"><img src="icons/home.png">&nbsp;Home</a></li>
			<li><a href="about-srt.jsp"><img src="icons/info.png">&nbsp;About Status Report Tool</a></li>
			<li><a href="contact.jsp"><img src="icons/phone.png">&nbsp;Contact Us</a></li>
			<li><a href="about-us.jsp"><img src="icons/group.png">&nbsp;About Us</a></li>
			
		</ul>
		<%
	}
	%>	
	</div>
	</body>
</html>

