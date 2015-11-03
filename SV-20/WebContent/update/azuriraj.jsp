<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page language="java" import= "java.util.Vector" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="noNamespace.SV20Document, model.Pretraga"%>
<%@page import="noNamespace.SV20Document.SV20"%>
<%@page import="noNamespace.SV20Document.SV20.PodatkePopunjavaStatistika"%><html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
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
				<h2 class="title"></h2>
				<div class="entry">
					
                                    <h1 class="title">Azuriranje SV20 obrasca</h1>
			<div class="entry">
			<form id="form1" name="form1" method="post" action="/SV-20/save/sacuvaj.jsp">
			<%String brojIndeksa = request.getParameterValues("combStudenti")[0];
			SV20Document obrazacDok = Pretraga.nadjiDokument(brojIndeksa);
			SV20Document.SV20 obrazac = obrazacDok.getSV20();
			SV20Document.SV20.PodatkePopunjavaStatistika PodatkePopunjavaStatistika=obrazac.getPodatkePopunjavaStatistika();
			SV20Document.SV20.PodatkePopunjavaStudent PodatkePopunjavaStudent=obrazac.getPodatkePopunjavaStudent();
			String MaticniBbrojRregistra = PodatkePopunjavaStatistika.getMaticniBbrojRregistra();
			String RedniBrojPrijavnogLista = PodatkePopunjavaStatistika.getRedniBrojPrijavnogLista();
			
			SV20Document.SV20.PodatkePopunjavaStudent.PodaciOFakultetu PodaciOFakultetu=PodatkePopunjavaStudent.getPodaciOFakultetu();
			SV20Document.SV20.PodatkePopunjavaStudent.PodaciOFakultetu.NazivFakulteta NazivFakulteta=PodaciOFakultetu.getNazivFakulteta();
			String Naziv=NazivFakulteta.getNaziv();
			String Smer=NazivFakulteta.getSmer();
			String Univerzitet=NazivFakulteta.getUniverzitet();
			String MestoSkole=PodaciOFakultetu.getMestoSkole();
			
			SV20Document.SV20.PodatkePopunjavaStudent.PodaciOStudiranju PodaciOStudiranju=PodatkePopunjavaStudent.getPodaciOStudiranju();
			String VrsteStudija=PodaciOStudiranju.getVrsteStudija();
			String StepenStudija=PodaciOStudiranju.getStepenStudija();
			String NacinFinansiranjaStudija=PodaciOStudiranju.getNacinFinansiranjaStudija();
			String GodinaStudijaKojaSeUpisuje=PodaciOStudiranju.getGodinaStudijaKojaSeUpisuje();
			String GodinaUpisaUOvuSkolu=PodaciOStudiranju.getGodinaUpisaUOvuSkolu();
			String StudentSePonovoUpisujeNaOvuGodinu=PodaciOStudiranju.getStudentSePonovoUpisujeNaOvuGodinu();
			
			SV20Document.SV20.PodatkePopunjavaStudent.PodaciOStudiranju.PredhodnoZavrsenaSrednjaSkola PredhodnoZavrsenaSrednjaSkola=PodaciOStudiranju.getPredhodnoZavrsenaSrednjaSkola();
			
			
			SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci LicniPodaci=PodatkePopunjavaStudent.getLicniPodaci();
		    String Ime=LicniPodaci.getIme();
		    String ImeOca=LicniPodaci.getImeOca();
		    String Prezime=LicniPodaci.getPrezime();
		    String Pol=LicniPodaci.getPol();
		    String GodinaRodjenja=LicniPodaci.getGodinaRodjenja();
		    String MestoRodjenja=LicniPodaci.getMestoRodjenja();
		    
		    SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci.Adresa Adresa= LicniPodaci.getAdresa();
		    SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci.Adresa.StalnogBoravka StalnogBoravka=Adresa.getStalnogBoravka();
		    SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci.Adresa.StanovanjaZaVremeStudija StanovanjaZaVremeStudija=Adresa.getStanovanjaZaVremeStudija();
		    String OpstinaSB=StalnogBoravka.getOpstinaSB();
		    String UlicaIBrojSB=StalnogBoravka.getUlicaIBrojSB();
		    String BrojTelefonaSB=StalnogBoravka.getBrojTelefonaSB();
		    
		    String OpstinaSS=StanovanjaZaVremeStudija.getOpstinaSS();
		    String UlicaIBrojSS=StanovanjaZaVremeStudija.getUlicaIBrojSS();
		    String BrojTelefonaSS=StanovanjaZaVremeStudija.getBrojTelefonaSS();
		    
		    String Drzavljanstvo=LicniPodaci.getDrzavljanstvo();
		    String NacionalnaPripadnost=LicniPodaci.getNacionalnaPripadnost();
		    
		    SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci.SkolskaSpremaRoditelja SkolskaSpremaRoditelja=LicniPodaci.getSkolskaSpremaRoditelja();
		    String SkolskaSpOca=SkolskaSpremaRoditelja.getSkolskaSpOca();
		    String SkolskaSpMajke=SkolskaSpremaRoditelja.getSkolskaSpMajke();
		    
		    SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci.RadniStatus RadniStatus=LicniPodaci.getRadniStatus();
		    String RSRoditeljaIzdrzavaoca=RadniStatus.getRSRoditeljaIzdrzavaoca();
		    String RSStudenta=RadniStatus.getRSStudenta();
					
			%>
			<br><br><br>
			<table>
			<tr>
				<td>Broj indexa:</td>
           	    <td><input name="brojIndeksa" value="<%=brojIndeksa%>"  type="text" style="height: 17px; width: 93px;"></td>
            </tr>
            <tr>
 				<td>Maticni broj registra:</td>
				<td><input name="MaticniBbrojRregistra" value="<%=MaticniBbrojRregistra%>"  type="text" style="height: 17px; width: 93px;"></td>
			</tr>
			<tr>
				<td>Redni broj prijavnog lista:</td>
				<td><input name="RedniBrojPrijavnogLista" value="<%=RedniBrojPrijavnogLista%>"  type="text" style="height:17px; width: 93px"></td>
			</tr>
			<tr>
				<td>Naziv fakulteta:</td>
				<td><input name="Naziv" type="text" value="<%=Naziv%>"  style="height:17px; width: 250px;"></td>
			</tr>
			<tr>
				<td>Odsek-smer:</td>
				<td><input name="Smer" value="<%=Smer%>"  type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Univerzitet:></td> 
				<td><input name="Univerzitet" value="<%=Univerzitet%>" type="text" style="height:17px; width: 250px;"></td>
			</tr>
			<tr>			
				<td>Mesto skole:</td> 
				<td><input name="MestoSkole" value="<%=MestoSkole%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>			
				<td>Vrsta studija:</td>
				<td><input name="VrsteStudija" value="<%=VrsteStudija%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>			
				<td>Stepen studija:</td> 
				<td><input name="StepenStudija" value="<%=StepenStudija%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>			
				<td>Nacin finansiranja:</td> 
				<td><input name="NacinFinansiranjaStudija" value="<%=NacinFinansiranjaStudija%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>			
				<td>Godina koja se upisuje:</td>
				<td><input name="GodinaStudijaKojaSeUpisuje" value="<%=GodinaStudijaKojaSeUpisuje%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>			
				<td>Godina upisa na ovu skolu:</td> 
				<td><input name="GodinaUpisaUOvuSkolu" value="<%=GodinaUpisaUOvuSkolu%>"  type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Student ponovo upisuje godinu:</td> 
				<td><input name="StudentSePonovoUpisujeNaOvuGodinu" value="<%=StudentSePonovoUpisujeNaOvuGodinu%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Ime:</td>
				<td><input name="Ime" value="<%=Ime%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Ime oca:</td> 
				<td><input name="ImeOca" value="<%=ImeOca%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Prezime:</td> 
				<td><input name="Prezime" value="<%=Prezime%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Pol:</td> 
				<td><input name="Pol" value="<%=Pol%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Godina rodjenja:</td> 
				<td><input name="GodinaRodjenja" value="<%=GodinaRodjenja%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Mesto rodjenja:</td> 
				<td><input name="MestoRodjenja" value="<%=MestoRodjenja%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Opstina stalnog boravka:</td> 
				<td><input name="OpstinaSB" value="<%=OpstinaSB%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Ulica i broj stalnog boravka:</td> 
				<td><input name="UlicaIBrojSB" value="<%=UlicaIBrojSB%>" type="text" style="height:17px; width: 250px;"></td>
			</tr>
			<tr>
				<td>Telefonski broj:</td> 
				<td><input name="BrojTelefonaSB" value="<%=BrojTelefonaSB%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Opstina (ili strana drzava)stanovanja za vreme studija:</td> 
				<td><input name="OpstinaSS" value="<%=OpstinaSS%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Ulica i broj stanovanja za vreme studija:</td> 
				<td><input name="UlicaIBrojSS" value="<%=UlicaIBrojSS%>" type="text" style="height:17px; width: 250px;"></td>
			</tr>
			<tr>
				<td>Telefonski broj:</td> 
				<td><input name="BrojTelefonaSS" value="<%=BrojTelefonaSS%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Drzavljanstvo:</td> 
				<td><input name="Drzavljanstvo" value="<%=Drzavljanstvo%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Nacionalna pripadnost:</td> 
				<td><input name="NacionalnaPripadnost" value="<%=NacionalnaPripadnost%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Skolska sprema oca:</td> 
				<td><input name="SkolskaSpOca" value="<%=SkolskaSpOca%>" type="text" style="height:17px; width: 150px;"></td>
			</tr>
			<tr>
				<td>Skolska sprema majke:</td>
				<td><input name="SkolskaSpMajke" value="<%=SkolskaSpMajke%>" type="text" style="height:17px; width: 150px;"></td>
			</tr>
			<tr>
				<td>Radni ststus roditelja-izdrzavaoca:</td> 
				<td><input name="RSRoditeljaIzdrzavaoca" value="<%=RSRoditeljaIzdrzavaoca%>" type="text" style="height:17px;"></td>
			</tr>
			<tr>
				<td>Radni status studenta:</td> 
				<td><input name="RSStudenta" value="<%=RSStudenta%>" type="text" style="height:17px;"></td>
			</tr>
			
			</table>
			<br><br>
			<h3>Podaci o predhodno zavrsenoj srednjoj skoli:</h3>
			<%			
			String NazivSkole = PredhodnoZavrsenaSrednjaSkola.getNazivSkole();			
			String OpstinaSkole=PredhodnoZavrsenaSrednjaSkola.getOpstinaSkole();
			String GodinaZavrsetaSkole=PredhodnoZavrsenaSrednjaSkola.getGodinaZavrsetaSkole();
			if ((NazivSkole!=null)&& (OpstinaSkole!=null) && (GodinaZavrsetaSkole!=null)){%>
				<label id="Label1">
			<table>
			<tr>
				<td>Naziv skole:</td> 
				<td><input name="NazivSkole" value="<%=NazivSkole%>" type="text" style="height:17px; width: 150px;"></td>
			</tr>
			<tr>
				<td>Opstina skole:</td>
				<td><input name="OpstinaSkole" value="<%=OpstinaSkole%>" type="text" style="height:17px; width: 150px;"></td>
			</tr>
			<tr>
				<td>Godina zavrsetka skole:</td> 
				<td>><input name="GodinaZavrsetaSkole" value="<%=GodinaZavrsetaSkole%>" type="text" style="height:17px; width: 150px;"></td>
			</tr>
			</table>
			</label>
			<%}else{%>
			<table>
			<tr>
		    	<td>Naziv predhodno zavrsene skole:</td> 
			    <td><input name="NazivSkole" value="" type="text" style="height:17px; width: 150px;"></td>
			</tr>
			<tr>
				<td>Opstina predhodno zavrsene skole:</td>
				<td><input name="OpstinaSkole" value="" type="text" style="height:17px; width: 150px;"></td>
			</tr>
			<tr>
				<td>Godina zavrsetka skole:</td> 
				<td><input name="GodinaZavrsetaSkole" value="" type="text" style="height:17px; width: 150px;"></td>
			</tr>
			</table>
			</label>
			<%}%>
			<br/>
			<br>
			<input align ="center" name="Sacuvaj" type="submit" value="Azuriraj" style="width: 70px; height: 25px">
			<input align ="center" name="Obrisi" type="submit" value="Obrisi" style="width: 70px; height: 25px">
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
