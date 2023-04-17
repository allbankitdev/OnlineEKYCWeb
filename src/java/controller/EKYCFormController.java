/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import api.google;
import connections.Client;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.StringJoiner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.cis;
import models.dropdowns;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author vgponciano
 */
public class EKYCFormController extends HttpServlet {

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
            out.println("<title>Servlet EKYCFormController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EKYCFormController at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);

        //  System.out.println(request.getAttributeNames() + " hahahha " + request.getParameterNames().toString());
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
        //Get client IP  for logging purposes
        String ClientIP = CF.getClientIp(request);
        String mess = "", color = "", title = "", NotifMes = "";
        HttpSession session = request.getSession();
        String Ref = session.getAttribute("Reference").toString();

        String step = request.getParameter("step"); //get Current Step
        int NextStep = Integer.parseInt(step) + 1;

        if (step.equals("0")) {//Check If CIS exist
            //Get Captcha
            String gRecaptchaResponse1 = request.getParameter("captcha1");
            String gRecaptchaResponse2 = request.getParameter("captcha2");
            String gRecaptchaResponse3 = request.getParameter("captcha3");
            String gRecaptchaResponse = gRecaptchaResponse1 + gRecaptchaResponse2 + gRecaptchaResponse3;
            // Verify CAPTCHA.
            boolean valid = true;
            String errorString = "";
            valid = google.verify(gRecaptchaResponse);
            if (!valid) {
                errorString = "Captcha invalid!";
                title = "Alert";
                color = "danger";
                NotifMes = "You cannot proceed to next Step";
                mess = errorString;
            } else {

                boolean IsExist = true;
                String[] Validation = {"true", ""};
                String username = request.getParameter("inputUsername");
                String FirstName = request.getParameter("inputFirstName");
                String LastName = request.getParameter("inputLastName");
                String MiddleName = request.getParameter("inputMiddleName");
                String BDate = request.getParameter("inputBirthDate");
                String prefix = request.getParameter("inputPrefix");
                String appelation = request.getParameter("inputAppelation");

                //Checks if mandatory fields are filled-up
                if (username.equals("") || FirstName.equals("") || LastName.equals("") || BDate.equals("") || prefix.equals("")) {
                    title = "Alert";
                    color = "danger";
                    NotifMes = "You cannot proceed to next Step";
                    mess = "Please complete all required fields.";
                } else {
                    Validation = cis.ValidateInfo(username, FirstName, LastName, MiddleName, BDate, ClientIP);
                    if (!Validation[0].equals("0")) {// Costumer Already Exist in our CASA
                        title = "Alert";
                        color = "danger";
                        NotifMes = "You cannot proceed to next Step";
                        if (Validation[1].equals("Customer already exists.")) {
                            mess = Validation[1];
                        } else {
                            mess = "Something went wrong with your application. Please contact customercare@allbank.ph";
                        }

                    } else {
                        session.setAttribute("username", username.toLowerCase());
                        session.setAttribute("FirstName", ToProperCase(FirstName));
                        session.setAttribute("LastName", ToProperCase(LastName));
                        session.setAttribute("MiddleName", ToProperCase(MiddleName));
                        session.setAttribute("BDate", BDate);
                        session.setAttribute("prefix", prefix);
                        session.setAttribute("appelation", appelation);
                        title = "Success";
                        color = "success";
                        mess = "Information Validated";

//                        //Set DropdownValues for next Step
//                        JSONArray NationalityDropdownValues = dropdowns.GetDropdownList("27");
//                        JSONArray SourceOfFundDropdownValues = dropdowns.GetDropdownList("97");
//                        JSONArray JobTitleDropdownValues = dropdowns.GetDropdownList("98");
//                        JSONArray OwnershipDropdownValues = dropdowns.GetDropdownList("101");
//
//                        session.setAttribute("NationalityList", NationalityDropdownValues);
//                        session.setAttribute("SourceofFundList", SourceOfFundDropdownValues);
//                        session.setAttribute("JobTitleList", JobTitleDropdownValues);
//                        session.setAttribute("OwnershipList", OwnershipDropdownValues);
                        //Proceed to nextStep
                        session.setAttribute("step", NextStep);
                    }
                }

            }

        } else if (step.equals("1")) {//Get Data 
            String MobileNumber = "0" + request.getParameter("inputMobileNumber");
            String Gender = request.getParameter("inputGender");
            String Email = request.getParameter("inputEmailAddress");
            String POB = request.getParameter("inputPlaceOfBirth");
            String CivilStatus = request.getParameter("inputCivilStatus");
            String MotherMaidenName = request.getParameter("inputMotherMaidenName");

            //Address
            String[] CityDetails = request.getParameter("inputCity").split(";;");
            String[] BrgyDetails = request.getParameter("inputBrgy").split(";;");
            String HouseNo = request.getParameter("inputHouseNo");
            String Village = request.getParameter("inputVillage");
            String StayedSince = request.getParameter("inputStayedSince");
            String[] Ownership = request.getParameter("inputOwnership").split(";;");

            String[] SourceOfFund = request.getParameter("inputsource_of_fund").split(";;");
            String[] JobTitle = request.getParameter("inputJobTitle").split(";;");
            String[] Nationality = request.getParameter("inputNationality").split(";;");
            String IsForeigner = request.getParameter("IsForeigner");
            String IsPolitician = request.getParameter("IsPolitician");

            session.setAttribute("MobileNumber", MobileNumber);
            session.setAttribute("Gender", Gender);
            session.setAttribute("Email", Email);
            session.setAttribute("POB", ToProperCase(POB));
            session.setAttribute("CivilStatus", CivilStatus);
            session.setAttribute("MotherMaidenName", MotherMaidenName);
            //SourceOfFund
            if (SourceOfFund.length > 1) {
                session.setAttribute("SourceOfFund", SourceOfFund[0]);
                session.setAttribute("SourceOfFundName", SourceOfFund[1]);
            } else {
                session.setAttribute("SourceOfFund", "");
            }
            //JobTitle
            if (JobTitle.length > 1) {
                session.setAttribute("JobTitle", JobTitle[0]);
                session.setAttribute("JobTitleName", JobTitle[1]);
            } else {
                session.setAttribute("JobTitle", "");
            }
            //nationality
            if (Nationality.length > 1) {
                session.setAttribute("Nationality", Nationality[0]);
                session.setAttribute("NationalityName", Nationality[1]);
            } else {
                session.setAttribute("Nationality", "");
            }

            session.setAttribute("IsForeigner", IsForeigner);
            session.setAttribute("IsPolitician", IsPolitician);

            session.setAttribute("City", CityDetails[0]);
            session.setAttribute("Brgy", BrgyDetails[0]);
            session.setAttribute("CityName", CityDetails[1]);
            session.setAttribute("BrgyName", BrgyDetails[1]);
            session.setAttribute("HouseNo", HouseNo);
            session.setAttribute("Village", Village);
            session.setAttribute("StayedSince", StayedSince);
            session.setAttribute("Ownership", Ownership);
            //Ownership
            if (Ownership.length > 1) {
                session.setAttribute("Ownership", Ownership[0]);
                session.setAttribute("OwnershipName", Ownership[1]);
            } else {
                session.setAttribute("Ownership", "");
            }

            title = "Success";
            color = "success";
            mess = "Information Captured";
            //Proceed to nextStep
            session.setAttribute("step", NextStep);
        } else if (step.equals("2")) {//Get Attachments
            title = "Success";
            color = "success";
            mess = "Attachments Captured";
            session.setAttribute("step", NextStep);
        } else if (step.equals("3")) {//Confirmed
            String AccountType = session.getAttribute("AccountType").toString();
            String Username = session.getAttribute("username").toString();
            String Gender = session.getAttribute("Gender").toString();
            String Title = session.getAttribute("prefix").toString();
            String Lname = ToProperCase(session.getAttribute("LastName").toString());
            String Fname = ToProperCase(session.getAttribute("FirstName").toString());
            String MName = ToProperCase(session.getAttribute("MiddleName").toString());
            String Email = session.getAttribute("Email").toString();
            String DOB = session.getAttribute("BDate").toString();
            String POB = ToProperCase(session.getAttribute("POB").toString());
            String CivilStatus = session.getAttribute("CivilStatus").toString();
            String IsForeigner = session.getAttribute("IsForeigner").toString();
            String IsPolitician = session.getAttribute("IsPolitician").toString();
            String h_Add = ToProperCase(session.getAttribute("HouseNo").toString());
            String H_Village = ToProperCase(session.getAttribute("Village").toString());
            String StayedSince = session.getAttribute("StayedSince").toString();
            String Phone = "";//session.getAttribute("step").toString();
            String Mobile = session.getAttribute("MobileNumber").toString();
            String Nationality = session.getAttribute("Nationality").toString();
            String SourceOfFund = session.getAttribute("SourceOfFund").toString();
            String JobTitle = session.getAttribute("JobTitle").toString();
            String Ownership = session.getAttribute("Ownership").toString();
            String Dynamic_Add = session.getAttribute("Brgy").toString();
            String Appelation = session.getAttribute("appelation").toString();
            String MothersName = ToProperCase(session.getAttribute("MotherMaidenName").toString());
            //ID1
            String inputIDClass = session.getAttribute("IDClass").toString();
            String inputIDRef = session.getAttribute("IDRefNo").toString();
            String inputIDType = session.getAttribute("IDImgType").toString();
            String[] IDFiletype = inputIDType.split("/");
            String inputID = Base64_encoder("C:/ALB/EKYC/imgs/ID_" + Ref + "." + IDFiletype[1]);//request.getParameter("inputID");
            //ID2
            String inputIDRef2 = "";
            String inputIDClass2 = "";
            String inputIDType2 = "";
            String[] IDFiletype2 = new String[2];
            String inputID2 = "";
////          
//            if (AccountType.equals("RSA")) {
//                inputIDClass2 = session.getAttribute("IDClass2").toString();
//                inputIDRef2 = session.getAttribute("IDRefNo2").toString();
//                inputIDType2 = session.getAttribute("IDImgType2").toString();
//                IDFiletype2 = inputIDType2.split("/");
//                inputID2 = Base64_encoder("C:/ALB/EKYC/imgs/ID2_" + Ref + "." + IDFiletype2[1]);//request.getParameter("inputID");
////          
//            }
//          //Sig
            String inputSignatureType = session.getAttribute("SigImgType").toString();
            String[] SignatureFiletype = inputSignatureType.split("/");
            String inputSignature = Base64_encoder("C:/ALB/EKYC/imgs/Sig_" + Ref + "." + SignatureFiletype[1]);//request.getParameter("inputSignature");
            //Selfie
            String inputSelfieType = session.getAttribute("SelfieImgType").toString();
            String[] SelfieFiletype = inputSelfieType.split("/");
            String inputSelfie = Base64_encoder("C:/ALB/EKYC/imgs/Selfie_" + Ref + "." + SelfieFiletype[1]);//request.getParameter("inputSelfie");

            JSONArray AccoutInfoCreated = cis.CreateNewCIS(AccountType, Username, Gender, Title, Lname, Fname, MName, Email, DOB, POB, CivilStatus, IsForeigner, IsPolitician, h_Add, H_Village, StayedSince, Phone, Mobile, Nationality, SourceOfFund, JobTitle, Ownership, Dynamic_Add, Appelation, MothersName, inputIDClass, inputIDRef, inputIDClass2, inputIDRef2, ClientIP);

            String CIS = "", accountNumber = "", ErrMsg = "";
            for (int i = 0; i < AccoutInfoCreated.length(); i++) {
                try {
                    JSONObject explrObject = AccoutInfoCreated.getJSONObject(i);
                    CIS = explrObject.get("Cis_no").toString();
                    accountNumber = explrObject.get("Account_Number").toString();
                    ErrMsg = explrObject.get("ErrMsg").toString();

                } catch (JSONException ex) {
                    Logger.getLogger(dropdowns.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

            if (!CIS.equals("")) {
                //Upload Selfie
                cis.UploadDoc(CIS, inputSelfieType, "PIC01", inputSelfie, ClientIP);
                //Upload Signature
                cis.UploadDoc(CIS, inputSignatureType, "SGN01", inputSignature, ClientIP);

                //Upload ID1
                cis.UploadDoc(CIS, inputIDType, inputIDClass, inputID, ClientIP);

                //Upload ID2
                //cis.UploadDoc(CIS, ContentType, Item, Base64String);
                title = "Success";
                color = "success";
                mess = "Your username is <b style='color : orange'>" + Username + "</b>. Please login using your username and temporary password sent to your registered mobile number.";
                session.setAttribute("step", NextStep);
            } else {
                title = "Alert";
                color = "danger";
                NotifMes = "You cannot proceed to next Step";
                mess = "Something went wrong with your application. Please contact customercare@allbank.ph";//ErrMsg;
            }

        } else if (step.equals("4")) {// Get Card?
            title = "Success";
            color = "success";
            mess = "Card Info Captured";
            session.setAttribute("step", NextStep);
        }
        System.out.println(GetMytdt() + " " + title + ";;" + color + ";;" + mess + ";;" + step);
        step = session.getAttribute("step").toString(); //get Current Step
        if (step.equals("1")) {
            response.getWriter().print(title + ";;" + color + ";;" + mess + ";;" + session.getAttribute("step").toString()
                    + ";;" + session.getAttribute("NationalityList").toString()
                    + ";;" + session.getAttribute("SourceofFundList").toString()
                    + ";;" + session.getAttribute("JobTitleList").toString()
                    + ";;" + session.getAttribute("OwnershipList").toString());
        } else {
            response.getWriter().print(title + ";;" + color + ";;" + mess + ";;" + step);
        }
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

    public static String Base64_encoder(String filePath) {
        String base64File = "";
        File file = new File(filePath);
        try (FileInputStream imageInFile = new FileInputStream(file)) {
            // Reading a file from file system
            byte fileData[] = new byte[(int) file.length()];
            imageInFile.read(fileData);
            base64File = Base64.getEncoder().encodeToString(fileData);
        } catch (FileNotFoundException e) {
            System.out.println(GetMytdt() + "File not found" + e);
        } catch (IOException ioe) {
            System.out.println(GetMytdt() + "Exception while reading the file " + ioe);
        }
        return base64File;
    }

    public static String ToProperCase(String Word) {
        String Converted = "";
        if (!Word.equals("")) {
            String[] SplitedWord = Word.split(" ");
            String[] ConverterSplited = new String[SplitedWord.length];
            for (int i = 0; i < SplitedWord.length; i++) {
                ConverterSplited[i] = SplitedWord[i].substring(0, 1).toUpperCase() + SplitedWord[i].substring(1);
            }

            StringJoiner joiner = new StringJoiner(" ");
            for (int i = 0; i < ConverterSplited.length; i++) {
                joiner.add(ConverterSplited[i]);
            }
            Converted = joiner.toString();
        }

        return Converted;
    }

    public static String GetMytdt() {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX -- "); // Quoted "Z" to indicate UTC, no timezone offset
        Date startTime = new Date();
        startTime = new Date(startTime.getTime() - 0 * 1000);
        String nowAsISO = df.format(startTime);
        return nowAsISO;
    }

}
