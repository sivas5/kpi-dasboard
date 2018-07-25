<html>



<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<style>
.a {
	text-align: center;
}

.b {
	padding: 10% 35%;
}

.img1 {
	background-image: url("../../css/3.jpg");
	min-height: 100%;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}

.button {
	padding: 10px 20px;
	font-size: 18px;
	text-align: center;
	cursor: pointer;
	outline: none;
	color: #fff;
	background-color: black;
	border: none;
	border-radius: 10px;
	box-shadow: 0 5px #999;
}

.button:hover {
	background-color: black
}

.button:active {
	background-color: black;
	box-shadow: 0 2px #666;
	transform: translateY(4px);
}

.dropbtn {
	padding: 10px 20px;
	font-size: 18px;
	text-align: center;
	cursor: pointer;
	outline: none;
	color: #fff;
	background-color: black;
	border: none;
	border-radius: 10px;
	box-shadow: 0 5px #999;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: black;
}
</style>
<head>

<title>KPI Dashboard</title>
</head>



<body class="img1">



	<div>
		<div class="img2">

			<table class="b">

				<tr>
					<td><h1>KPI Dashboard</h1></td>
					<td></td>
				</tr>

				<tr>
					<!-- <td><button class="button">Download</button></td> -->
					<td></td>

				</tr>
				<td></td>
				<td></td>
				<tr>

				</tr>
				<td></td>
				<td></td>
				<tr>

				</tr>
				<td></td>
				<td></td>
				<tr>

				</tr>
				<td></td>
				<td></td>
				<tr>

				</tr>
				<tr>
					<td>
						<div class="dropdown">
							<button class="dropbtn">
								Report <i class="fa fa-caret-down"></i>
							</button>
							<div class="dropdown-content">
								<a href="/success">Average Macro</a> 
								<a href="/maxcomplete">Max Macro</a>
							</div>
						</div>
					</td>
					<!-- <td><button class="button" onclick="myFunction()">Submit</button></td> -->
				</tr>

			</table>
		</div>

	</div>

	<!-- <script>
		function myFunction() {
			location.href = "AvgandMax.html";
		}
	</script> -->


</body>
</html>