package model;

import java.io.*;
import org.w3c.dom.*;
import org.apache.xerces.parsers.*;
import java.util.*;



public class DOMWriter {

    /** Default parser name. */
    private static final String DEFAULT_PARSER_NAME = "DOMParser";
    private static final String PRINTWRITER_ENCODING = "UTF8";
    private static final int TAB = 2;
    private String elPath = "";
    public static String s = "";
    public Vector elements = new Vector();
    private String izlaz = "";
    private FileWriter fw;
    private File f;

    public DOMWriter(){
    	try{
    		f=new File("temp.xml");
    		fw = new FileWriter(f.getPath());;
    	}
    	catch (Exception e){
    		System.out.println("Greska prilikom kreiranja temp fajla");
    		e.printStackTrace();
    	}
    }

    public String toString(Node node){
      izlaz = "";
      print(node,2);
      return izlaz;
    }

    public File writeToFile(Node node){
        izlaz = "";
        print(node,2);
        try {
        	fw.write(izlaz);
        	fw.close();
        } catch(Exception e) {
        	e.printStackTrace();
        }
        return f;
    }
    
    private void space(int indent){
      for (int i= 0;i<indent;i++)
        izlaz+=" ";
    }

    private void print(Node node, int indent){
        // is there anything to do?
        if ( node == null ) {
            return;
        }
        int type = node.getNodeType();
        switch ( type ) {
        // print document
        case Node.DOCUMENT_NODE: {
               izlaz+="<?xml version=\"1.0\" encoding=\""+"UTF-8"+ "\"?>\n";
               NodeList children = node.getChildNodes();
               for ( int iChild = 0; iChild < children.getLength(); iChild++ ) {
                   print(children.item(iChild),indent);
               }
               break;
            }

            // print element with attributes
        case Node.ELEMENT_NODE: {
                space(indent);
                izlaz+="<";
                izlaz+=node.getNodeName();
                Attr attrs[] = sortAttributes(node.getAttributes());
                for ( int i = 0; i < attrs.length; i++ ) {
                    Attr attr = attrs[i];
                    izlaz+=" ";
                    izlaz+=attr.getNodeName();
                    izlaz+="=\"";
                    izlaz+=normalize(attr.getNodeValue());
                    izlaz+="\"";
                }
                NodeList children = node.getChildNodes();
                if ( children != null ) {
                  int len = children.getLength();
                  if ((len==1) && (children.item(0).getNodeType()==Node.TEXT_NODE)){
                    izlaz+=">";
                    String textContent = normalize(children.item(0).getNodeValue());
                    if (!textContent.equals("")){
                      izlaz+=textContent;
                    }
                    izlaz+="</";
                    izlaz+=node.getNodeName();
                    izlaz+=">\n";
                  }
                  else{
                    izlaz+=">\n";
                    for ( int i = 0; i < len; i++ ) {
                      print(children.item(i),indent+TAB);
                    }
                    space(indent);
                    izlaz+="</";
                    izlaz+=node.getNodeName();
                    izlaz+=">\n";
                  }
                }
                break;
            }

            // handle entity reference nodes
        case Node.ENTITY_REFERENCE_NODE: {
               NodeList children = node.getChildNodes();
                 if ( children != null ) {
                   int len = children.getLength();
                   for ( int i = 0; i < len; i++ ) {
                     print(children.item(i),2);
                   }
                 }
               break;
            }

            // print cdata sections
        case Node.CDATA_SECTION_NODE: {
               izlaz+=normalize(node.getNodeValue());
               break;
            }

            // print text
        case Node.TEXT_NODE:{
                String textContent = normalize(node.getNodeValue());
                if (!textContent.equals("")){
                  space(indent);
                  izlaz+=textContent+"\n";
                }
                break;
            }

            // print processing instruction
        case Node.PROCESSING_INSTRUCTION_NODE: {
                izlaz+="<?";
                izlaz+=node.getNodeName();
                String data = node.getNodeValue();
                if ( data != null && data.length() > 0 ) {
                    izlaz+=" ";
                    izlaz+=data;
                }
                izlaz+="?>\n";
                break;
            }
        }
    }

    protected Attr[] sortAttributes(NamedNodeMap attrs) {
        int len = (attrs != null) ? attrs.getLength() : 0;
        Attr array[] = new Attr[len];
        for ( int i = 0; i < len; i++ ) {
            array[i] = (Attr)attrs.item(i);
        }
        for ( int i = 0; i < len - 1; i++ ) {
            String name  = array[i].getNodeName();
            int    index = i;
            for ( int j = i + 1; j < len; j++ ) {
                String curName = array[j].getNodeName();
                if ( curName.compareTo(name) < 0 ) {
                    name  = curName;
                    index = j;
                }
            }
            if ( index != i ) {
                Attr temp    = array[i];
                array[i]     = array[index];
                array[index] = temp;
            }
        }
        return(array);
    }

    /** Normalizes the given string. */
    protected String normalize(String s) {
        StringBuffer str = new StringBuffer();

        int len = (s != null) ? s.length() : 0;
        for ( int i = 0; i < len; i++ ) {
            char ch = s.charAt(i);
//            System.out.println(Character.getType(ch)+":"+ch+",");
            switch (Character.getType(ch)) {
            case 15:{
                    break;
                }
            default: {
                    str.append(ch);
                }
            }
        }
        return(str.toString());
    }

    public Document parse(String uri){
      try {
        DOMParser parser = new DOMParser();
        parser.parse(uri);
        return parser.getDocument();
      }
      catch (Exception e) {
        izlaz+=e.getMessage();
        return null;
      }
    }

    public void buildString(Node node) {
        // is there anything to do?
        if ( node == null ) {
            return;
        }

        int type = node.getNodeType();
        switch ( type ) {
        // print document
        case Node.DOCUMENT_NODE: {
               s+="<?xml version=\"1.0\" encoding=\""+"UTF-8"+ "\"?>";

                NodeList children = node.getChildNodes();
                for ( int iChild = 0; iChild < children.getLength(); iChild++ ) {
                    buildString(children.item(iChild));
                }
                break;
            }

            // print element with attributes
        case Node.ELEMENT_NODE: {
                s+='<';
                s+=node.getNodeName();
                Attr attrs[] = sortAttributes(node.getAttributes());
                for ( int i = 0; i < attrs.length; i++ ) {
                    Attr attr = attrs[i];
                    s+=' ';
                    s+=attr.getNodeName();
                    s+="=\"";
                    s+=normalize(attr.getNodeValue());
                    s+='"';
                }
                s+='>';
                NodeList children = node.getChildNodes();
                if ( children != null ) {
                    int len = children.getLength();
                    for ( int i = 0; i < len; i++ ) {
                        buildString(children.item(i));
                    }
                }
                break;
            }

            // handle entity reference nodes
        case Node.ENTITY_REFERENCE_NODE: {
               NodeList children = node.getChildNodes();
                 if ( children != null ) {
                   int len = children.getLength();
                   for ( int i = 0; i < len; i++ ) {
                     buildString(children.item(i));
                   }
                 }
               break;
            }

            // print cdata sections
        case Node.CDATA_SECTION_NODE: {
               s+=normalize(node.getNodeValue());
               break;
            }

            // print text
        case Node.TEXT_NODE: {
                s+=normalize(node.getNodeValue());
                break;
            }

            // print processing instruction
        case Node.PROCESSING_INSTRUCTION_NODE: {
                s+="<?";
                s+=node.getNodeName();
                String data = node.getNodeValue();
                if ( data != null && data.length() > 0 ) {
                    s+=' ';
                    s+=data;
                }
                s+="?>\n";
                break;
            }
        }

        if ( type == Node.ELEMENT_NODE ) {
            s+="</";
            s+=node.getNodeName();
            s+='>';
        }
    }
}
