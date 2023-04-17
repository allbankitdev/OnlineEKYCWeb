/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connections.Client;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;
import models.dropdowns;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author vgponciano
 */
public class jumioAccount extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchCity</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchCity at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Client CF = new Client();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                OkHttpClient client = new OkHttpClient().newBuilder()
                    .build();
                  MediaType mediaType = MediaType.parse("application/json");
                  RequestBody body = RequestBody.create(mediaType, "{\n    \"customerInternalReference\": \"mycustomerreference\",\n    \"userReference\": \"youruserreference\",\n    \"callbackUrl\":\"https://requestbin.jumio.com/yoygusyo\",\n    \"workflowDefinition\": {\n        \"key\": 10011,\n        \"credentials\": [\n            {\n                \"category\": \"ID\",\n                \"type\": {\n                    \"values\": [\"ID_CARD\"],\n                    \"predefinedType\": \"DEFINED\"\n                },\n                \"country\": {\n                    \"values\": [\"PHL\"],\n                    \"predefinedType\": \"DEFINED\"\n                }\n            }\n        ]\n    }\n}");
                  Request request1 = new Request.Builder()
                    .url("https://account.apac-1.jumio.ai/api/v1/accounts")
                    .method("POST", body)
                    .addHeader("Content-Type", "application/json")
                    //.addHeader("Access-Control-Allow-Origin", "http://localhost:8080")
                    .addHeader("Access-Control-Expose-Headers", "Content-Length,API-Key")
                    .addHeader("Authorization", "Bearer "+request.getParameter("Request")+" ")
                    .build();
                  okhttp3.Response response1 = client.newCall(request1).execute();
                  
                  
                  //return response1.body().string();
                  //response.getWriter().print(response1.body().string());
                  
                  JSONObject obj,href;
                    try {
                        obj = new JSONObject(response1.body().string());
                        href = new JSONObject(obj.getString("web"));
                        System.out.println(obj);
                        System.out.println(href);
                         System.out.println(obj.getString("web"));
                         
                         System.out.println(href.getString("href"));
                         response.getWriter().print(href.getString("href"));
                    } catch (JSONException ex) {
                        Logger.getLogger(jumioAccount.class.getName()).log(Level.SEVERE, null, ex);
                     }

                   
                  
                  //response.getWriter().print(response1.body().string().toString());

                   
                  
                  //response.getWriter().print(response1.body().string().toString());
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
