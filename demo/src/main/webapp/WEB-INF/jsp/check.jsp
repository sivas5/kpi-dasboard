<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>

<%!double value; %>
<%!int cellid; %>
<%
	FileInputStream ip = new FileInputStream(
			new File("C:/Users/sirwas/Desktop/Automation/KPI Mem.CPU Max Macro.xlsm"));

	XSSFWorkbook wbwrite = new XSSFWorkbook(ip);
	XSSFSheet sheet = wbwrite.getSheet("Summary");

	XSSFRow row;
	row = sheet.getRow(1);
%>

<title>Avg and Max macro</title>
</head>


<style>
.a{
float: left;
width:50%;
height:80%;
border-right:1px solid black;
padding-top:20px;

}

.b{

float: left;
width:50%;
height:80%;
border-left:1px solid black;
padding-top:20px;
}

.c{

border-bottom: 6px solid red;
background-color: lightgrey;
text-align:center;
}

.d{

padding-left:250px;


}

.e{

padding-left:500px;

}

.img1{
background-image: url("9.jpg");
min-height:100%;
background-repeat: no-repeat;
background-attachment: fixed;
background-size: cover;



}	


</style>


<body>



<div class="img1">


<table class="a">
<h2 class="d">Avg Macro<span class="e"></span> Max Macro</h2>

     <tr class="c">
      <td></td>
      <td></td>
      <td>2 day ago</td>
      <td>Yesterday</td>
      <td>Today</td>
    </tr>

<tr class="c">
    <td rowspan="3">Node 1-3, 6-8</td>
    <td>CPU</td>
    <td></td>
    <td></td>
    <td></td>

  </tr>



<tr class="c">
      <td>Memory</td>
      <td></td>
      <td></td>
      <td></td>
      
    </tr>



<tr class="c">
      <td>Swap</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>


<tr class="c">
    <td rowspan="3">Node 4 and 5</td>
    <td>CPU</td>
    <td></td>
    <td></td>
    <td></td>

  </tr>



<tr class="c">
      <td>Memory</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>



<tr class="c">
      <td>Swap</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>



<tr class="c">
    <td rowspan="3">Node 9</td>
    <td>CPU</td>
    <td></td>
    <td></td>
    <td></td>

  </tr>



<tr class="c">
      <td>Memory</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>



<tr class="c">
      <td>Swap</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </table>


  <table class="b">
  
<tr class="c">
      <td></td>
      <td></td>
      <td>2 day ago</td>
      <td>Yesterday</td>
      <td>Today</td>
    </tr>

<tr class="c">
    <td rowspan="3">Node 1-3, 6-8</td>
    <td>CPU</td>
    <td></td>
    <td></td>
   <%--  <%
		
			Cell cell = row.getCell(1);
			value = cell.getNumericCellValue();
	%> --%>
	<td><%-- <%=value%> --%></td>

  </tr>



<tr class="c">
      <td>Memory</td>
      <td></td>
      <td></td>
     <%-- <%
			cell = row.getCell(2);
			value = cell.getNumericCellValue();
	%> --%>
	<td><%-- <%=value%> --%></td>
    </tr>



<tr class="c">
      <td>Swap</td>
      <td></td>
      <td></td>
     <%--  <%
			cell = row.getCell(3);
			value = cell.getNumericCellValue();
	%> --%>
	<td><%-- <%=value%> --%></td>
    </tr>

<%-- <% row = sheet.getRow(2); %> --%>

<tr class="c">
    <td rowspan="3">Node 4 and 5</td>
    <td>CPU</td>
    <td></td>
    <td></td>
   <%-- <%
			cell = row.getCell(1);
			value = cell.getNumericCellValue();
	%> --%>
	<td><%-- <%=value%> --%></td>

  </tr>



<tr class="c">
      <td>Memory</td>
      <td></td>
      <td></td>
      <%-- <%
			cell = row.getCell(2);
			value = cell.getNumericCellValue();
	%> --%>
	<td><%-- <%=value%> --%></td>
    </tr>



<tr class="c">
      <td>Swap</td>
      <td></td>
      <td></td>
      <%-- <%
			cell = row.getCell(3);
			value = cell.getNumericCellValue();
	%> --%>
	<td><%-- <%=value%> --%></td>
    </tr>

<%-- <% row = sheet.getRow(3); %> --%>

<tr class="c">
    <td rowspan="3">Node 9</td>
    <td>CPU</td>
    <td></td>
    <td></td>
    <%-- <%
			cell = row.getCell(1);
			value = cell.getNumericCellValue();
	%> --%>
	<td><%-- <%=value%> --%></td>

  </tr>



<tr class="c">
      <td>Memory</td>
      <td></td>
      <td></td>
      <%-- <%
			cell = row.getCell(2);
			value = cell.getNumericCellValue();
	%> --%>
	<td><%-- <%=value%> --%></td>
    </tr>



<tr class="c">
      <td>Swap</td>
      <td></td>
      <td></td>
      <%-- <%
			cell = row.getCell(3);
			value = cell.getNumericCellValue();
	%> --%>
	<td><%-- <%=value%> --%></td>
    </tr>
  </table>

</div>

<%-- <%
	wbwrite.close();	
%> --%>

</body>

<br><br><br>
<p> <a href="/welcome">Click here </a> to return to KPI Reporting tool.</p>

</html>