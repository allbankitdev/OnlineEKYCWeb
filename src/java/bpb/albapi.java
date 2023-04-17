/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bpb;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import static tools.hash.getSha1;

/**
 *
 * @author vgponciano
 */
public class albapi {

    public static String RequestAPI(String Request, String Param, int envi, String Param2, String ClientIP) {
        String Response = "";
        String RequestTag = "";
        String CMDTag = "";
        String LogID = "";
        String id = "84AB74BE6719C738A616C4301B08D7923A3E4E0D";
        String APIURL = "http://10.232.236.17:17001";//MBAPP
        switch (Request) {
            case "Dropdowns":
                CMDTag = "WebLoan.Info";
                RequestTag = " cmd=\"MISCHILD\" " + Param;
                break;
            case "SearchCity":
                CMDTag = "WebLoan.Info";
                RequestTag = " cmd=\"MISSEARCH\" " + Param;
                break;
            case "CheckIfAlreadyExist":
                CMDTag = "Account.Info";
                RequestTag = " cmd=\"MB-CHK\" " + Param;
                break;
            case "CreateNewCIS":
                CMDTag = "Account.Info";
                RequestTag = " cmd='MB-CSC' " + Param;
                break;
            case "CreateNewCISRSA":
                CMDTag = "Account.Info";
                RequestTag = " cmd='MB-RSA' " + Param;
                break;
            case "CreateNewCISPARTNER":
                CMDTag = "Account.Info";
                RequestTag = " cmd='MB-RSA' " + Param;
                break;
            case "UploadDoc":
                APIURL = "http://10.232.236.17:17002";//MBAPP
                id = "B6229A4F440D39E6244C5F5C7E61DD7EE6197476";
                CMDTag = "BPB_Binary.Info";
                RequestTag = " cmd=\"UPDOC\" " + Param;
                break;
        }
        try {

            String SecretWord = "";
            if (envi == 1) {
//                APIURL = "http://10.232.237.10:17007";//PROD
//                id = "2fa51f8d04ce9b2cd672f1d3318cdbb65b74556fc3a14afe7d2fffa6e1ebc085";//Prod
//                SecretWord = "13a7c655a7d4213c0c7e77e83a7be6b267baa3f16937c401bf73371545cc9db8";//Prod
            } else {

                SecretWord = "226D5FD93A3BE70FEF5FC0DFD26E3E72CAB0210D";
            }
            String tdt = GetMytdtAdjusted(GetDTO(ClientIP));
            //String tdt = GetMytdt();
            String token = getSha1(id + SecretWord + tdt);
            String Tags = " "//;
                    + "id='" + id + "' "
                    + "tdt='" + tdt + "' "
                    + "token='" + token + "' ";
            String requestToAPI
                    = "<Envelope xmlns='http://schemas.xmlsoap.org/soap/envelope/'>"
                    + "    <Body>"
                    + "        <wb_Get_Info xmlns='http://tempuri.org/'>"
                    + "                            <XMLRequest>&lt;" + CMDTag + RequestTag + " " + Tags + " &gt; " + Param2 + " &lt;/" + CMDTag + "&gt;</XMLRequest>"
                    + "        </wb_Get_Info>"
                    + "    </Body>"
                    + "</Envelope>";

            URL url = new URL(APIURL);//AIP
            System.out.println("Request: " + requestToAPI);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Set timeout as per needs
            connection.setConnectTimeout(20000);
            connection.setReadTimeout(20000);

            // Set DoOutput to true if you want to use URLConnection for output.
            // Default is false
            connection.setDoOutput(true);

            connection.setUseCaches(true);
            connection.setRequestMethod("POST");

            // Set Headers
            connection.setRequestProperty("Accept", "application/xml");
            connection.setRequestProperty("Content-Type", "text/xml");
            connection.setRequestProperty("SoapAction", "http://tempuri.org/iWebInterface/wb_Get_Info");

            // Write XML
            OutputStream outputStream = connection.getOutputStream();
            byte[] b = requestToAPI.getBytes("UTF-8");
            outputStream.write(b);
            outputStream.flush();
            outputStream.close();
            LogID = models.AuditLog.AddAuditLog(requestToAPI, APIURL, ClientIP);
            // Read XML
            InputStream inputStream = connection.getInputStream();

            byte[] res = new byte[2048];

            Reader inputStreamReader = new InputStreamReader(inputStream, Charset.forName("UTF-8"));
            StringBuilder responseFromAPI = new StringBuilder();
            int data = inputStreamReader.read();
            while (data != -1) {
                char theChar = (char) data;
                data = inputStreamReader.read();
                responseFromAPI.append(theChar);
            }

            inputStreamReader.close();
            Response = responseFromAPI.toString().replace("&lt;", "<").replace("&gt;", ">");
            String ReturnCode = getResponseAttributesString(Response, CMDTag, "ReturnCode");
            String ErrorMsg = getResponseAttributesString(Response, CMDTag, "ErrorMsg");
            models.AuditLog.UpdateAPIResponse(LogID, "ReturnCode : " + ReturnCode + " ErrorMsg : " + ErrorMsg);

        } catch (MalformedURLException ex) {
            Response = "error";
        } catch (IOException ex) {
            Response = "error";
        }
        return Response;
    }

    public static int GetDTO(String ClientIP) {
        int secoff = 0;
        String Response = "";
        String RequestTag = "";
        String CMDTag = "";
        String LogID = "";
        String id = "84AB74BE6719C738A616C4301B08D7923A3E4E0D";
        String APIURL = "http://10.232.236.17:17001";//MBAPP
        CMDTag = "Account.Info";
        RequestTag = " cmd=\"dto\" ";

        try {

            String SecretWord = "";
            SecretWord = "226D5FD93A3BE70FEF5FC0DFD26E3E72CAB0210D";

            String tdt = GetMytdt();
            String token = getSha1(id + SecretWord + tdt);
            String Tags = " "//;
                    + "id='" + id + "' "
                    + "tdt='" + tdt + "' "
                    + "token='" + token + "' ";
            String requestToAPI
                    = "<Envelope xmlns='http://schemas.xmlsoap.org/soap/envelope/'>"
                    + "    <Body>"
                    + "        <wb_Get_Info xmlns='http://tempuri.org/'>"
                    + "                            <XMLRequest>&lt;" + CMDTag + RequestTag + " " + Tags + " &gt;&lt;/" + CMDTag + "&gt;</XMLRequest>"
                    + "        </wb_Get_Info>"
                    + "    </Body>"
                    + "</Envelope>";

            URL url = new URL(APIURL);//AIP
            System.out.println("Request: " + requestToAPI);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Set timeout as per needs
            connection.setConnectTimeout(20000);
            connection.setReadTimeout(20000);

            // Set DoOutput to true if you want to use URLConnection for output.
            // Default is false
            connection.setDoOutput(true);

            connection.setUseCaches(true);
            connection.setRequestMethod("POST");

            // Set Headers
            connection.setRequestProperty("Accept", "application/xml");
            connection.setRequestProperty("Content-Type", "text/xml");
            connection.setRequestProperty("SoapAction", "http://tempuri.org/iWebInterface/wb_Get_Info");

            // Write XML
            OutputStream outputStream = connection.getOutputStream();
            byte[] b = requestToAPI.getBytes("UTF-8");
            outputStream.write(b);
            outputStream.flush();
            outputStream.close();
            LogID = models.AuditLog.AddAuditLog(requestToAPI, APIURL, ClientIP);
            // Read XML
            InputStream inputStream = connection.getInputStream();

            byte[] res = new byte[2048];

            Reader inputStreamReader = new InputStreamReader(inputStream, Charset.forName("UTF-8"));
            StringBuilder responseFromAPI = new StringBuilder();
            int data = inputStreamReader.read();
            while (data != -1) {
                char theChar = (char) data;
                data = inputStreamReader.read();
                responseFromAPI.append(theChar);
            }

            inputStreamReader.close();
            Response = responseFromAPI.toString().replace("&lt;", "<").replace("&gt;", ">");
            String ReturnCode = getResponseAttributesString(Response, CMDTag, "ReturnCode");
            String ErrorMsg = getResponseAttributesString(Response, CMDTag, "ErrorMsg");
            models.AuditLog.UpdateAPIResponse(LogID, "ReturnCode : " + ReturnCode + " ErrorMsg : " + ErrorMsg);

            String SecOffset = getResponseAttributesString(Response, "Account.Info", "secoff");
            System.out.println("SecOffset : " + SecOffset);
            secoff = Integer.parseInt(SecOffset);

        } catch (MalformedURLException ex) {
            Response = "error";
            secoff = 0;
        } catch (IOException ex) {
            Response = "error";
            secoff = 0;
        }
        return secoff;
    }

    public static String GetMytdt() {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX"); // Quoted "Z" to indicate UTC, no timezone offset
        Date startTime = new Date();
        startTime = new Date(startTime.getTime() - 0 * 1000);
        String nowAsISO = df.format(startTime);
        return nowAsISO;
    }

    public static String GetMytdtAdjusted(int sec) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX"); // Quoted "Z" to indicate UTC, no timezone offset
        Date startTime = new Date();
        startTime = new Date(startTime.getTime() + sec * 1000);
        String nowAsISO = df.format(startTime);
        return nowAsISO;
    }

    public static String GetCurrentDate() {
        //TimeZone tz = TimeZone.getTimeZone("UTC");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); // Quoted "Z" to indicate UTC, no timezone offset
        //df.setTimeZone(tz);
        String nowAsISO = df.format(new Date());
//        System.out.println("tdt now: " + nowAsISO);
        return nowAsISO;
    }

    public static String getResponseAttributesString(String Response, String Node, String Attr) {
        final String xmlStr = Response;
        String AttrVal = "";
        //Use method to convert XML string content to XML Document object
        Document doc = convertStringToXMLDocument(xmlStr);
        //Verify XML document is build correctly
        doc.getDocumentElement().normalize();
        NodeList entries = doc.getElementsByTagName(Node);

        int num = entries.getLength();

        for (int i = 0; i < num; i++) {
            Element node = (Element) entries.item(i);
            //          System.out.println(node.getNodeValue());
            AttrVal += listSpecificAttributes(node, Attr);
        }
        return AttrVal;
    }

    public static String[][] getResponseAttributesArray(String Response, String Node) {
        final String xmlStr = Response;

        //Use method to convert XML string content to XML Document object
        Document doc = convertStringToXMLDocument(xmlStr);
        //Verify XML document is build correctly
        doc.getDocumentElement().normalize();
        NodeList entries = doc.getElementsByTagName(Node);

        int num = entries.getLength();
        String[][] AttrVal = new String[num][];
        // System.out.println("No. of CIS:" + num);
        for (int i = 0; i < num; i++) {
            Element node = (Element) entries.item(i);
            AttrVal[i] = listAllAttributes(node);
        }
        return AttrVal;
    }

    public static JSONArray getResponseNodesJSONified(String Response, String Node) {
        final String xmlStr = Response;
        JSONArray array = new JSONArray();
        //Use method to convert XML string content to XML Document object
        Document doc = convertStringToXMLDocument(xmlStr);
        //Verify XML document is build correctly
        doc.getDocumentElement().normalize();
        NodeList entries = doc.getElementsByTagName(Node);

        int num = entries.getLength();
        // System.out.println("No. of Dropdowns:" + num);

        for (int i = 0; i < num; i++) {
            Element node = (Element) entries.item(i);
            array.put(listAllChildNode(node));
        }
        return array;
    }

    public static String[][] getResponseAttributesArrayName(String Response, String Node) {
        final String xmlStr = Response;

        //Use method to convert XML string content to XML Document object
        Document doc = convertStringToXMLDocument(xmlStr);
        //Verify XML document is build correctly
        doc.getDocumentElement().normalize();
        NodeList entries = doc.getElementsByTagName(Node);

        int num = entries.getLength();

        String[][] AttrVal = new String[num][];
        //  System.out.println("No. of CIS:" + num);
        for (int i = 0; i < num; i++) {
            Element node = (Element) entries.item(i);
            AttrVal[i] = listAllAttributesNames(node);
        }
        return AttrVal;
    }

    public static String getResponseNodeString(String Response, String Node) {
        final String xmlStr = Response;
        String AttrVal = "";
        //Use method to convert XML string content to XML Document object
        Document doc = convertStringToXMLDocument(xmlStr);
        //Verify XML document is build correctly
        doc.getDocumentElement().normalize();

        AttrVal = doc.getElementsByTagName(Node).item(0).getTextContent();
        return AttrVal;
    }

    public static String listSpecificAttributes(Element element, String Attr) {
        String AttrVal = "";

        //System.out.println("List attributes for node: " + element.getNodeName());
        //GET VALUE OF SPECIFIC ATTRIBUTE
        AttrVal = element.getAttribute(Attr);

        return AttrVal;

    }

    public static String[] listAllAttributes(Element element) {
        //LIST ALL ATTRIBUTES
        // get a map containing the attributes of this node 
        NamedNodeMap attributes = element.getAttributes();

        // get the number of nodes in this map
        int numAttrs = attributes.getLength();

        int trueTransations = 0, mdr = 0;
        String[] AttrVal = new String[numAttrs];
        //   System.out.println("No. of Attr:" + numAttrs);
        for (int i = 0; i < numAttrs; i++) {
            Attr attr = (Attr) attributes.item(i);

            String attrName = attr.getNodeName();
            String attrValue = attr.getNodeValue();
            //System.out.println(i + " : " + attrName + "=" + attrValue);
            AttrVal[i] = attrValue;
            //System.out.println("Found attribute: " + attrName + " with value: " + attrValue);

        }
//        System.out.println("True : " + trueTransations);
//        System.out.println("MDR : " + mdr);
        return AttrVal;

    }

    public static JSONObject listAllChildNode(Element element) {
        JSONObject obj2 = new JSONObject();
//LIST ALL ATTRIBUTES
        // get a map containing the attributes of this node 
        NodeList childNodes = element.getChildNodes();

        // get the number of nodes in this map
        int numCNodes = childNodes.getLength();

        int trueTransations = 0, mdr = 0;
        String[] AttrVal = new String[numCNodes];
        //System.out.println("No. of CNodes:" + numCNodes);
        for (int i = 0; i < numCNodes; i++) {
            String Nodename = childNodes.item(i).getNodeName();
            String NodeValue = childNodes.item(i).getTextContent();

            //System.out.println("Found Nodes: " + Nodename + " with value: " + NodeValue);
            try {
                obj2.put(Nodename, NodeValue);
            } catch (JSONException ex) {
                Logger.getLogger(albapi.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return obj2;

    }

    public static String[] listAllAttributesNames(Element element) {

        //LIST ALL ATTRIBUTES
        // get a map containing the attributes of this node 
        NamedNodeMap attributes = element.getAttributes();

        // get the number of nodes in this map
        int numAttrs = attributes.getLength();
        //true
        String[] AttrVal = new String[numAttrs];
//        System.out.println("No. of Attr:" + numAttrs);
        for (int i = 0; i < numAttrs; i++) {
            Attr attr = (Attr) attributes.item(i);

            String attrName = attr.getNodeName();
            String attrValue = attr.getNodeValue();
//            System.out.println(i + " : " + attrName + "=" + attrValue);
            AttrVal[i] = attrName;
            //    System.out.println("Found attribute: " + attrName + " with value: " + attrValue);
        }

        int trueTransations = 0, mdr = 0;
//        System.out.println("True : " + trueTransations);
        //       System.out.println("MDR : " + mdr);
        return AttrVal;

    }

    public static String[] listAllAttributesCount(Element element) {//this is for getting the total transactions of the unit
        int Total = 0, pending = 0, success = 0, expired = 0;
        //LIST ALL ATTRIBUTES
        // get a map containing the attributes of this node 
        NamedNodeMap attributes = element.getAttributes();

        // get the number of nodes in this map
        int numAttrs = attributes.getLength();

        String[] AttrVal = new String[numAttrs];
//        System.out.println("No. of Attr:" + numAttrs);
        for (int i = 0; i < numAttrs; i++) {
            Attr attr = (Attr) attributes.item(i);

            String attrName = attr.getNodeName();
            String attrValue = attr.getNodeValue();
//            System.out.println(i + " : " + attrName + "=" + attrValue);
            AttrVal[i] = attrName;
            //    System.out.println("Found attribute: " + attrName + " with value: " + attrValue);
        }
        return AttrVal;

    }

    private static Document convertStringToXMLDocument(String xmlString) {
        //Parser that produces DOM object trees from XML content
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

        //API to obtain DOM Document instance
        DocumentBuilder builder = null;
        try {
            //Create DocumentBuilder with default configuration
            builder = factory.newDocumentBuilder();

            //Parse the content to Document object
            Document doc = builder.parse(new InputSource(new StringReader(xmlString)));
            return doc;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
