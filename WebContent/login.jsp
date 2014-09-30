<%@include file="header.jsp" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">Employee/Manager Login Page</h3>
		</div>
		<%
			if(session.getAttribute("uname")!=null){
				response.sendRedirect("index.jsp");				
			}
		%>
		<script type="text/javascript" src="LoginValidations.js"></script>
		<div class="panel-body"><a href="#">Please provide valid Credentials to Login to this site!!!!!!!!!</a>
		<div class="panel panel-body">
		<form action="login-validate.jsp" method="post" name="login">
		<table align=center class="table table-bordered" style="width:400">
		<tr><td colspan=2 align=center><div class="alert alert-info"><a href="#"><img src="icons/login.png">&nbsp;Sign-In Area</a></div></td></tr>
		<tr><td widt="150"><img src="icons/user.png">&nbsp;User Name</td><td><input type="email" name="uname" placeholder="Enter User Name" required class="input-sm"></td></tr>
		<tr><td><img src="icons/barcode.png">&nbsp;Password</td><td><input type="password" name="pwd" placeholder="Enter Password" required class="input-sm"></td></tr>
		<tr><td><img src="icons/users.png">&nbsp;Login As</td><td><select name="type" class="input-sm" required><option value="">Select Login Type</option><option value="employee">Employee</option><option value="manager">Manager</option></select></td></tr>
		<tr><td colspan=2 align=center><input type="reset" value="Reset" class="btn btn-info"/>&nbsp;&nbsp;<input type="submit" value="Login" class="btn btn-success" onClick="return loginValidate()"/></td></tr>
		<tr><td colspan=2 align=center><a href="forgot-pwd.jsp">Forgot Password</a></td></tr>
		<tr><td colspan=2 align=center id="message"></td></tr>
		</table>
		</form>
		
		</div>
		</div>
	</div>
<%@include file="footer.jsp"%>