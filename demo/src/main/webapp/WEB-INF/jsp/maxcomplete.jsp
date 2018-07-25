<html>

<head>

<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>

<title>KPI Reporting</title>
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.a {
	float: left;
	width: 50%;
	height: 80%;
	border-right: 1px solid black;
	padding-top: 20px;
}

.b {
	float: left;
	width: 50%;
	height: 80%;
	border-left: 1px solid black;
	padding-top: 20px;
}

.c {
	border-bottom: 6px solid red;
	background-color: lightgrey;
	text-align: center;
}

.d {
	padding-left: 250px;
}

.e {
	padding-left: 500px;
}

.img1 {
	background-image: url("../../css/9.jpg");
	min-height: 100%;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}

.f {
	padding-left: 600px;
	padding-top: 480px;
}
</style>


<body class="img1">

	<div>
		<%-- <% response.setIntHeader("Refresh", 5);%> --%>


		<%!double avg = -1;%>
		<%!double avg_yest = -1;%>
		<%!double avg2 = -1;%>

		<%!DateFormat dateFormata = new SimpleDateFormat("yyyyMMdd");%>
		<%
			Date datea = new Date();
		%>
		<%!FileInputStream ipa;%>
		<%!XSSFWorkbook wbawrite;%>
		<%!XSSFSheet sheeta;%>
		<%
			File f = new File("C:\\KPI\\KPI_" + dateFormata.format(datea) + "\\Output\\Avg" + dateFormata.format(datea)
					+ ".xlsx");
		%>
		<%
			if (f.exists()) {
				ipa = new FileInputStream(f);

				wbawrite = new XSSFWorkbook(ipa);
				sheeta = wbawrite.getSheetAt(0);
			}
		%>

		<%!XSSFRow rowa;%>
		<%!Cell cella;%>

		<%!DateFormat dateFormata_yest = new SimpleDateFormat("yyyyMMdd");%>
		<%
			Date datea_yest = new Date();
		%>
		<%
			Calendar cala_yest = Calendar.getInstance();
		%>
		<%
			cala_yest.add(Calendar.DATE, -1);
		%>
		<%!FileInputStream ipa_yest;%>
		<%!XSSFWorkbook wbawrite_yest;%>
		<%!XSSFSheet sheeta_yest;%>
		<%
			File f_yest = new File("C:\\KPI\\KPI_" + dateFormata_yest.format(cala_yest.getTime()) + "\\Output\\Avg"
					+ dateFormata_yest.format(cala_yest.getTime()) + ".xlsx");
		%>
		<%
			if (f_yest.exists()) {
				ipa_yest = new FileInputStream(f_yest);

				wbawrite_yest = new XSSFWorkbook(ipa_yest);
				sheeta_yest = wbawrite_yest.getSheetAt(0);
			}
		%>

		<%!XSSFRow rowa_yest;%>
		<%!Cell cella_yest;%>

		<%!FileInputStream ipa2;%>
		<%!XSSFWorkbook wbawrite2;%>
		<%!XSSFSheet sheeta2;%>

		<%!DateFormat dateFormata2 = new SimpleDateFormat("yyyyMMdd");%>
		<%
			Date datea2 = new Date();
		%>
		<%
			Calendar cala2 = Calendar.getInstance();
		%>
		<%
			cala2.add(Calendar.DATE, -2);
		%>

		<%
			File f_2 = new File("C:\\KPI\\KPI_" + dateFormata2.format(cala2.getTime()) + "\\Output\\Avg"
					+ dateFormata2.format(cala2.getTime()) + ".xlsx");
		%>
		<%
			if (f_2.exists()) {
				ipa2 = new FileInputStream(f_2);

				wbawrite2 = new XSSFWorkbook(ipa2);
				sheeta2 = wbawrite2.getSheetAt(0);
			}
		%>

		<%!XSSFRow rowa2;%>
		<%!Cell cella2;%>

		<table class="a">
			<h2 class="d">
				Avg Macro<span class="e"></span> Max Macro
			</h2>

			<tr class="c">
				<td></td>
				<td></td>
				<td>2 day ago</td>
				<td>Yesterday</td>
				<td>Today</td>
			</tr>

			<%
				if (f.exists()) {
					rowa = sheeta.getRow(1);
					cella = rowa.getCell(1);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					rowa_yest = sheeta_yest.getRow(1);
					cella_yest = rowa_yest.getCell(1);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					rowa2 = sheeta2.getRow(1);
					cella2 = rowa2.getCell(1);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td rowspan="4">Node 1-3, 6-8</td>
				<td>CPU</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>

			</tr>

			<%
				if (f.exists()) {
					cella = rowa.getCell(2);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					cella_yest = rowa_yest.getCell(2);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					cella2 = rowa2.getCell(2);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Cache Memory</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>
			</tr>

			<%
				if (f.exists()) {
					cella = rowa.getCell(3);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					cella_yest = rowa_yest.getCell(3);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					cella2 = rowa2.getCell(3);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Commit Memory</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>
			</tr>

			<%
				if (f.exists()) {
					cella = rowa.getCell(4);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					cella_yest = rowa_yest.getCell(4);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					cella2 = rowa2.getCell(4);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Swap</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>
			</tr>

			<%
				if (f.exists()) {
					rowa = sheeta.getRow(2);
					cella = rowa.getCell(1);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					rowa_yest = sheeta_yest.getRow(2);
					cella_yest = rowa_yest.getCell(1);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					rowa2 = sheeta2.getRow(2);
					cella2 = rowa2.getCell(1);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td rowspan="4">Node 4 and 5</td>
				<td>CPU</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>

			</tr>

			<%
				if (f.exists()) {
					cella = rowa.getCell(2);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					cella_yest = rowa_yest.getCell(2);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					cella2 = rowa2.getCell(2);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Cache Memory</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>
			</tr>

			<%
				if (f.exists()) {
					cella = rowa.getCell(3);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					cella_yest = rowa_yest.getCell(3);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					cella2 = rowa2.getCell(3);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Commit Memory</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>
			</tr>

			<%
				if (f.exists()) {
					cella = rowa.getCell(4);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					cella_yest = rowa_yest.getCell(4);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					cella2 = rowa2.getCell(4);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Swap</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>
			</tr>

			<%
				if (f.exists()) {
					rowa = sheeta.getRow(3);
					cella = rowa.getCell(1);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					rowa_yest = sheeta_yest.getRow(3);
					cella_yest = rowa_yest.getCell(1);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					rowa2 = sheeta2.getRow(3);
					cella2 = rowa2.getCell(1);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td rowspan="4">Node 9</td>
				<td>CPU</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>

			</tr>

			<%
				if (f.exists()) {
					cella = rowa.getCell(2);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					cella_yest = rowa_yest.getCell(2);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					cella2 = rowa2.getCell(2);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Cache Memory</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>
			</tr>

			<%
				if (f.exists()) {
					cella = rowa.getCell(3);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					cella_yest = rowa_yest.getCell(3);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					cella2 = rowa2.getCell(3);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Commit Memory</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>
			</tr>

			<%
				if (f.exists()) {
					cella = rowa.getCell(4);
					avg = cella.getNumericCellValue();
				}
			%>
			<%
				if (f_yest.exists()) {
					cella_yest = rowa_yest.getCell(4);
					avg_yest = cella_yest.getNumericCellValue();
				}
			%>
			<%
				if (f_2.exists()) {
					cella2 = rowa2.getCell(4);
					avg2 = cella2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Swap</td>
				<td><%=avg2%></td>
				<td><%=avg_yest%></td>
				<td><%=avg%></td>
			</tr>

		</table>

		<%
			if (f.exists()) {
				wbawrite.close();
				ipa.close();
			}
			if (f_yest.exists()) {
				wbawrite_yest.close();
				ipa_yest.close();
			}
			if (f_2.exists()) {
				wbawrite2.close();
				ipa2.close();
			}
		%>






		<%!double value = -1;%>
		<%!double value_yest = -1;%>
		<%!double value2 = -1.0;%>

		<%!DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");%>
		<%
			Date date = new Date();
		%>
		<%
			File f2 = new File(
					"C:\\KPI\\KPI_" + dateFormat.format(date) + "\\Output\\Max" + dateFormat.format(date) + ".xlsx");
		%>
		<%!FileInputStream ip;%>
		<%!XSSFWorkbook wbwrite;%>
		<%!XSSFSheet sheet;%>

		<%
			if (f2.exists()) {
				ip = new FileInputStream(f2);

				wbwrite = new XSSFWorkbook(ip);
				sheet = wbwrite.getSheetAt(0);
			}
		%>

		<%!XSSFRow row;%>
		<%!Cell cell;%>

		<%!DateFormat dateFormat_yest = new SimpleDateFormat("yyyyMMdd");%>
		<%
			Date date_yest = new Date();
		%>
		<%
			Calendar cal_yest = Calendar.getInstance();
		%>
		<%
			cal_yest.add(Calendar.DATE, -1);
		%>
		<%
			File f2_yest = new File("C:\\KPI\\KPI_" + dateFormat_yest.format(cal_yest.getTime()) + "\\Output\\Max"
					+ dateFormat_yest.format(cal_yest.getTime()) + ".xlsx");
		%>
		<%!FileInputStream ip1;%>
		<%!XSSFWorkbook wbwrite_yest;%>
		<%!XSSFSheet sheet_yest;%>
		<%
			if (f2_yest.exists()) {
				ip1 = new FileInputStream(f2_yest);

				wbwrite_yest = new XSSFWorkbook(ip1);
				sheet_yest = wbwrite_yest.getSheetAt(0);
			}
		%>

		<%!XSSFRow row_yest;%>
		<%!Cell cell_yest;%>

		<%!DateFormat dateFormat_2 = new SimpleDateFormat("yyyyMMdd");%>
		<%
			Date date_2 = new Date();
		%>
		<%
			Calendar cal2 = Calendar.getInstance();
		%>
		<%
			cal2.add(Calendar.DATE, -2);
		%>
		<%
			File f2_2 = new File("C:\\KPI\\KPI_" + dateFormat_2.format(cal2.getTime()) + "\\Output\\Max"
					+ dateFormat_2.format(cal2.getTime()) + ".xlsx");
		%>
		<%!FileInputStream ip2;%>
		<%!XSSFWorkbook wbwrite2;%>
		<%!XSSFSheet sheet2;%>
		<%
			if (f2_2.exists()) {
				ip2 = new FileInputStream(f2_2);
				wbwrite2 = new XSSFWorkbook(ip2);
				sheet2 = wbwrite2.getSheetAt(0);
			}
		%>

		<%!XSSFRow row2;%>
		<%!Cell cell2;%>


		<table class="b">

			<tr class="c">
				<td></td>
				<td></td>
				<td>2 day ago</td>
				<td>Yesterday</td>
				<td>Today</td>
			</tr>

			<%
				if (f2.exists()) {
					row = sheet.getRow(1);
					cell = row.getCell(1);
					value = cell.getNumericCellValue();
				}
			%>
			<%
				if (f2_yest.exists()) {
					row_yest = sheet_yest.getRow(1);
					cell_yest = row_yest.getCell(1);
					value_yest = cell_yest.getNumericCellValue();
				}
			%>
			<%
				if (f2_2.exists()) {
					row2 = sheet2.getRow(1);
					cell2 = row2.getCell(1);
					value2 = cell2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td rowspan="3">Node 1-3, 6-8</td>
				<td>CPU</td>
				<td><%=value2%></td>
				<td><%=value_yest%></td>
				<td><%=value%></td>

			</tr>

			<%
				if (f2.exists()) {
					cell = row.getCell(2);
					value = cell.getNumericCellValue();
				}
			%>
			<%
				if (f2_yest.exists()) {
					cell_yest = row_yest.getCell(2);
					value_yest = cell_yest.getNumericCellValue();
				}
			%>
			<%
				if (f2_2.exists()) {
					cell2 = row2.getCell(2);
					value2 = cell2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Memory</td>
				<td><%=value2%></td>
				<td><%=value_yest%></td>
				<td><%=value%></td>
			</tr>

			<%
				if (f2.exists()) {
					cell = row.getCell(3);
					value = cell.getNumericCellValue();
				}
			%>
			<%
				if (f2_yest.exists()) {
					cell_yest = row_yest.getCell(3);
					value_yest = cell_yest.getNumericCellValue();
				}
			%>
			<%
				if (f2_2.exists()) {
					cell2 = row2.getCell(3);
					value2 = cell2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Swap</td>
				<td><%=value2%></td>
				<td><%=value_yest%></td>
				<td><%=value%></td>
			</tr>

			<%
				if (f2.exists()) {
					row = sheet.getRow(2);
					cell = row.getCell(1);
					value = cell.getNumericCellValue();
				}
			%>
			<%
				if (f2_yest.exists()) {
					row_yest = sheet_yest.getRow(2);
					cell_yest = row_yest.getCell(1);
					value_yest = cell_yest.getNumericCellValue();
				}
			%>
			<%
				if (f2_2.exists()) {
					row2 = sheet2.getRow(2);
					cell2 = row2.getCell(1);
					value2 = cell2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td rowspan="3">Node 4 and 5</td>
				<td>CPU</td>
				<td><%=value2%></td>
				<td><%=value_yest%></td>
				<td><%=value%></td>

			</tr>

			<%
				if (f2.exists()) {
					cell = row.getCell(2);
					value = cell.getNumericCellValue();
				}
			%>
			<%
				if (f2_yest.exists()) {
					cell_yest = row_yest.getCell(2);
					value_yest = cell_yest.getNumericCellValue();
				}
			%>
			<%
				if (f2_2.exists()) {
					cell2 = row2.getCell(2);
					value2 = cell2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Memory</td>
				<td><%=value2%></td>
				<td><%=value_yest%></td>
				<td><%=value%></td>
			</tr>

			<%
				if (f2.exists()) {
					cell = row.getCell(3);
					value = cell.getNumericCellValue();
				}
			%>
			<%
				if (f2_yest.exists()) {
					cell_yest = row_yest.getCell(3);
					value_yest = cell_yest.getNumericCellValue();
				}
			%>
			<%
				if (f2_2.exists()) {
					cell2 = row2.getCell(3);
					value2 = cell2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Swap</td>
				<td><%=value2%></td>
				<td><%=value_yest%></td>
				<td><%=value%></td>
			</tr>

			<%
				if (f2.exists()) {
					row = sheet.getRow(3);
					cell = row.getCell(1);
					value = cell.getNumericCellValue();
				}
			%>
			<%
				if (f2_yest.exists()) {
					row_yest = sheet_yest.getRow(3);
					cell_yest = row_yest.getCell(1);
					value_yest = cell_yest.getNumericCellValue();
				}
			%>
			<%
				if (f2_2.exists()) {
					row2 = sheet2.getRow(3);
					cell2 = row2.getCell(1);
					value2 = cell2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td rowspan="3">Node 9</td>
				<td>CPU</td>
				<td><%=value2%></td>
				<td><%=value_yest%></td>
				<td><%=value%></td>

			</tr>

			<%
				if (f2.exists()) {
					cell = row.getCell(2);
					value = cell.getNumericCellValue();
				}
			%>
			<%
				if (f2_yest.exists()) {
					cell_yest = row_yest.getCell(2);
					value_yest = cell_yest.getNumericCellValue();
				}
			%>
			<%
				if (f2_2.exists()) {
					cell2 = row2.getCell(2);
					value2 = cell2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Memory</td>
				<td><%=value2%></td>
				<td><%=value_yest%></td>
				<td><%=value%></td>
			</tr>

			<%
				if (f2.exists()) {
					cell = row.getCell(3);
					value = cell.getNumericCellValue();
				}
			%>
			<%
				if (f2_yest.exists()) {
					cell_yest = row_yest.getCell(3);
					value_yest = cell_yest.getNumericCellValue();
				}
			%>
			<%
				if (f2_2.exists()) {
					cell2 = row2.getCell(3);
					value2 = cell2.getNumericCellValue();
				}
			%>

			<tr class="c">
				<td>Swap</td>
				<td><%=value2%></td>
				<td><%=value_yest%></td>
				<td><%=value%></td>
			</tr>
		</table>
		<div class="f">

			<button class="button" onclick="myFunction()">Home</button>

		</div>



		<%
			if (f2.exists()) {
				wbwrite.close();
				ip.close();
			}
			if (f2_yest.exists()) {
				wbwrite_yest.close();
				ip1.close();
			}
			if (f2_2.exists()) {
				wbwrite2.close();
				ip2.close();
			}
		%>

		<script>
			function myFunction() {
				location.href = "/welcome";
			}
		</script>

		<!-- <p>
			<a href="/welcome">Click here </a> to return to KPI Reporting tool.
		</p> -->
	</div>



</body>

</html>