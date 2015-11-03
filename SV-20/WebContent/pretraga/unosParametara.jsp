<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" import= "java.util.Vector" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">


<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Spontaneous 
Description: A two-column, fixed-width design for 1024x768 screen resolutions.
Version    : 1.0
Released   : 20090623

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>SV-20 obrazac</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
 <jsp:useBean id="uploadDB" scope="session" class="model.UploadDB"/>
<div id="wrapper">
	<div id="logo">
		<h1></h1>
	</div>
	<hr />
	<!-- end #logo -->
	<div id="header">
		<div id="menu">
			<ul>
				<li><a href="/SV-20/input/unos.jsp">Unos SV-20 obrasca</a></li>
				<li><a href="/SV-20/pretraga/unosParametara.jsp">Pretraga</a></li>
				
			</ul>
		</div>
		<!-- end #menu -->
	</div>
	<!-- end #header -->
	<!-- end #header-wrapper -->
	<div id="page">
	<div id="page-bgtop">
		<div id="content">
			<div class="post">
				<h2 class="title">Unos podataka za pretragu</h2>
				<div class="entry">
					 
                                    
<br><br><br>
<form id="form1" name="form1" method="post" action="/SV-20/pretraga/pretrazi.jsp">
<br>
<table>
<tr>
	<td><h3>Ime studenta:&nbsp;&nbsp;</h3>&nbsp;&nbsp;&nbsp;</td>
	<td><input name="Ime" type="text" style="height:17px;"></td>
</tr>
<tr>
	<td><h3>Prezime studenta:&nbsp;&nbsp;</h3>&nbsp;&nbsp;&nbsp;</td> 
	<td><input name="Prezime" type="text" style="height:17px;"></td>
</tr>
<tr>
	<td><h3>Smer:&nbsp;&nbsp;</h3>&nbsp;&nbsp;&nbsp;</td> 
	<td><input name="Smer" type="text" style="height:17px;"></td>
</tr>
<tr>
	<td><h3>Godina rodjenja:&nbsp;&nbsp;</h3>&nbsp;&nbsp;&nbsp;</td> 
	<td><input name="GodinaRodjenja" type="text" style="height:17px;"></td>
</tr>
</table>
<br><br><br>
<input align ="center" name="Sacuvaj" type="submit" value="Pretrazi" style="width: 70px; height: 25px"><br>


				</div>
			</div>
		</div>
		<!-- end #content -->
		<div id="sidebar">
			<ul>
				<li>
					<h2>MENI</h2>
					<ul>
						<li><a href="/SV-20/input/unos.jsp">Unos SV-20 obrasca</a></li>
						<li><a href="/SV-20/pretraga/unosParametara.jsp">Pretraga</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- end #sidebar -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	</div>
	<!-- end #page -->
	<div id="footer-bgcontent">
	<div id="footer">
		<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
	</div>
	</div>
	<!-- end #footer -->
</div>
</body>
</html>
