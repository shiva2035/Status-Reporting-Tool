function loginValidate()
{   
	var uname=document.login.uname.value;
	var pwd=document.login.pwd.value;
	var pattern="^\\w+@[a-zA-Z_]+\\.[a-zA-Z]{2,3}$"; 
	var pattern1="^\\w{3,15}\\d{2,7}";  
	 if(uname==null || uname=="") 
      {
		 document.getElementById('message').innerHTML="<p class=\"alert alert-warning\">Email ID must be filled out</p>";
//		 	alert("EMAILID MUST BE FILLED OUT");
		 	return false;
      }
       if(uname.match(pattern))
	    {
    	   // alert("EMAILID PATTERN MATCHED");
	    }
	   	else 
	    {
			document.getElementById('message').innerHTML="<p class=\"alert alert-warning\">ENTER VALID EMAILID</p>";
//   			alert("ENTER VALID EMAILID");
   			return false;
	    }
	   if(pwd==null || pwd=="")
	   {
		   document.getElementById('message').innerHTML="<p class=\"alert alert-warning\">PASSWORD MUST BE FILLED OUT</p>";
//		   alert("PASSWORD MUST BE FILLED OUT");
		   return false;
	   }
	    if(pwd.match(pattern1))
	    {
	    	//alert(" PASSWORD PATTERN MATCHED");
	    }
	    else
	    {
		    document.getElementById('message').innerHTML="<p class=\"alert alert-warning\">ENTER VALID PASSWORD</p>";	    	
	    	alert("ENTER VALID PASSWORD");
	    	return false;
	    }
	}