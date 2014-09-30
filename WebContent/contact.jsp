<%@ include file="header.jsp" %>
<div class="panel panel-info" style="float:left;width:79%;margin-left:10;min-height:600;height:auto;margin-top:-15;">
		<div class="panel-heading">
			<h3 class="panel-title">Contact Us for support</h3>
		</div>
		<div class="panel-body">
		<form action="" method="post">
		<table align=center class="table table-bordered" style="width:500;">
		<tr><td>Your Name:</td><td><input type="text" name="name" placeholder="Enter Your Name" class="input-sm" required/></td></tr>
		<tr><td>Your email:</td><td><input type="email" name="email" placeholder="Enter email ID" class="input-sm" required/></td></tr>
		<tr><td>Your Query:</td><td><textarea cols=50 rows=5 name="name" placeholder="Enter Your Name" class="input-sm" required></textarea></td></tr>
		<tr><td colspan=2 align=center><input type="reset" value="Discard" class="btn btn-warning">&nbsp;<input type="submit" value="Send Query" class="btn btn-info"/></td></tr>
		</table>
		</form>
		</div>
</div>
<%@include file="footer.jsp"%>