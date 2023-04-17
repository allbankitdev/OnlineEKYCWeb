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
public class jumioAccount_initialize extends HttpServlet {

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
                  MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
                  RequestBody body = RequestBody.create(mediaType, "grant_type=client_credentials");
                  Request request1 = new Request.Builder()
                    .url("https://auth.apac-1.jumio.ai/oauth2/token")
                    .method("POST", body)
                    .addHeader("Accept", "application/json")
                    .addHeader("Content-Type", "application/x-www-form-urlencoded")
                    //.addHeader("Access-Control-Allow-Origin", "http://localhost:8080")
                    .addHeader("Authorization", "Basic NWJkaWozNHVoaHAyNjVmYjdzMzVqYTQwdGM6MTc2cGJjZGRpbWcxOWxnbW1oNW42NzIwNTA4aG5hcWZxYXI4bWlhbnJhOWxsYWFkNGpkOQ==")
                    .addHeader("Cookie", "XSRF-TOKEN=ac51a998-90f7-4419-b638-373b1b13fa7a")
                    .build();
                    okhttp3.Response response1 = client.newCall(request1).execute();
                  
                  
                  //return response1.body().string();
                  //response.getWriter().print(response1.body().string());
                  
                  JSONObject obj;
                    try {
                        //System.out.println(response1.body().string());
                        //String jsondata= response1.body().string().toString();
                        //System.out.println(jsondata);
                        String access_token = "";
                        obj = new JSONObject(response1.body().string());
                        System.out.println(obj);
                        access_token = obj.getString("access_token");
                        System.out.println(access_token);
                        response.getWriter().print(access_token);
                    } catch (JSONException ex) {
                        Logger.getLogger(jumioAccount_initialize.class.getName()).log(Level.SEVERE, null, ex);
                    }
                  //access_token = new JSONObject(obj.getString("access_token"));
                  
                  //System.out.println(access_token);
                  // System.out.println(obj.getString("web"));
                  
                  //System.out.println(access_token.getString("access_token"));
                  //response.getWriter().print(jsondata);
                  //access_token = new JSONObject(obj.getString("access_token"));
                  
                  //System.out.println(access_token);
                  // System.out.println(obj.getString("web"));
                  
                  //System.out.println(access_token.getString("access_token"));
                  //response.getWriter().print(jsondata);
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
