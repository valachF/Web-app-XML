package model;
import org.xmldb.api.base.*;
import org.xmldb.api.*;


public class DBConnection
{
  protected static String URI = "xmldb:exist://archimedes.is.pmf.uns.ac.rs/exist/xmlrpc";
  protected static String URL = "http://archimedes.is.pmf.uns.ac.rs/exist/servlet/db/SV-20/";
  public DBConnection()
  {
	  
  }
  static
  {
    String driver = "org.exist.xmldb.DatabaseImpl";
    try{
      Class cl = Class.forName(driver);
      Database database = (Database) cl.newInstance();
      DatabaseManager.registerDatabase(database);
      
    }
    catch(Exception e)
    {
      System.out.println("Database down");
      e.printStackTrace();
    }
  }


}
