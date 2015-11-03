<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">


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
				<li class="active"><a href="/SV-20/input/unos.jsp">Unos SV-20 obrasca</a></li>
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
				<h2 class="title"><a href="#">Welcome to Spontaneous </a></h2>
				<div class="entry">
						<% if (request.getParameter("Sacuvaj")!=null){
			String brojIndeksa = request.getParameter("brojIndeksa");
	  		String MaticniBbrojRregistra=request.getParameter("MaticniBbrojRregistra");
	   		String RedniBrojPrijavnogLista=request.getParameter("RedniBrojPrijavnogLista");
	   		String Naziv=request.getParameter("Naziv");
	   		String Smer=request.getParameter("Smer");
	   		String Univerzitet=request.getParameter("Univerzitet");
	   		String MestoSkole=request.getParameter("MestoSkole");
	   		String VrsteStudija = request.getParameter("VrsteStudija");
	   		String StepenStudija = request.getParameter("StepenStudija");
	   		String NacinFinansiranjaStudija = request.getParameter("NacinFinansiranjaStudija");
	   		String GodinaStudijaKojaSeUpisuje = request.getParameter("GodinaStudijaKojaSeUpisuje");
	   		String GodinaUpisaUOvuSkolu = request.getParameter("GodinaUpisaUOvuSkolu");
	   		String StudentSePonovoUpisujeNaOvuGodinu = request.getParameter("StudentSePonovoUpisujeNaOvuGodinu");
	   		String Ime = request.getParameter("Ime");
		    String ImeOca = request.getParameter("ImeOca");
	   		String Prezime = request.getParameter("Prezime");
	   		String Pol = request.getParameter("Pol");
	   		String GodinaRodjenja = request.getParameter("GodinaRodjenja");
	   		String MestoRodjenja = request.getParameter("MestoRodjenja");
	   		String OpstinaSB = request.getParameter("OpstinaSB");
	   		String UlicaIBrojSB = request.getParameter("UlicaIBrojSB");
	   		String BrojTelefonaSB = request.getParameter("BrojTelefonaSB");
	   		String OpstinaSS = request.getParameter("OpstinaSS");
	   		String UlicaIBrojSS = request.getParameter("UlicaIBrojSS");
	   		String BrojTelefonaSS = request.getParameter("BrojTelefonaSS");
	   		String Drzavljanstvo = request.getParameter("Drzavljanstvo");
	   		String NacionalnaPripadnost = request.getParameter("NacionalnaPripadnost");
	   		String SkolskaSpOca = request.getParameter("SkolskaSpOca");
	   		String SkolskaSpMajke = request.getParameter("SkolskaSpMajke");
	   		String RSRoditeljaIzdrzavaoca = request.getParameter("RSRoditeljaIzdrzavaoca");
	   		String RSStudenta = request.getParameter("RSStudenta");
	   		boolean ok = false;
	   		if ((request.getParameter("NazivSkole")!="")&&(request.getParameter("OpstinaSkole")!="")&&(request.getParameter("GodinaZavrsetaSkole")!="")){
	   			String NazivSkole = request.getParameter("NazivSkole");
	   			String OpstinaSkole=request.getParameter("OpstinaSkole");
	   			String GodinaZavrsetaSkole=request.getParameter("GodinaZavrsetaSkole");
	   			ok=UploadDB.kreirajDocument(brojIndeksa, MaticniBbrojRregistra,RedniBrojPrijavnogLista,Naziv,Smer,Univerzitet,MestoSkole,
	   					VrsteStudija,StepenStudija,NacinFinansiranjaStudija,GodinaStudijaKojaSeUpisuje,GodinaUpisaUOvuSkolu,StudentSePonovoUpisujeNaOvuGodinu, NazivSkole,OpstinaSkole,GodinaZavrsetaSkole,Ime,
	   					ImeOca,Prezime,Pol,GodinaRodjenja,MestoRodjenja,OpstinaSB,UlicaIBrojSB,BrojTelefonaSB,
	   					OpstinaSS,UlicaIBrojSS,BrojTelefonaSS,Drzavljanstvo,NacionalnaPripadnost,SkolskaSpOca,SkolskaSpMajke,RSRoditeljaIzdrzavaoca,RSStudenta);
	   		}else{
	   			ok=UploadDB.kreirajDocument2(brojIndeksa, MaticniBbrojRregistra,RedniBrojPrijavnogLista,Naziv,Smer,Univerzitet,MestoSkole,
	   					VrsteStudija,StepenStudija,NacinFinansiranjaStudija,GodinaStudijaKojaSeUpisuje,GodinaUpisaUOvuSkolu,StudentSePonovoUpisujeNaOvuGodinu, Ime,
	   					ImeOca,Prezime,Pol,GodinaRodjenja,MestoRodjenja,OpstinaSB,UlicaIBrojSB,BrojTelefonaSB,
	   					OpstinaSS,UlicaIBrojSS,BrojTelefonaSS,Drzavljanstvo, NacionalnaPripadnost,SkolskaSpOca,SkolskaSpMajke,RSRoditeljaIzdrzavaoca,RSStudenta);
	   		}
	   		if(ok){
		   		%><div class="post"><h1 class="title">Obrazac je uspesno sacuvan!</h1></div>
		   		<h2 class="title"><br>&nbsp;&nbsp;&nbsp;&nbsp;</h2><%
	   		}else{
	   			%><div class="post"><h1 class="title">Obrazac nije sacuvan!</h1></div><%
	   		}
	}else if (request.getParameter("Obrisi")!=null){
		boolean uRedu = UploadDB.brisiDokument(request.getParameter("brojIndeksa"));
		if (uRedu){
			%><h1 class="title">Obrazac je uspesno izbrisan!</h1><%
   		}else{
   			%><h1 class="title">Obrazac nije izbrisan!<%
		}
	}
	%>

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
