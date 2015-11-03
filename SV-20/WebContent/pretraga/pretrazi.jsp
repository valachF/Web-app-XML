<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF-8" import="model.*, java.io.ByteArrayInputStream, java.util.Vector, java.util.Enumeration,
    javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.Document, org.w3c.dom.Element,
    org.w3c.dom.Node, org.w3c.dom.NodeList" %>


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
				<h2 class="title">Rezultati pretrage</h2>
				<div class="entry">
					
                            
<jsp:useBean id="uploadDB" scope="session" class="model.UploadDB"/>
	<% Vector vektor = new Vector();
	   String Ime = request.getParameter("Ime");
	   String Prezime = request.getParameter("Prezime");
	   String Smer = request.getParameter("Smer");
	   String GodinaRodjenja = request.getParameter("GodinaRodjenja");

	   String upit = "for $x in /SV20 \nwhere ";
	   	upit +=" contains(lower-case($x/PodatkePopunjavaStudent/LicniPodaci/Ime),lower-case('"+Ime+"'))";
	   	upit +=" and contains(lower-case($x/PodatkePopunjavaStudent/LicniPodaci/Prezime),lower-case('"+Prezime+"'))";
	   	upit +=" and contains(lower-case($x/PodatkePopunjavaStudent/PodaciOFakultetu/NazivFakulteta/Smer),lower-case('"+Smer+"'))";
	   	upit +=" and contains(lower-case($x/PodatkePopunjavaStudent/LicniPodaci/GodinaRodjenja),lower-case('"+GodinaRodjenja+"'))";
	   	upit +=" return <Result brojIndeksa='{$x/@brojIndeksa}'>{$x/PodatkePopunjavaStudent/LicniPodaci/Ime}{$x/PodatkePopunjavaStudent/LicniPodaci/Prezime}{$x/PodatkePopunjavaStudent/PodaciOFakultetu/NazivFakulteta/Smer}{$x/PodatkePopunjavaStudent/LicniPodaci/GodinaRodjenja}</Result>";

	   String pronadjeno = Pretraga.pretraziBazu(upit);

	   if(pronadjeno != null) {
			try {
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				Document doc = db.parse(new ByteArrayInputStream(pronadjeno.getBytes("UTF-8")));
				doc.getDocumentElement().normalize();
				NodeList results = doc.getElementsByTagName("Result");
				int brojNadj = results.getLength();
				//System.out.println(brojNadj);
				//uploadDB.setBrojNadjenih(brojNadj);
				//String imenaNadjenihZenika[] = new String[brojNadj];
				//String prezimenaNadjenihZenika[] = new String[brojNadj];
				//String imenaNadjenihNevesta[] = new String[brojNadj];
				//String prezimenaNadjenihNevesta[] = new String[brojNadj];
				
				for (int s = 0; s < brojNadj; s++) {
					Node node = results.item(s);
					String brojIndeksa = ""; 
					String ImeNadjenogStudenta ="";
					String PrezimeNadjenogStudenta ="";
					String SmerNadjenogStudenta ="";
					String GodinaRodjenjaNadjenogStudenta ="";
					
					Element elemResults = (Element) node;
					
					brojIndeksa = elemResults.getAttribute("brojIndeksa");
			
					Element elemImeStudenta = (Element) elemResults.getElementsByTagName("Ime").item(0);
					ImeNadjenogStudenta = ((Node) elemImeStudenta.getChildNodes().item(0)).getNodeValue();
					//imenaNadjenihZenika[s]=imeNadjenogZenika;
					//System.out.println(imenaNadjenihZenika[s]);
					
					Element elemPrezimeStudenta = (Element) elemResults.getElementsByTagName("Prezime").item(0);
					PrezimeNadjenogStudenta = ((Node) elemPrezimeStudenta.getChildNodes().item(0)).getNodeValue();
					//prezimenaNadjenihZenika[s]=prezimeNadjenogZenika;
					//System.out.println(prezimenaNadjenihZenika[s]);
					
					Element elemSmerStudenta = (Element) elemResults.getElementsByTagName("Smer").item(0);
					SmerNadjenogStudenta = ((Node) elemSmerStudenta.getChildNodes().item(0)).getNodeValue();
					//imenaNadjenihNevesta[s]=imeNadjeneNeveste;
					//System.out.println(imenaNadjenihNevesta[s]);
					
					Element elemGodinaRodjenjaStudenta = (Element) elemResults.getElementsByTagName("GodinaRodjenja").item(0);
					GodinaRodjenjaNadjenogStudenta = ((Node) elemGodinaRodjenjaStudenta.getChildNodes().item(0)).getNodeValue();
					//prezimenaNadjenihNevesta[s]=prezimeNadjeneNeveste;
					//System.out.println(prezimenaNadjenihNevesta[s]);
					
					Vector pom = new Vector();
					pom.add(brojIndeksa);
					pom.add(ImeNadjenogStudenta);
					pom.add(PrezimeNadjenogStudenta);
					pom.add(SmerNadjenogStudenta);
					pom.add(GodinaRodjenjaNadjenogStudenta);
					vektor.add(pom);
					//System.out.println("s"+vektor);
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Greska prilikom prikaza rezultata!!");
			}
			//System.out.println("res"+vektor);
			uploadDB.setVector(vektor);
	}  
	%>
	<br>
	<table border="2" cellpadding="4px">
		<tr>
			<td><h3>Broj Indexa</td><td><h3>Ime Studenta</h3></td><td><h3>Prezime Studenta</h3></td><td><h3>Smer</h3></td><td><h3>Godina Rodjenja</h3></td>
		</tr>
		<%	Vector vektorce = uploadDB.getVector();
			//System.out.println("Elem su: "+vektorce);
			Enumeration e1 = vektorce.elements();
			while (e1.hasMoreElements()){
				Vector temp = (Vector) e1.nextElement();%>
			<tr align="center">
				<td><h3><%=temp.elementAt(0)%></h3></td>
				<td><h3><%=temp.elementAt(1)%></td><td><h3><%=temp.elementAt(2)%></h3></td>
				<td><h3><%=temp.elementAt(3)%></td><td><h3><%=temp.elementAt(4)%></h3></td>
			</tr>
			<%} %>
	</table>
	<br><br><br>
	
	<form id="form1" name="form1" method="post" action="/SV-20/update/azuriraj.jsp">
			<tr>
				<td align="right"><h3>Broj Indexa:&nbsp;&nbsp;&nbsp;</h3></td>
					<br>
					<td><select name= "combStudenti">
 						 <%  for(int i=0; i <vektorce.size(); i++){
  				  				Vector pomoc = (Vector)vektorce.elementAt(i);
  						%><option value="<%=pomoc.elementAt(0)%>"><%=pomoc.elementAt(0)%></option>     
 			 					<%  }
 						 %>

					</select> </td>
			</tr>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input align ="right" name="submit" type="submit" value="Prikazi" style="width: 70px; height: 25px"><br>
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
		<p>Copyright (c) 2008 Sitename.com. All rights reserved. Design by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
	</div>
	</div>
	<!-- end #footer -->
</div>
</body>
</html>
