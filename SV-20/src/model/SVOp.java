package model;

import org.xmldb.api.base.*;
import org.xmldb.api.modules.*;
import org.xmldb.api.*;
import java.net.URL;
import java.util.Vector;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


public class SVOp {
	/** 
	 * Vraca sve SV obrasce koje se nalaze u kolekciji
	 * @return
	 * XMLResource[]
	 */
	
	private Vector linkovi=new Vector();
	
	private Vector data=new Vector();
	
	private Vector xmlRes=new Vector();
	
	public Vector getLinks(){
		return linkovi;
	}
	
	public Vector getXmlRes(){
		return xmlRes;
	}
	
	public Vector getData(){
		return data;
	}
	
	
	
	 public void traverse (Node node) {
		 
	      int type = node.getNodeType();
	      
	      if (type == Node.ELEMENT_NODE) {
	         if (node.getNodeName().equals("brojIndeksa")) {
	        	data.add(new String (node.getTextContent()));        	 
	         }             
	      }   
	      NodeList children = node.getChildNodes();
	      if (children != null) {
	         for (int i=0; i< children.getLength(); i++)
	            traverse (children.item(i));
	         
	      }
	     
	 }
	
	private String konstruisiUpit(String[] parametri,String file){
		String upit;
		int prviPun = 0; 
		boolean prazan = true;
		for (int j=0; j<parametri.length; j++) {
			if (parametri[j]!="") {
				prviPun = j;
				prazan = false;
				break;
			}
		}
		if (prazan) {
			upit = "for $x in doc('"+file+"') ";
		} else {
			upit = "for $x in doc('"+file+"') where ";
		}
		if (parametri[0] != "") {
			upit+= "$x/SV-20/brojIndeksa=" + Integer.parseInt(parametri[0]) + "' ";
		} 
		if (parametri[1] != "") {
			if (prviPun==1) {
				upit+= "$x/SV-20/PodatkePopunjavaStatistika/MaticniBbrojRregistra=" + Integer.parseInt(parametri[1]) + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStatistika/MaticniBbrojRregistra=" + Integer.parseInt(parametri[1]) + "' ";
			}
		} 
		if (parametri[2] != "") {
			if (prviPun==2) {
				upit+= "$x/SV-20/PodatkePopunjavaStatistika/RedniBrojPrijavnogLista=" + Integer.parseInt(parametri[2]) + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStatistika/RedniBrojPrijavnogLista=" + Integer.parseInt(parametri[2]) + "' ";
			}
		} 
		if (parametri[3] != "") {
			if (prviPun==3) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/PodaciOFakultetu/NazivFakulteta-AkademijeIliVisokeSkole/Naziv='" + parametri[3] + " ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/PodaciOFakultetu/NazivFakulteta-AkademijeIliVisokeSkole/Naziv='" + parametri[3] + " ";
			}
		}
		if (parametri[4] != "") {
			if (prviPun==4) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/PodaciOFakultetu/NazivFakulteta-AkademijeIliVisokeSkole/Odsek-Smer='" + parametri[4] + " ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/PodaciOFakultetu/NazivFakulteta-AkademijeIliVisokeSkole/Odsek-Smer='" + parametri[4] + " ";
			}
		}
		if (parametri[5] != "") {
			if (prviPun==5) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/PodaciOFakultetu/NazivFakulteta-AkademijeIliVisokeSkole/Univerzitet='" + parametri[5] + " ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/PodaciOFakultetu/NazivFakulteta-AkademijeIliVisokeSkole/Univerzitet='" + parametri[5] + " ";
			}
		}
		if (parametri[6] != "") {
			if (prviPun==6) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/PodaciOFakultetu/MestoSkole='" + parametri[6] + " ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/PodaciOFakultetu/MestoSkole='" + parametri[6] + " ";
			}
		}
		if (parametri[7] != "") {
			if (prviPun==7) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/VrsteStudija='" + parametri[7] + " ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/VrsteStudija='" + parametri[7] + " ";
			}
		} 
		if (parametri[8] != "") {
			if (prviPun==8) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/StepenStudija='" + parametri[8] + " ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/StepenStudija='" + parametri[8] + " ";
			}
		} 
		if (parametri[9] != "") {
			if (prviPun==9) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/NacinFinansiranjaStudija='" + parametri[9] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/NacinFinansiranjaStudija='" + parametri[9] + "' ";
			}
		} 
		if (parametri[10] != "") {
			if (prviPun==10) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/GodinaStudijaKojaSeUpisuje='" + parametri[10] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/GodinaStudijaKojaSeUpisuje='" + parametri[10] + "' ";
			}
		}
		if (parametri[11] != "") {
			if (prviPun==11) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/GodinaUpisaUOvuSkolu=" + Integer.parseInt(parametri[11]) + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/GodinaUpisaUOvuSkolu=" + Integer.parseInt(parametri[11]) + "' ";
			}
		}
		if (parametri[12] != "") {
			if (prviPun==12) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/StudentSePonovoUpisujeNaOvuGodinu='" + parametri[12] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/PodaciOStudiranju/StudentSePonovoUpisujeNaOvuGodinu='" + parametri[12] + "' ";
			}
		}
		if (parametri[13] != "") {
			if (prviPun==13) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Ime='" + parametri[13] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Ime='" + parametri[13] + "' ";
			}
		}
		if (parametri[14] != "") {
			if (prviPun==14) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/ImeOca='" + parametri[14] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/ImeOca='" + parametri[14] + "' ";
			}
		}
		if (parametri[15] != "") {
			if (prviPun==15) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Prezime='" + parametri[15] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Prezime='" + parametri[15] + "' ";
			}
		}
		if (parametri[16] != "") {
			if (prviPun==16) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Pol='" + parametri[16] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Pol='" + parametri[16] + "' ";
			}
		}
		if (parametri[17] != "") {
			if (prviPun==17) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/GodinaRodjenja=" + Integer.parseInt(parametri[17]) + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/GodinaRodjenja=" + Integer.parseInt(parametri[17]) + "' ";
			}
		}
		if (parametri[18] != "") {
			if (prviPun==18) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/MestoRodjenja=" + parametri[18] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/MestoRodjenja=" + parametri[18] + "' ";
			}
		}
		if (parametri[19] != "") {
			if (prviPun==19) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StalnogBoravka/Opstina='" + parametri[19] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StalnogBoravka/Opstina='" + parametri[19] + "' ";
			}
		}
		if (parametri[20] != "") {
			if (prviPun==20) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StalnogBoravka/UlicaIBroj='" + parametri[20] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StalnogBoravka/UlicaIBroj='" + parametri[20] + "' ";
			}
		}
		if (parametri[21] != "") {
			if (prviPun==21) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StalnogBoravka/BrojTelefona='" + parametri[21] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StalnogBoravka/BrojTelefona='" + parametri[21] + "' ";
			}
		}
		if (parametri[22] != "") {
			if (prviPun==22) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StanovanjaZaVremeStudija/Opstina='" + parametri[22] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StanovanjaZaVremeStudija/Opstina='" + parametri[22] + "' ";
			}
		}
		if (parametri[23] != "") {
			if (prviPun==23) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StanovanjaZaVremeStudija/UlicaIBroj='" + parametri[23] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StanovanjaZaVremeStudija/UlicaIBroj='" + parametri[23] + "' ";
			}
		}
		if (parametri[24] != "") {
			if (prviPun==24) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StanovanjaZaVremeStudija/BrojTelefona='" + parametri[24] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Adresa/StanovanjaZaVremeStudija/BrojTelefona='" + parametri[24] + "' ";
			}
		}
		if (parametri[25] != "") {
			if (prviPun==25) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Drzavljanstvo='" + parametri[25] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/Drzavljanstvo='" + parametri[25] + "' ";
			}
		}
		if (parametri[26] != "") {
			if (prviPun==26) {
				upit+= "$x/SV-20/PodatkePopunjavaStudent/LicniPodaci/NacionalnaPripadnost='" + parametri[26] + "' ";
			} else {
				upit+= "and $x/SV-20/PodatkePopunjavaStudent/LicniPodaci/NacionalnaPripadnost='" + parametri[26] + "' ";
			}
		}
		upit+="return $x";
		return upit;
	}
	
	public void pretraga(String[] parametri) {
		Vector xmlLinks=new Vector();
		Vector pom=new Vector();
		try{
	      Collection col = DatabaseManager.getCollection(DBConnection.URI+"/db/SV-20");
	      XQueryService service = (XQueryService) col.getService("XQueryService", "1.0");
	      service.setProperty("indent", "yes");
	      String[] listaFajlova = col.listResources();
	      
	      for(int j=0;j<listaFajlova.length;j++){
	    	  String upit=konstruisiUpit(parametri,listaFajlova[j]);
	      	  CompiledExpression compiled = service.compile(upit);
	    	  ResourceSet result = service.execute(compiled);
	    	  ResourceIterator i = result.getIterator();
	    	  while(i.hasMoreResources()) {
	    		XMLResource r = (XMLResource)i.nextResource();  
	    		pom.add(r);
	          	URL pomL=new URL(DBConnection.URL+r.getDocumentId());
	          	xmlLinks.add(pomL);  	
	    	  }
	      }
		}
	    catch(Exception ex)
	    {
	      ex.printStackTrace();
	    }
		linkovi=xmlLinks;
		xmlRes=pom;
	}
	
}
