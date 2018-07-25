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
			new File("C:/Users/sirwas/Desktop/Automation/KPI Mem.CPU Average Macro.xlsm"));

	XSSFWorkbook wbwrite = new XSSFWorkbook(ip);
	XSSFSheet sheet = wbwrite.getSheet("Summary");

	XSSFRow row;
	row = sheet.getRow(2);
	cellid = 5;
%>

<title>KPI Reporting</title>
</head>
<div class="row">
	<div class="col-md-2">
		<b>Nodes</b>
	</div>
	<div class="col-md-2">
		<b>CPU</b>
	</div>
	<div class="col-md-2">
		<b>Cache Memory</b>
	</div>
	<div class="col-md-2">
		<b>Commit Memory</b>
	</div>
	<div class="col-md-2">
		<b>Swap Memory</b>
	</div>
</div>
<br>
<br>

<div class="row">
	<div class="col-md-2">
		<b>1,2,3,6,7,8:</b>
	</div>
	<%
		double value = -1;
		while (cellid <= 11) {
			Cell cell = row.getCell(cellid);
			value = cell.getNumericCellValue();
	%>
	<div class="col-md-2">
		<label> <%=value%>
		</label>
	</div>
	<%
		cellid+=2;
		}
	%>
</div>
<br>

<%
	row = sheet.getRow(9);
	cellid = 5;
%>

<div class="row">
	<div class="col-md-2">
		<b>4,5:</b>
	</div>
	<%
		while (cellid <= 11) {
			Cell cell = row.getCell(cellid);
			value = cell.getNumericCellValue();
	%>
	<div class="col-md-2">
		<label> <%=value%>
		</label>
	</div>
	<%
		cellid+=2;
		}
	%>
</div>
<br>

<%
	row = sheet.getRow(12);
	cellid = 5;
%>

<div class="row">
	<div class="col-md-2">
		<b>9:</b>
	</div>
	<%
		while (cellid <= 11) {
			Cell cell = row.getCell(cellid);
			value = cell.getNumericCellValue();
	%>
	<div class="col-md-2">
		<label> <%=value%>
		</label>
	</div>
	<%
		cellid+=2;
		}
		System.out.print(value+"\t");
		wbwrite.close();

	%>
</div>

<br><br><br>
<p><a href="/welcome">Click here </a> to return to KPI Reporting tool.</p>

</html>