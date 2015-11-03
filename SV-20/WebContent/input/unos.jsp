<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page language="java" import= "java.util.Vector" contentType="text/html"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="uploadDB" scope="session" class="model.UploadDB"/>

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
				<h2 class="title">Unos podataka u SV obrazac </h2>
				<div class="entry">
					<form id="form1" name="form1" method="post" action="/SV-20/save/sacuvaj.jsp">

			<table>
			<tr>
				<td>Broj indexa:</td>
           	    <td><input name="brojIndeksa" type="text" style="height: 17px; width: 93px;"></td>
            </tr>
            <tr>
 				<td>Maticni broj registra:</td>
				<td><input name="MaticniBbrojRregistra" type="text" style="height: 17px; width: 93px;"></td>
			</tr>
			<tr>
				<td>Redni broj prijavnog lista:</td>
				<td><input name="RedniBrojPrijavnogLista" type="text" style="height:17px; width: 93px"></td>
			</tr>
			<tr>
				<td>Naziv fakulteta:</td>
				<td><input name="Naziv" type="text" style="height:17px; width: 250px;"></td>
			</tr>
			<tr>
				<td>Odsek-smer:</td>
				<td><input name="Smer" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Univerzitet:></td> 
				<td><input name="Univerzitet" type="text" style="height:17px; width: 250px;"></td>
			</tr>
			<tr>			
				<td>Mesto skole:</td> 
				<td><input name="MestoSkole" type="text" style="height:17px;"></td>
			</tr>
			<tr>			
				<td>Vrsta studija:</td>
				<td><input name="VrsteStudija" type="text" style="height:17px;"></td>
			</tr>
			<tr>			
				<td>Stepen studija:</td> 
				<td><input name="StepenStudija" type="text" style="height:17px;"></td>
			</tr>
			<tr>			
				<td>Nacin finansiranja:</td> 
				<td><input name="NacinFinansiranjaStudija" type="text" style="height:17px;"></td>
			</tr>
			<tr>			
				<td>Godina koja se upisuje:</td>
				<td><input name="GodinaStudijaKojaSeUpisuje" type="text" style="height:17px;"></td>
			</tr>
			<tr>			
				<td>Godina upisa na ovu skolu:</td> 
				<td><input name="GodinaUpisaUOvuSkolu" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Student ponovo upisuje godinu:</td> 
				<td><input name="StudentSePonovoUpisujeNaOvuGodinu" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Naziv predhodno zavrsene skole:</td> 
				<td><input name="NazivSkole" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Opstina predhodno zavrsene skole:</td>
				<td><input name="OpstinaSkole" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Godina zavrsetka skole:</td> 
				<td><input name="GodinaZavrsetaSkole" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Ime:</td>
				<td><input name="Ime" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Ime oca:</td> 
				<td><input name="ImeOca" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Prezime:</td> 
				<td><input name="Prezime" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Pol:</td> 
				<td><input name="Pol" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Godina rodjenja:</td> 
				<td><input name="GodinaRodjenja" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Mesto rodjenja:</td> 
				<td><input name="MestoRodjenja" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Opstina stalnog boravka:</td> 
				<td><input name="OpstinaSB" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Ulica i broj stalnog boravka:</td> 
				<td><input name="UlicaIBrojSB" type="text" style="height:17px; width: 250px;"></td>
			</tr>
			<tr>
				<td>Telefonski broj:</td> 
				<td><input name="BrojTelefonaSB" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Opstina (ili strana drzava)stanovanja za vreme studija:</td> 
				<td><input name="OpstinaSS" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Ulica i broj stanovanja za vreme studija:</td> 
				<td><input name="UlicaIBrojSS" type="text" style="height:17px; width: 250px;"></td>
			</tr>
			<tr>
				<td>Telefonski broj:</td> 
				<td><input name="BrojTelefonaSS" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Drzavljanstvo:</td> 
				<td><input name="Drzavljanstvo" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Nacionalna pripadnost:</td> 
				<td><input name="NacionalnaPripadnost" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Skolska sprema oca:</td> 
				<td><input name="SkolskaSpOca" type="text" style="height:17px; width: 150px;"></td>
			</tr>
			<tr>
				<td>Skolska sprema majke:</td>
				<td><input name="SkolskaSpMajke" type="text" style="height:17px; width: 150px;"></td>
			</tr>
			<tr>
				<td>Radni ststus roditelja-izdrzavaoca:</td> 
				<td><input name="RSRoditeljaIzdrzavaoca" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Radni status studenta:</td> 
				<td><input name="RSStudenta" type="text" style="height:17px;"></td>
			</tr>
			
			</table>
			<br>
			<br>
			<input align ="center" name="Sacuvaj" type="submit" value="Sacuvaj" style="width: 70px; height: 25px">
			</form>

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
		<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by .</p>
	</div>
	</div>
	<!-- end #footer -->
</div>
</body>
</html>
