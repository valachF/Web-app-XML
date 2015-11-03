package model;

import javax.xml.transform.OutputKeys;


import noNamespace.SV20Document;

import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.Resource;
import org.xmldb.api.base.ResourceIterator;
import org.xmldb.api.base.ResourceSet;
import org.xmldb.api.base.XMLDBException;
import org.xmldb.api.modules.XMLResource;
import org.xmldb.api.modules.XPathQueryService;

public class Pretraga {

		public static String pretraziBazu(String query) {
			try {
				Collection col = DatabaseManager.getCollection(DBConnection.URI+"/db/SV-20","admin","xmlbp");
		        XPathQueryService service =
		            (XPathQueryService) col.getService("XPathQueryService", "1.0");
		        service.setProperty("indent", "yes");	                
		        ResourceSet result = service.query(query);
		        ResourceIterator i = result.getIterator();
		        String xmlres = "";
		        while(i.hasMoreResources()) {
		            Resource r = i.nextResource();
		            xmlres += (String)r.getContent();
		        }
		        return "<Results>"+xmlres+"</Results>";
			} catch (XMLDBException e) {
				e.printStackTrace();
			}
			return "";
		}
		
		public static SV20Document nadjiDokument(String brojIndeksa) {
			try {
				Collection col = DatabaseManager.getCollection(DBConnection.URI+"/db/SV-20","admin","xmlbp");
				col.setProperty(OutputKeys.INDENT, "no");
				XMLResource res = (XMLResource)col.getResource(brojIndeksa);
				if(res == null) {
					return null; 				
				} else {
					SV20Document doc = SV20Document.Factory.parse(res.getContent().toString());				
					return doc;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}

	}
