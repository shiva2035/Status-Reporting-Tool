<%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import = "in.rgukt.Connector" %>
	<jsp:useBean id="Connect" scope="session" class="in.rgukt.Connector" />
	<jsp:setProperty name="Connect" property="*" />
	<body>
<%
	String uname= request.getParameter("uname");
	String pwd = request.getParameter("pwd");
	String utype = request.getParameter("type");
	Connection v = (Connection)Connect.connect();
	if(v!=null){
		Statement stmt = v.createStatement();
		String que1 = "select * from user_login where emp_id = '"+uname+"'";
		try{
			ResultSet rs = stmt.executeQuery(que1);
// 			if(!rs.next()){
// 				response.sendRedirect("error.jsp");
// 			}
			while(rs.next()){
				out.println(rs.getString("emp_id")+":"+rs.getString("pwd")+":"+rs.getString("utype"));
				if(uname.equals(rs.getString("emp_id")) && pwd.equals(rs.getString("pwd")) && utype.equals(rs.getString("utype"))){
					session.setAttribute("uname",uname);
					session.setAttribute("utype",utype);
					response.sendRedirect("index.jsp");
				}
				else if((!(uname.equals(request.getParameter("uname")))) || (!(pwd.equals(request.getParameter("pwd")))) || (!(utype.equals(request.getParameter("utype"))))){
					response.sendRedirect("error.jsp");
				}
				else
				{
					response.sendRedirect("error.jsp");
				}
		}
		}catch(Exception ex){
			out.println("Exception: "+ex);
		}
	}
	else{
		out.println("Not Connected");
	}
%>
</body>