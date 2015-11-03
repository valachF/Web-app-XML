package model;

import java.io.File;
import java.util.Vector;

import javax.xml.transform.OutputKeys;

import noNamespace.SV20Document;
import noNamespace.SV20Document.SV20;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStatistika;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent.PodaciOFakultetu;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent.PodaciOFakultetu.NazivFakulteta;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent.PodaciOStudiranju;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent.PodaciOStudiranju.PredhodnoZavrsenaSrednjaSkola;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci.Adresa;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci.Adresa.StalnogBoravka;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci.Adresa.StanovanjaZaVremeStudija;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci.SkolskaSpremaRoditelja;
import noNamespace.SV20Document.SV20.PodatkePopunjavaStudent.LicniPodaci.RadniStatus;

import org.apache.xerces.dom.*;
import org.apache.xmlbeans.XmlOptions;
import org.w3c.dom.*;
import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.Resource;
import org.xmldb.api.base.ResourceIterator;
import org.xmldb.api.base.ResourceSet;
import org.xmldb.api.modules.XMLResource;
import org.xmldb.api.modules.XPathQueryService;



public class UploadDB {
	
	private Vector vector = new Vector();
	
	public void setVector(Vector vect){
		this.vector=vect;
	}
	
	public Vector getVector(){
		return vector;
	}
	
	private int brojNadjenih = 0;
	
	public void setBrojNadjenih(int brojNadjenih){
		this.brojNadjenih = brojNadjenih;
	}
	
	public int getBrojNadjenih(){
		return brojNadjenih;
	}
	
	private String imenaPronadjenihStudenata[] = new String[100];
	
	public void setImenaPronadjenihStudenata(String imenaPronadjenihStudenata[]){
		for(int i = 0; i<getBrojNadjenih(); i++){
			this.imenaPronadjenihStudenata[i]=imenaPronadjenihStudenata[i];
		}
	}
	
	public String getImenaPronadjenihStudenata(int i){
		return imenaPronadjenihStudenata[i];
	}
	
	private String prezimenaPronadjenihStudenata[] = new String[100];
	
	public void setPrezimenaPronadjenihStudenata(String prezimenaPronadjenihStudenata[]){
		for(int i = 0; i<getBrojNadjenih(); i++){
			this.prezimenaPronadjenihStudenata[i]=prezimenaPronadjenihStudenata[i];
		}
	}
	
	public String getPrezimenaPronadjenihZenika(int i){
		return prezimenaPronadjenihStudenata[i];
	}
	
private String smeroviPronadjenihStudenata[] = new String[100];
	
	public void setsmeroviPronadjenihStudenata(String smeroviPronadjenihStudenata[]){
		for(int i = 0; i<getBrojNadjenih(); i++){
			this.smeroviPronadjenihStudenata[i]=smeroviPronadjenihStudenata[i];
		}
	}
	
	public String getsmeroviPronadjenihStudenata(int i){
		return smeroviPronadjenihStudenata[i];
	}
	
private String GodinaRodjenja[] = new String[100];
	
	public void setGodinaRodjenja(String GodinaRodjenja[]){
		for(int i = 0; i<getBrojNadjenih(); i++){
			this.GodinaRodjenja[i]=GodinaRodjenja[i];
		}
	}
	
	public String getGodinaRodjenja(int i){
		return GodinaRodjenja[i];
	}

	

	
	private void uploadToDB(File f){
		try{
		      Collection col = DatabaseManager.getCollection(DBConnection.URI+"/db/SV-20","admin","xmlbp");
		      XMLResource document = (XMLResource)col.createResource(null, "XMLResource");
		      document.setContent(f);
		      col.storeResource(document);
		      col.close();
		    }
		    catch(Exception e)
		    {
		      System.out.println("Doslo je do greske!");
		      e.printStackTrace();
		    }
	}
	
	public static boolean kreirajDocument(
			String brojIndeksa, String MaticniBbrojRregistra, String RedniBrojPrijavnogLista,String Naziv,String Smer,String Univerzitet,
			String MestoSkole, String VrsteStudija, String StepenStudija, String NacinFinansiranjaStudija,
			String GodinaStudijaKojaSeUpisuje, String GodinaUpisaUOvuSkolu, String StudentSePonovoUpisujeNaOvuGodinu, String NazivSkole,
			String OpstinaSkole, String GodinaZavrsetaSkole, String Ime, String ImeOca, String Prezime,
			String Pol, String GodinaRodjenja, String MestoRodjenja, String OpstinaSB,
			String UlicaIBrojSB, String BrojTelefonaSB, String OpstinaSS, String UlicaIBrojSS,
			String BrojTelefonaSS, String Drzavljanstvo, String NacionalnaPripadnost, String SkolskaSpOca, String SkolskaSpMajke,
			String RSRoditeljaIzdrzavaoca, String RSStudenta){
			
			
			SV20Document doc = SV20Document.Factory.newInstance();
			SV20Document.SV20 obrazac= doc.addNewSV20();
			
			PodatkePopunjavaStatistika podatkePopunjavaStatistika = PodatkePopunjavaStatistika.Factory.newInstance();
			podatkePopunjavaStatistika.setMaticniBbrojRregistra(MaticniBbrojRregistra);
			podatkePopunjavaStatistika.setRedniBrojPrijavnogLista(RedniBrojPrijavnogLista);
			

			NazivFakulteta nazivFakulteta = NazivFakulteta.Factory.newInstance();
			nazivFakulteta.setNaziv(Naziv);
			nazivFakulteta.setSmer(Smer);
			nazivFakulteta.setUniverzitet(Univerzitet);
			
			
			PodaciOFakultetu podaciOFakultetu = PodaciOFakultetu.Factory.newInstance();
			podaciOFakultetu.setNazivFakulteta(nazivFakulteta);
			
			podaciOFakultetu.setMestoSkole(MestoSkole);
			
		    
			
		    PredhodnoZavrsenaSrednjaSkola predhodnoZavrsenaSrednjaSkola=PredhodnoZavrsenaSrednjaSkola.Factory.newInstance();
		    predhodnoZavrsenaSrednjaSkola.setNazivSkole(NazivSkole);
		    predhodnoZavrsenaSrednjaSkola.setOpstinaSkole(OpstinaSkole);
		    predhodnoZavrsenaSrednjaSkola.setGodinaZavrsetaSkole(GodinaZavrsetaSkole);
			
			PodaciOStudiranju podaciOStudiranju = PodaciOStudiranju.Factory.newInstance();
			podaciOStudiranju.setVrsteStudija(VrsteStudija);
			podaciOStudiranju.setStepenStudija(StepenStudija);
			podaciOStudiranju.setNacinFinansiranjaStudija(NacinFinansiranjaStudija);
			podaciOStudiranju.setGodinaStudijaKojaSeUpisuje(GodinaStudijaKojaSeUpisuje);
			podaciOStudiranju.setGodinaUpisaUOvuSkolu(GodinaUpisaUOvuSkolu);
			podaciOStudiranju.setStudentSePonovoUpisujeNaOvuGodinu(StudentSePonovoUpisujeNaOvuGodinu);
			
			podaciOStudiranju.setPredhodnoZavrsenaSrednjaSkola(predhodnoZavrsenaSrednjaSkola);
			
			StalnogBoravka adrStalnogBoravka=StalnogBoravka.Factory.newInstance();
			adrStalnogBoravka.setOpstinaSB(OpstinaSB);
			adrStalnogBoravka.setUlicaIBrojSB(UlicaIBrojSB);
			adrStalnogBoravka.setBrojTelefonaSB(BrojTelefonaSB);
			
			StanovanjaZaVremeStudija adrStanovanjaZaVremeStudija=StanovanjaZaVremeStudija.Factory.newInstance();
			adrStanovanjaZaVremeStudija.setOpstinaSS(OpstinaSS);
			adrStanovanjaZaVremeStudija.setUlicaIBrojSS(UlicaIBrojSS);
			adrStanovanjaZaVremeStudija.setBrojTelefonaSS(BrojTelefonaSB);
			
			Adresa adresa=Adresa.Factory.newInstance();
			adresa.setStalnogBoravka(adrStalnogBoravka);
			adresa.setStanovanjaZaVremeStudija(adrStanovanjaZaVremeStudija);
			
			SkolskaSpremaRoditelja skolsakaSpremaRoditelja=SkolskaSpremaRoditelja.Factory.newInstance();
			skolsakaSpremaRoditelja.setSkolskaSpOca(SkolskaSpOca);
			skolsakaSpremaRoditelja.setSkolskaSpMajke(SkolskaSpMajke);
			
			RadniStatus radniStatus=RadniStatus.Factory.newInstance();
			radniStatus.setRSRoditeljaIzdrzavaoca(RSRoditeljaIzdrzavaoca);
			radniStatus.setRSStudenta(RSStudenta);
			
			
			LicniPodaci licniPodaci=LicniPodaci.Factory.newInstance();
			licniPodaci.setIme(Ime);
			licniPodaci.setImeOca(ImeOca);
			licniPodaci.setPrezime(Prezime);
			licniPodaci.setPol(Pol);
			licniPodaci.setGodinaRodjenja(GodinaRodjenja);
			
			licniPodaci.setAdresa(adresa);
			
			licniPodaci.setMestoRodjenja(MestoRodjenja);
			licniPodaci.setDrzavljanstvo(Drzavljanstvo);
			licniPodaci.setNacionalnaPripadnost(NacionalnaPripadnost);
			
			licniPodaci.setSkolskaSpremaRoditelja(skolsakaSpremaRoditelja);
			licniPodaci.setRadniStatus(radniStatus);
			
			
			PodatkePopunjavaStudent podatkePopunjavaStudent=PodatkePopunjavaStudent.Factory.newInstance();
			podatkePopunjavaStudent.setPodaciOFakultetu(podaciOFakultetu);
			podatkePopunjavaStudent.setPodaciOStudiranju(podaciOStudiranju);
			podatkePopunjavaStudent.setLicniPodaci(licniPodaci);
			
			obrazac.setBrojIndeksa(brojIndeksa);
			obrazac.setPodatkePopunjavaStatistika(podatkePopunjavaStatistika);
			obrazac.setPodatkePopunjavaStudent(podatkePopunjavaStudent);
			
			doc.setSV20(obrazac);
			
		if (doc.validate()) {
			
			XmlOptions opts = new XmlOptions();
			opts.setSavePrettyPrint();
			try {
		        Collection col =
		            DatabaseManager.getCollection(DBConnection.URI+"/db/SV-20","admin","xmlbp");

		        XMLResource res = (XMLResource)col.createResource(brojIndeksa, "XMLResource");
		        res.setContent(doc.xmlText());
		        col.storeResource(res);
				return true;
			} catch (Exception e) {
				return false;
			}
		} else {
			return false;
		}
	}
	
	
	public static boolean kreirajDocument2(
			String brojIndeksa, String MaticniBbrojRregistra, String RedniBrojPrijavnogLista,String Naziv,String Smer,String Univerzitet,
			String MestoSkole, String VrsteStudija, String StepenStudija, String NacinFinansiranjaStudija,
			String GodinaStudijaKojaSeUpisuje, String GodinaUpisaUOvuSkolu, String StudentSePonovoUpisujeNaOvuGodinu, String Ime, String ImeOca, String Prezime,
			String Pol, String GodinaRodjenja, String MestoRodjenja, String OpstinaSB,
			String UlicaIBrojSB, String BrojTelefonaSB, String OpstinaSS, String UlicaIBrojSS,
			String BrojTelefonaSS, String Drzavljanstvo, String NacionalnaPripadnost, String SkolskaSpOca, String SkolskaSpMajke,
			String RSRoditeljaIzdrzavaoca, String RSStudenta){
			
			
			SV20Document doc = SV20Document.Factory.newInstance();
			SV20Document.SV20 obrazac= doc.addNewSV20();
			
			PodatkePopunjavaStatistika podatkePopunjavaStatistika = PodatkePopunjavaStatistika.Factory.newInstance();
			podatkePopunjavaStatistika.setMaticniBbrojRregistra(MaticniBbrojRregistra);
			podatkePopunjavaStatistika.setRedniBrojPrijavnogLista(RedniBrojPrijavnogLista);
			

			NazivFakulteta nazivFakulteta = NazivFakulteta.Factory.newInstance();
			nazivFakulteta.setNaziv(Naziv);
			nazivFakulteta.setSmer(Smer);
			nazivFakulteta.setUniverzitet(Univerzitet);
			
			
			PodaciOFakultetu podaciOFakultetu = PodaciOFakultetu.Factory.newInstance();
			podaciOFakultetu.setNazivFakulteta(nazivFakulteta);
			
			podaciOFakultetu.setMestoSkole(MestoSkole);
			
	
			
			PodaciOStudiranju podaciOStudiranju = PodaciOStudiranju.Factory.newInstance();
			podaciOStudiranju.setVrsteStudija(VrsteStudija);
			podaciOStudiranju.setStepenStudija(StepenStudija);
			podaciOStudiranju.setNacinFinansiranjaStudija(NacinFinansiranjaStudija);
			podaciOStudiranju.setGodinaStudijaKojaSeUpisuje(GodinaStudijaKojaSeUpisuje);
			podaciOStudiranju.setGodinaUpisaUOvuSkolu(GodinaUpisaUOvuSkolu);
			podaciOStudiranju.setStudentSePonovoUpisujeNaOvuGodinu(StudentSePonovoUpisujeNaOvuGodinu);
			
			
			StalnogBoravka adrStalnogBoravka=StalnogBoravka.Factory.newInstance();
			adrStalnogBoravka.setOpstinaSB(OpstinaSB);
			adrStalnogBoravka.setUlicaIBrojSB(UlicaIBrojSB);
			adrStalnogBoravka.setBrojTelefonaSB(BrojTelefonaSB);
			
			StanovanjaZaVremeStudija adrStanovanjaZaVremeStudija=StanovanjaZaVremeStudija.Factory.newInstance();
			adrStanovanjaZaVremeStudija.setOpstinaSS(OpstinaSS);
			adrStanovanjaZaVremeStudija.setUlicaIBrojSS(UlicaIBrojSS);
			adrStanovanjaZaVremeStudija.setBrojTelefonaSS(BrojTelefonaSB);
			
			Adresa adresa=Adresa.Factory.newInstance();
			adresa.setStalnogBoravka(adrStalnogBoravka);
			adresa.setStanovanjaZaVremeStudija(adrStanovanjaZaVremeStudija);
			
			SkolskaSpremaRoditelja skolsakaSpremaRoditelja=SkolskaSpremaRoditelja.Factory.newInstance();
			skolsakaSpremaRoditelja.setSkolskaSpOca(SkolskaSpOca);
			skolsakaSpremaRoditelja.setSkolskaSpMajke(SkolskaSpMajke);
			
			RadniStatus radniStatus=RadniStatus.Factory.newInstance();
			radniStatus.setRSRoditeljaIzdrzavaoca(RSRoditeljaIzdrzavaoca);
			radniStatus.setRSStudenta(RSStudenta);
			
			
			LicniPodaci licniPodaci=LicniPodaci.Factory.newInstance();
			licniPodaci.setIme(Ime);
			licniPodaci.setImeOca(ImeOca);
			licniPodaci.setPrezime(Prezime);
			licniPodaci.setPol(Pol);
			licniPodaci.setGodinaRodjenja(GodinaRodjenja);
			
			licniPodaci.setAdresa(adresa);
			
			licniPodaci.setMestoRodjenja(MestoRodjenja);
			licniPodaci.setDrzavljanstvo(Drzavljanstvo);
			licniPodaci.setNacionalnaPripadnost(NacionalnaPripadnost);
			
			licniPodaci.setSkolskaSpremaRoditelja(skolsakaSpremaRoditelja);
			licniPodaci.setRadniStatus(radniStatus);
			
			
			PodatkePopunjavaStudent podatkePopunjavaStudent=PodatkePopunjavaStudent.Factory.newInstance();
			podatkePopunjavaStudent.setPodaciOFakultetu(podaciOFakultetu);
			podatkePopunjavaStudent.setPodaciOStudiranju(podaciOStudiranju);
			podatkePopunjavaStudent.setLicniPodaci(licniPodaci);
			
			obrazac.setBrojIndeksa(brojIndeksa);
			obrazac.setPodatkePopunjavaStatistika(podatkePopunjavaStatistika);
			obrazac.setPodatkePopunjavaStudent(podatkePopunjavaStudent);
			
			doc.setSV20(obrazac);
		if (doc.validate()) {
			
			XmlOptions opts = new XmlOptions();
			opts.setSavePrettyPrint();
			try {
		        Collection col =
		            DatabaseManager.getCollection(DBConnection.URI+"/db/SV-20","admin","xmlbp");

		        XMLResource res = (XMLResource)col.createResource(brojIndeksa, "XMLResource");
		        res.setContent(doc.xmlText());
		        col.storeResource(res);
				return true;
			} catch (Exception e) {
				return false;
			}
		} else {
			return false;
		}
	}
	
	
	public static boolean brisiDokument(String id) {
		try {
			Collection col = DatabaseManager.getCollection(DBConnection.URI+"/db/SV-20","admin","xmlbp");
			col.setProperty(OutputKeys.INDENT, "no");
			XMLResource res = (XMLResource)col.getResource(id);
			col.removeResource(res);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	}
	
}
