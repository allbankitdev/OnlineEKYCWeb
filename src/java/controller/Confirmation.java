/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author vgponciano
 */
public class Confirmation extends HttpServlet {

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
            out.println("<title>Servlet Confirmation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Confirmation at " + request.getContextPath() + "</h1>");
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
        // System.out.println(request.getAttributeNames() + " hahahha " + request.getParameterNames().toString());
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
        String mess = "", color = "", title = "", NotifMes = "";
        HttpSession session = request.getSession();
        String Ref = session.getAttribute("Reference").toString();

        String step = session.getAttribute("step").toString(); //get Current Step
        int NextStep = Integer.parseInt(step) + 1;
        String IDClass = "", IDRefNo = "", IDImgType = "", IDClass2 = "", IDRefNo2 = "", IDImgType2 = "", SigImgType = "", SelfieImgType = "";
        try {
            ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
            List<FileItem> items = sf.parseRequest(request);
            for (FileItem item : items) {
                //System.out.println(item.getFieldName());
                if (item.getFieldName().equals("inputIDClass")) {//inputIDClass
                    IDClass = item.getString();
                    session.setAttribute("IDClass", IDClass);

                } else if (item.getFieldName().equals("inputIDRef")) {
                    IDRefNo = item.getString();
                    session.setAttribute("IDRefNo", IDRefNo);
                } else if (item.getFieldName().equals("inputIDClass2")) {//inputIDClass
                    IDClass2 = item.getString();
                    session.setAttribute("IDClass2", IDClass2);
                } else if (item.getFieldName().equals("inputIDRef2")) {
                    IDRefNo2 = item.getString();
                    session.setAttribute("IDRefNo2", IDRefNo2);
                } else if (item.getFieldName().equals("ID")) {
                    IDImgType = item.getContentType();
                    String[] Filetype = IDImgType.split("/");
                    session.setAttribute("IDImgType", IDImgType);
                    item.write(new File("C:/ALB/EKYC/imgs/ID_" + Ref + "." + Filetype[1]));

                } else if (item.getFieldName().equals("ID2")) {
                    IDImgType2 = item.getContentType();
                    String[] Filetype = IDImgType2.split("/");
                    session.setAttribute("IDImgType2", IDImgType2);
                    item.write(new File("C:/ALB/EKYC/imgs/ID2_" + Ref + "." + Filetype[1]));

                } else if (item.getFieldName().equals("Signature")) {
                    SigImgType = item.getContentType();
                    String[] Filetype = SigImgType.split("/");
                    session.setAttribute("SigImgType", SigImgType);
                    item.write(new File("C:/ALB/EKYC/imgs/Sig_" + Ref + "." + Filetype[1]));

                } else if (item.getFieldName().equals("Selfie")) {
                    SelfieImgType = item.getContentType();
                    String[] Filetype = SelfieImgType.split("/");
                    session.setAttribute("SelfieImgType", SelfieImgType);
                    item.write(new File("C:/ALB/EKYC/imgs/Selfie_" + Ref + "." + Filetype[1]));

                }
            }
            title = "Success";
            color = "success";
            mess = "Form Uploaded!" + NextStep;
            session.setAttribute("step", NextStep);
        } catch (Exception ex) {
            title = "Alert";
            color = "danger";
            mess = ex.toString();
            NotifMes = "You cannot proceed to next Step. Error : " + ex;
        }
        System.out.println(GetMytdt() + title + ";;" + color + ";;" + mess);
        //response.getWriter().print(title + ";;" + color + ";;" + mess);
        RequestDispatcher rd = request.getRequestDispatcher("EKYCFormPart2.jsp");
        rd.forward(request, response);
    }

    public static String GetMytdt() {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX -- "); // Quoted "Z" to indicate UTC, no timezone offset
        Date startTime = new Date();
        startTime = new Date(startTime.getTime() - 0 * 1000);
        String nowAsISO = df.format(startTime);
        return nowAsISO;
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
