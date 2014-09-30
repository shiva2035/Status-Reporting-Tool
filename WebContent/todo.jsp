<%@include file="header.jsp" %>
<%@include file="checkAccess.jsp" %>
<%@page import ="java.sql.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@ page import ="java.text.SimpleDateFormat" %>

<%@page import = "in.rgukt.Connector" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">Add Tasks To- Do</h3>
		</div>
		<div class="panel-body">
		<table align=center class="table table-bordered" style="width:500;">
		<form action="" method="post">
		<tr><td>Task Title:</td><td><input type="text" name="task_title" class="input-sm" placeholder="Enter Task Title" required></td></tr>
		<tr><td>Write Task:</td><td><textarea name="task" class="input-sm" cols=50 rows=6 placeholder="Enter Task Description here" required></textarea></td></tr>
		<tr><td>Deadline:</td><td><input type = "date" class="input-sm" name="dt" required/>&nbsp; <input type = "time" class="input-sm" name="dead_time" required/></td></tr>
		<tr><td colspan=2 align=center><input type="reset" class="btn btn-warning" value="Discard"/>&nbsp;&nbsp;<input type="submit" class="btn btn-info" value="Add New Task"/></td></tr>
		</form>
		</table>
		<hr>
		<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
		<jsp:setProperty name="Connect" property="*" />
		<jsp:useBean id="MyDate" scope="session" class="in.rgukt.MyDate" />
		<jsp:setProperty name="MyDate" property="*" />
		<%		
		if((request.getParameter("task")!=null))
		{
			boolean stmt = false;
// 			SimpleDateFormat sf = new SimpleDateFormat("dd-MMM-yyyy");
// 			String dt1 = sf.format(dt).toUpperCase();
			
			String emp_id = session.getAttribute("uname").toString();
			String task_title = request.getParameter("task_title");
			String task = request.getParameter("task");
			String dead_t = (String)MyDate.getMyDate(request.getParameter("dt").trim());
// 			String dead_tm = "5:30 PM";
			TimeZone timeZone = TimeZone.getTimeZone("UTC");
			Calendar calendar = Calendar.getInstance(timeZone);
			SimpleDateFormat parseFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SS",Locale.US);
			SimpleDateFormat printFormat = new SimpleDateFormat("HH:mm");
			String dead_tm = printFormat.format(calendar.getTime());
			
			String query1 ="insert into todo values ('"+emp_id+"','"+task_title+"','"+task+"','"+dead_t+"','"+dead_tm+"','No')";
			stmt = Connect.executeMyStatements(query1);
			if(stmt){
				response.sendRedirect("todo.jsp");
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
			String empid=session.getAttribute("uname").toString();
			String query = "select * from todo where emp_id='"+empid+"' order by dead_dt desc";
			ResultSet rSet= Connect.executeMyQuery(query);
			while(rSet.next()){
			%>
				<div class="panel panel-info"  style="float:left;width:95%;margin-left:15;height:auto;margin-top:15;">
				<div class="panel-heading">
				<h3 class="panel-title"><% out.println(rSet.getString("task_title")+" ["+ rSet.getDate("dead_dt")+" "+rSet.getString("dead_time")+"]"); %></h3>
				</div>
				<div class="panel-body">
				<p><% out.println(rSet.getString("task")); %></p>
				</div>
				</div>
			<%
				}
		%>
		
		</div>
</div>
<%@include file="footer.jsp" %>	