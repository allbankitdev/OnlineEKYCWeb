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

public class dropdowns {

    public static JSONArray GetDropdownList(String Type, String ClientIP) {
        JSONArray Dropdowns = new JSONArray();

        String GetDropDownList = albapi.RequestAPI("Dropdowns", " gno=\"" + Type + "\" pnode=\"000\"", 2, "", ClientIP);
        if (!GetDropDownList.equals("error")) {
            System.out.println(GetMytdt() + "Response : " + GetDropDownList);
            String ReturnCode = getResponseAttributesString(GetDropDownList, "WebLoan.Info", "ReturnCode");
            System.out.println(GetMytdt() + "ReturnCode: " + ReturnCode);

            JSONArray DropdownsInfos = getResponseNodesJSONified(GetDropDownList, "mi");
            JSONObject DD = new JSONObject();

            for (int i = 0; i < DropdownsInfos.length(); i++) {
                try {
                    JSONObject explrObject = DropdownsInfos.getJSONObject(i);
                    DD.put(explrObject.get("id_code").toString(), explrObject.get("description"));
                } catch (JSONException ex) {
                    Logger.getLogger(dropdowns.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            Dropdowns.put(DD);
            System.out.println(GetMytdt() + Dropdowns);

        }
        return Dropdowns;
    }

    public static JSONArray GetSearchCity(String City, String ClientIP) {
        JSONArray Dropdowns = new JSONArray();

        String GetDropDownList = albapi.RequestAPI("SearchCity", " gno=\"99\" search=\"" + City + "\"", 2, "", ClientIP);
        System.out.println(GetMytdt() + "Response : " + GetDropDownList);
        if (!GetDropDownList.equals("error")) {
            String ReturnCode = getResponseAttributesString(GetDropDownList, "WebLoan.Info", "ReturnCode");
            System.out.println(GetMytdt() + "ReturnCode: " + ReturnCode);

            JSONArray DropdownsInfos = getResponseNodesJSONified(GetDropDownList, "mi");
            JSONObject DD = new JSONObject();

            for (int i = 0; i < DropdownsInfos.length(); i++) {
                try {
                    JSONObject explrObject = DropdownsInfos.getJSONObject(i);
                    DD.put(explrObject.get("id_code").toString(), explrObject.get("description"));
                } catch (JSONException ex) {
                    Logger.getLogger(dropdowns.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            Dropdowns.put(DD);
        }

        System.out.println(GetMytdt() + Dropdowns);
        return Dropdowns;
    }

    public static JSONArray getBrgyList(String City, String ClientIP) {
        JSONArray Dropdowns = new JSONArray();

        String GetDropDownList = albapi.RequestAPI("Dropdowns", " gno=\"99\" pnode=\"" + City + "\"", 2, "", ClientIP);
        System.out.println(GetMytdt() + "Response : " + GetDropDownList);
        if (!GetDropDownList.equals("error")) {
            String ReturnCode = getResponseAttributesString(GetDropDownList, "WebLoan.Info", "ReturnCode");
            System.out.println(GetMytdt() + "ReturnCode: " + ReturnCode);

            JSONArray DropdownsInfos = getResponseNodesJSONified(GetDropDownList, "mi");
            JSONObject DD = new JSONObject();

            for (int i = 0; i < DropdownsInfos.length(); i++) {
                try {
                    JSONObject explrObject = DropdownsInfos.getJSONObject(i);
                    DD.put(explrObject.get("path").toString(), explrObject.get("description"));
                } catch (JSONException ex) {
                    Logger.getLogger(dropdowns.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            Dropdowns.put(DD);
        }

        System.out.println(GetMytdt() + Dropdowns);
        return Dropdowns;
    }

    public static String GetMytdt() {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX -- "); // Quoted "Z" to indicate UTC, no timezone offset
        Date startTime = new Date();
        startTime = new Date(startTime.getTime() - 0 * 1000);
        String nowAsISO = df.format(startTime);
        return nowAsISO;
    }

}
