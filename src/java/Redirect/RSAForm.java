/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Redirect;

import connections.Client;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.dropdowns;
import org.json.JSONArray;
import tools.hash;

/**
 *
 * @author vgponciano
 */
public class RSAForm extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RSAForm</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RSAForm at " + request.getContextPath() + "</h1>");
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
    Client CF = new Client();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ClientIP = CF.getClientIp(request);
        HttpSession session = request.getSession();
        hash.GetUUID();
        session.setAttribute("Reference", hash.GetUUID());
        session.setAttribute("step", "0");
        session.setAttribute("AccountType", "RSA");
        request.setAttribute("ProductType", "ATM (Regular Savings Account)");
        //Set DropdownValues for next Step
        JSONArray NationalityDropdownValues = dropdowns.GetDropdownList("27", ClientIP);
        JSONArray SourceOfFundDropdownValues = dropdowns.GetDropdownList("97", ClientIP);
        JSONArray JobTitleDropdownValues = dropdowns.GetDropdownList("98", ClientIP);
        JSONArray OwnershipDropdownValues = dropdowns.GetDropdownList("101", ClientIP);

        session.setAttribute("NationalityList", NationalityDropdownValues);
        session.setAttribute("SourceofFundList", SourceOfFundDropdownValues);
        session.setAttribute("JobTitleList", JobTitleDropdownValues);
        session.setAttribute("OwnershipList", OwnershipDropdownValues);
        //Proceed to nextStep
        //request.setAttribute("ProductType", "Cash Card");
        RequestDispatcher rd = request.getRequestDispatcher("EKYCFormYow.jsp");
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        hash.GetUUID();
        session.setAttribute("Reference", hash.GetUUID());
        session.setAttribute("step", "0");
        session.setAttribute("AccountType", "RSA");
        request.setAttribute("ProductType", "RSA (Regular Savings Account)");
        RequestDispatcher rd = request.getRequestDispatcher("EKYCForm.jsp");
        rd.forward(request, response);
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
