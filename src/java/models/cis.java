/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import bpb.albapi;
import static bpb.albapi.getResponseAttributesString;
import static bpb.albapi.getResponseNodesJSONified;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import tools.hash;

/**
 *
 * @author vgponciano
 */
public class cis {

    public static int year = 1997;

    public static String[] ValidateInfo(String Username, String FName, String LName, String MName, String dob, String ClientIP) {
        String uh = hash.getSha1(Username);
        String[] returno = {"true", ""};
        boolean isExist = true;
        String GetDropDownList = albapi.RequestAPI("CheckIfAlreadyExist", " ln=\"" + LName + "\" fn=\"" + FName + "\" mn=\"" + MName + "\" dob=\"" + dob + "\" uh=\"" + uh + "\"", 2, "", ClientIP);
        if (!GetDropDownList.equals("error")) {
            System.out.println(GetMytdt() + " Response : " + GetDropDownList);
            String ReturnCode = getResponseAttributesString(GetDropDownList, "Account.Info", "ReturnCode");
            System.out.println(GetMytdt() + " ReturnCode: " + ReturnCode);
            String ErrMsg = getResponseAttributesString(GetDropDownList, "Account.Info", "ErrorMsg");
            System.out.println(GetMytdt() + " ErrorMsg: " + ErrMsg);
            returno[0] = ReturnCode;
            returno[1] = ErrMsg;
        }

        return returno;

    }

    public static String GetMytdt() {
        //TimeZone tz = TimeZone.getTimeZone("UTC");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX"); // Quoted "Z" to indicate UTC, no timezone offset
        //df.setTimeZone(tz);
        String nowAsISO = df.format(new Date());
        //System.out.println("tdt now: " + nowAsISO);
        return nowAsISO;
    }

    public static JSONArray CreateNewCIS(String Type, String Username, String Gender, String title, String Lname, String FName, String MName, String Email, String DOB, String POB, String CivilStatus,
            String IsForeigner, String IsPolitician,
            String h_add, String H_Village, String StayedSince, String Phone, String Mobile, String Nationality, String SourceOfFund, String JobTitle,
            String Ownership, String DynamicAdd, String Appelation, String MothersMName, String IDCode, String IDRef, String IDCode2, String IDRef2, String ClientIP) {
        JSONArray Dropdowns = new JSONArray();
        String uh = hash.getSha1(Username);
        hash.getSha1(GetMytdt());
        String GetDropDownList = "";
        if (Type.equals("CashCard")) {
            GetDropDownList = albapi.RequestAPI("CreateNewCIS", "", 2,
                    "			&lt;mods&gt;\n"
                    + "                                 &lt;i field=\"username\" value=\"" + uh + "\" /&gt; \n"
                    + "                                 &lt;i field=\"p_gender\" value=\"" + Gender + "\" /&gt; \n"
                    + "    				&lt;i field=\"title\" value=\"" + title + "\" /&gt; \n"
                    + "    				&lt;i field=\"lname\" value=\"" + Lname + "\" /&gt;  \n"
                    + "    				&lt;i field=\"fname\" value=\"" + FName + "\" /&gt;\n"
                    + "    				&lt;i field=\"mname\" value=\"" + MName + "\" /&gt; \n"
                    + "    				&lt;i field=\"email\" value=\"" + Email + "\" /&gt;\n"
                    + "    				&lt;i field=\"p_bday\" value=\"" + DOB + "\" /&gt;    \n"
                    + "    				&lt;i field=\"place_of_birth\" value=\"" + POB + "\" /&gt;\n"
                    + "    				&lt;i field=\"civil_status\" value=\"" + CivilStatus + "\" /&gt;\n"
                    + "    				&lt;i field=\"t_foreigner\" value=\"" + IsForeigner + "\" /&gt; \n"
                    + "    				&lt;i field=\"t_pep\" value=\"" + IsPolitician + "\" /&gt;  \n"
                    + "    				&lt;i field=\"h_sadd\" value=\"" + h_add + "\" /&gt;\n"
                    + "    				&lt;i field=\"h_village\" value=\"" + H_Village + "\" /&gt;\n"
                    + "    				&lt;i field=\"h_stayed_since\" value=\"" + StayedSince + "\" /&gt;\n"
                    + "    				&lt;i field=\"h_phone\" value=\"" + Phone + "\" /&gt;\n"
                    + "    				&lt;i field=\"h_mobile\" value=\"" + Mobile + "\" /&gt;\n"
                    + "                                 &lt;i field=\"nationality\" value=\"" + Nationality + "\" /&gt; \n"
                    + "         			&lt;i field=\"source_of_fund_path\" value=\"" + SourceOfFund + "\" /&gt; \n"
                    + "                 		&lt;i field=\"job_title_path\" value=\"" + JobTitle + "\" /&gt; \n"
                    + "                                 &lt;i field=\"h_ownership\" value=\"" + Ownership + "\" /&gt;  \n"
                    + "                         	&lt;i field=\"dynamic_address\" value=\"" + DynamicAdd + "\" /&gt;  \n"
                    + "                                 &lt;i field=\"appelation\" value=\"" + Appelation + "\" /&gt;			\n"
                    + " 				&lt;i field=\"mothers_maiden_name\" value=\"" + MothersMName + "\" /&gt;  \n"
                    + "         		&lt;/mods&gt;				\n"
                    + "                 	&lt;ids&gt;\n"
                    + "                         	&lt;id code=\"" + IDCode + "\" ref=\"" + IDRef + "\"/&gt;\n"
                    //+ "				&lt;id code=\"" + IDCode2 + "\" ref=\"" + IDRef2 + "\"/&gt;\n"
                    + "                         &lt;/ids&gt;                 "
                    + "", ClientIP);
        } else if (Type.equals("RSA")) {
            GetDropDownList = albapi.RequestAPI("CreateNewCISRSA", "", 2,
                    "			&lt;mods&gt;\n"
                    + "                                 &lt;i field=\"username\" value=\"" + uh + "\" /&gt; \n"
                    + "				        &lt;i field=\"p_gender\" value=\"" + Gender + "\" /&gt; \n"
                    + "    				&lt;i field=\"title\" value=\"" + title + "\" /&gt; \n"
                    + "    				&lt;i field=\"lname\" value=\"" + Lname + "\" /&gt;  \n"
                    + "    				&lt;i field=\"fname\" value=\"" + FName + "\" /&gt;\n"
                    + "    				&lt;i field=\"mname\" value=\"" + MName + "\" /&gt; \n"
                    + "    				&lt;i field=\"email\" value=\"" + Email + "\" /&gt;\n"
                    + "    				&lt;i field=\"p_bday\" value=\"" + DOB + "\" /&gt;    \n"
                    + "    				&lt;i field=\"place_of_birth\" value=\"" + POB + "\" /&gt;\n"
                    + "    				&lt;i field=\"civil_status\" value=\"" + CivilStatus + "\" /&gt;\n"
                    + "    				&lt;i field=\"t_foreigner\" value=\"" + IsForeigner + "\" /&gt; \n"
                    + "    				&lt;i field=\"t_pep\" value=\"" + IsPolitician + "\" /&gt;  \n"
                    + "    				&lt;i field=\"h_sadd\" value=\"" + h_add + "\" /&gt;\n"
                    + "    				&lt;i field=\"h_village\" value=\"" + H_Village + "\" /&gt;\n"
                    + "    				&lt;i field=\"h_stayed_since\" value=\"" + StayedSince + "\" /&gt;\n"
                    + "    				&lt;i field=\"h_phone\" value=\"" + Phone + "\" /&gt;\n"
                    + "    				&lt;i field=\"h_mobile\" value=\"" + Mobile + "\" /&gt;\n"
                    + "                                 &lt;i field=\"nationality\" value=\"" + Nationality + "\" /&gt; \n"
                    + "                                 &lt;i field=\"source_of_fund_path\" value=\"" + SourceOfFund + "\" /&gt; \n"
                    + "                                 &lt;i field=\"job_title_path\" value=\"" + JobTitle + "\" /&gt; \n"
                    + "                                 &lt;i field=\"h_ownership\" value=\"" + Ownership + "\" /&gt;  \n"
                    + "                                 &lt;i field=\"dynamic_address\" value=\"" + DynamicAdd + "\" /&gt;  \n"
                    + "                                 &lt;i field=\"appelation\" value=\"" + Appelation + "\" /&gt;			\n"
                    + "                                 &lt;i field=\"mothers_maiden_name\" value=\"" + MothersMName + "\" /&gt;  \n"
                    + "                             &lt;/mods&gt;				\n"
                    + "                             &lt;ids&gt;\n"
                    + "                                 &lt;id code=\"" + IDCode + "\" ref=\"" + IDRef + "\"/&gt;\n"
                    //+ "                                 &lt;id code=\"" + IDCode2 + "\" ref=\"" + IDRef2 + "\"/&gt;\n"
                    + "                             &lt;/ids&gt;                 "
                    + "", ClientIP);
        }

        if (!GetDropDownList.equals("error")) {
            System.out.println(GetMytdt() + " Response : " + GetDropDownList);
            String ReturnCode = getResponseAttributesString(GetDropDownList, "Account.Info", "ReturnCode");
            String ErrMsg = getResponseAttributesString(GetDropDownList, "Account.Info", "ErrorMsg");
            System.out.println(GetMytdt() + " ReturnCode: " + ReturnCode);
            String AccountNumber = "", Cis_no = "";
            if (ReturnCode.equals("0")) {
                AccountNumber = getResponseAttributesString(GetDropDownList, "Account.Info", "full_acct_no");
                Cis_no = getResponseAttributesString(GetDropDownList, "Account.Info", "cis_no");
            }

            JSONObject DD = new JSONObject();
            try {
                DD.put("Account_Number", AccountNumber);
                DD.put("Cis_no", Cis_no);
                DD.put("ErrMsg", ErrMsg);
            } catch (JSONException ex) {
                System.out.println(GetMytdt() + " Error : " + ex);
                // DD.put("ErrMsg", ex);
                //Logger.getLogger(cis.class.getName()).log(Level.SEVERE, null, ex);
            }

            Dropdowns.put(DD);
            System.out.println(GetMytdt() + Dropdowns);

        }
        return Dropdowns;
    }

    public static JSONArray UploadDoc(String CIS, String ContentType, String Item, String DocString, String ClientIP) {
        JSONArray Dropdowns = new JSONArray();

        String GetDropDownList = albapi.RequestAPI("UploadDoc", " cis_no=\"" + CIS + "\" content_type=\"" + ContentType + "\"  item=\"" + Item + "\"", 2, "&lt;doc&gt; " + DocString + " &lt;/doc&gt;&lt;mini&gt;" + DocString + "&lt;/mini&gt;", ClientIP);
        if (!GetDropDownList.equals("error")) {
            System.out.println(GetMytdt() + " Response : " + GetDropDownList);
            String ReturnCode = getResponseAttributesString(GetDropDownList, "BPB_Binary.Info", "ReturnCode");
            System.out.println(GetMytdt() + " ReturnCode: " + ReturnCode);
            String docid = "";
            if (ReturnCode.equals("0")) {
                docid = getResponseAttributesString(GetDropDownList, "BPB_Binary.Info", "docid");
            }

            JSONObject DD = new JSONObject();
            try {
                DD.put("docid", docid);

            } catch (JSONException ex) {
                Logger.getLogger(cis.class.getName()).log(Level.SEVERE, null, ex);
            }

            Dropdowns.put(DD);
            System.out.println(GetMytdt() + Dropdowns);

        }
        return Dropdowns;
    }
}
