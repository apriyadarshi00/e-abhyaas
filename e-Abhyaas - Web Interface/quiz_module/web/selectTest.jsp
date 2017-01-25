<%--
Whenever the teacher chooses the option "Results",he/she is redirected to this page
Here, he is asked to select a test from the ones he had uploaded, of which he whishes to view the results
As soon as he selects a test and presses the showResults button, he is redirected to displayResults.jsp where he can view the results
--%>

<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>e-Abhyaas : Teacher</title>


<link href="main_style.css" rel="stylesheet" type="text/css" />

</head>

<%
if((session.getAttribute("name"))!=null&&(session.getAttribute("password")!=null))
{
    String filename=(String)session.getAttribute("name");
%>
<body>
<div id="main_container">

    <div id="main_header">
    	<div id="logosection">
	        <div class="sitelogo"><img src="images/people.gif" width="215" height="75"></img></div>
        	<div class="sitename">&nbsp;e-<font style="font-family: Samarkan">&nbsp;Abhyaas</font></div>
      </div>
        <div id="header">
        	<div class="title">
        	  <p>Education through<br />
       	      <span class="bigtext">The Aakash Tablet</span></p>
        	  <p><br />
      	    </p>
            </div>

        </div>
	</div>

	<div id="main_menu">
    	<div id="search">
		</div>
        <div id="menu">
            <ul>
                <li></li>
                <li></li>
                <li><a href="teacherIndex.jsp" >Home</a></li>
                <li><a href="quizspecifications.jsp">Quiz Specifications</a></li>
                <li><a href="selectTest.jsp" class="current">Result</a></li>
            </ul>
        </div>
	</div>



	<div id="main_content">



    	<div id="main_left_column">

            <div id="leftcolumn_box01">
                <div class="leftcolumn_box01_top">
                    <h2>Welcome <%= session.getAttribute("firstName")%> !!</h2>
                </div>
                <div>
                    <form method="post" action="#">
                        <div align="left"> <a href="logout.jsp"/></div>
                      <div class="form_row"><label></label>
                        </div>
                  </form>
                </div>
            </div>

           <div id="leftcolumn_box02">
                        <h2>Log Out</h2>
                        <ul>

                        </ul>
                    </div>

			<div id="imagebutton"><a href="#"><img src="images/SM111378.gif" alt="" width="220" height="138" /></a></div>

        </div>

 <div id="main_middle_column">
          

             
     <form method="post" action="displayResults.jsp" >
         
         <h1 align="left">Select test to view results-</h1>
         <br />
     <%
               File directory = new File("uploads");//reading all files of this folder
String[] readfile;
File[] myarray; // contains the path of all files in the folder
String[] testName; // testname stores the name of the teacher who uploaded the test and name of test given by him,the values being seperated by ';'
String[] final_testName; // stores the name of test without .pdf extension
myarray=directory.listFiles();
out.println("<select name=\"sel\" align=\"left\" style=\"font-size:medium;font-family:Calibri;border-color:#1AACF0;background-color:#E4E1E1\">");
for (int k = 0; k < myarray.length; k++)
{
    String name1=myarray[k].getName();
    final_testName=new String[myarray.length];
    if(name1.contains(filename)==true && name1.contains(".pdf")==true)
        {
        testName= name1.split(";");
      final_testName[k]= testName[1].replace(".pdf","");
      
      out.println("<option value=\""+final_testName[k]+"\">"+final_testName[k] +"</option>");// allowing user to select a test from the drop down menu

       }
    }
 out.println("</select>");
 

 %>
 <input type="submit" name="submit" value="Results" class="button"  style="font-family: Calibri;font-size: medium;"align="left" size="10"/>
     </form>
           
    	</div>
<div id="main_right_column">
       <div class="rightbig_button"><img src="images/edu.gif" width="196" height="123"></img></div>
       <div class="sitename" align="left">
         <p><font size="+2">Let us sacrifice</font></p>
         <p><font size="+2"> our today</font></p>
         <p><font size="+2">so that </font></p>
         <p><font size="+2">our children </font></p>
         <p><font size="+2">can have </font>         </p>
         <p><font size="+2">a better</font></p>
         <p><font size="+2">tomorrow.</font></p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
       </div>

         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p><br />
         </p>
</div>

  </div>

    <!-- end of content -->


	<div id="main_footer">
         Copyright Â© Quiz Module| Designed by Quiz Module Team</div>
    <div id="main_footer_bottom"></div>

</div>
</body>


<%
}
else
{
%>
<jsp:forward page="index.jsp"/>
<%
}
%>
</html>