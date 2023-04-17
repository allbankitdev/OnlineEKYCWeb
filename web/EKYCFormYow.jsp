<%-- 
    Document   : index.jsp
    Created on : Aug 26, 2021, 3:01:40 PM
    Author     : vgponciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/> 
<fmt:formatDate value="${now}" var="DateTodayFormatted" type="date" pattern="yyyy-MM-dd"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>AllBank - Online EKYC</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="Bootstrap/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet'>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="Bootstrap/css/styles.css" rel="stylesheet" />
        <!-- SmartWizard -->
        <!--link href="https://cdn.jsdelivr.net/npm/smartwizard@5/dist/css/smart_wizard_all.min.css" rel="stylesheet" type="text/css" /-->
        <link href="Bootstrap/css/smart_wizard_all.min.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            var widgetId2;
            var onloadCallback = function () {
                widgetId2 = grecaptcha.render('html_element', {
                    'sitekey': '6LdZUFEcAAAAADgbWcg2b37NVt5VbAajkoKncR0P'
                });

            };
        </script>  
    </head>
    <body id="page-top" >
        <!-- Navigation-->
        <nav class="navbar fixed-top navbar-light bg-light">
            <center>
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.jsp"><img style="" class="w-25" src="dist/ALBlogo.png" alt="..." /></a>
                </div>
            </center>
        </nav>

        <button id="togglemodal" data-bs-toggle="modal" href="#portfolioModal1" style="display:none">
        </button>

        <section class="container-fluid" id="portfolio">
            <div class="container container-fluid">

                <br>
                <div class="col-sm-12 row">
                    <div class="col-sm-2">
                        <p></p>
                    </div>
                    <div class="col-sm-8 row">
                        <div class="card" style="box-shadow: 0px 0px 4px 1px rgba(0,0,0,0.25);">
                            <div class="card-body" id="cardbody">
                                <div class="text-center">
                                    <h4 class="section-heading text-uppercase">${ProductType} E-KYC Form</h4>
                                </div>
                                <br>

                                <div id="smartwizard">
                                    <ol class="nav row">
                                        <div  class="clearfix">
                                            <table width="100%" style="overflow-x: auto; overflow-wrap: break-word">
                                                <tr>
                                                    <td><li class="nav-item"><a class="nav-link" href="#step-1">Step 1</a></li></td>
                                                <td><li class="nav-item"><a class="nav-link" href="#step-2">Step 2</a></li></td>
                                                <td><li class="nav-item"><a class="nav-link" href="#step-3">Step 3</a></li></td>
                                                <td><li class="nav-item"><a class="nav-link" href="#step-4">Step 4</a></li></td>
                                                <td><li class="nav-item"><a class="nav-link" href="#step-5">Step 5</a></li></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ol>
                                    <div class="alert alert-warning" role="alert" id="alertSessionTimeout" style="display: none">
                                        Hi, your session is going to time out. Click <a href="#" onclick="ResetSession()" class="alert-link">here</a> to extend.
                                        <p id="sessionmin"></p>
                                    </div>
                                    <div class="alert alert-danger" role="alert" id="alertErrorMessage" style="display: none">

                                    </div>
                                    <div class="tab-content">
                                        <div id="step-1" class="tab-pane" role="tabpanel" aria-labelledby="step-1">

                                            <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer>
                                            </script>
                                            <div class=" card col-sm-12" >
                                                <div class="card-body">
                                                    <form class='EKYCForm' id="EKYCForm1">
                                                        <input type="text" name="step" hidden value="0"/>
                                                        <div class="form-group">
                                                            <label style="font-family: 'Raleway'" for="inputUsername">Username <text class="text-danger">*</text></label>
                                                            <input style="font-family: 'Raleway'" type="text" class="form-control" required name="inputUsername" id="inputUsername" placeholder=""  maxlength="20">
                                                        </div>
                                                        <div class="form-row row">
                                                            <div class="form-group col-sm-7">
                                                                <label style="font-family: 'Raleway'" for="inputEmail4">Last Name <text class="text-danger">*</text></label>
                                                                <input style="font-family: 'Raleway'" type="text" class="form-control" required name="inputLastName" id="inputLastName" placeholder=""  maxlength="50">
                                                            </div>
                                                            <div class="form-group col-sm-5">
                                                                <label style="font-family: 'Raleway'" for="inputPassword4">Prefix <text class="text-danger">*</text></label>
                                                                <select style="font-family: 'Raleway'" class="form-control" id="inputPrefix" name="inputPrefix" required>
                                                                    <option value=""></option>
                                                                    <option>Mr.</option>
                                                                    <option>Ms.</option>
                                                                    <option>Mrs.</option>
                                                                    <option>Dr.</option>
                                                                    <option>Miss</option>
                                                                    <option>Prof.</option>
                                                                    <option>Atty.</option>
                                                                    <option>Hon</option>
                                                                    <option>Lady</option>
                                                                    <option>Major</option>
                                                                    <option>Sir</option>
                                                                    <option>Madam</option>
                                                                    <option>Rev</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-row row">
                                                            <div class="form-group col-sm-7">
                                                                <label style="font-family: 'Raleway'; " for="inputEmail4">First Name <text class="text-danger">*</text></label>
                                                                <input style="font-family: 'Raleway'" type="text" class="form-control" name="inputFirstName" id="inputFirstName" placeholder="" required maxlength="50">
                                                            </div>
                                                            <div class="form-group col-sm-5">
                                                                <label style="font-family: 'Raleway'" for="inputPassword4">Appellation</label>
                                                                <select style="font-family: 'Raleway'" class="form-control" name="inputAppelation" id="inputAppelation" >
                                                                    <option value=""> </option>
                                                                    <option >Jr.</option>
                                                                    <option >Sr.</option>
                                                                    <option >III</option>
                                                                    <option >IV</option>
                                                                    <option >V</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-row row">
                                                            <div class="form-group col-sm-7">
                                                                <label style="font-family: 'Raleway'" for="inputEmail4">Middle Name</label>
                                                                <input style="font-family: 'Raleway'" type="text" class="form-control" name="inputMiddleName" id="inputMiddleName" placeholder="" maxlength="50">
                                                            </div>
                                                            <div class="form-group col-sm-5">
                                                                <label style="font-family: 'Raleway'" for="inputPassword4">Birth Date <text class="text-danger">*</text></label>
                                                                <input style="font-family: 'Raleway'" type="date" class="form-control" name="inputBirthDate" id="inputBirthDate" required max="${DateTodayFormatted}">
                                                            </div>
                                                        </div>
                                                        <div id='captcha-div' >
                                                            <input id='captcha1' name='captcha1' hidden>
                                                            <input id='captcha2' name='captcha2' hidden>
                                                            <input id='captcha3' name='captcha3' hidden>
                                                        </div>
                                                    </form>
                                                    <br>
                                                    <div id="html_element"></div>
                                                    <br>

                                                    <button type="button" onclick='ValidateCaptcha()' class="btn btn-success" >Next</button>


                                                </div>
                                            </div>
                                        </div>
                                        <div id="step-2" class="tab-pane" role="tabpanel" aria-labelledby="step-2">
                                            <c:choose>
                                                <c:when test="${AccountType == 'CashCard'}">
                                                    <div class=" card col-sm-12" >
                                                        <div class="card-body">
                                                            <form class='EKYCForm' id="EKYCForm2">
                                                                <input type="text" name="step" hidden value="1"/>
                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-7">
                                                                        <label style="font-family: 'Raleway'" for="inputEmail4">Mobile Number <text class="text-danger">*</text></label>
                                                                        <div class="input-group">
                                                                            <div class="input-group-prepend">
                                                                                <span style="font-family: 'Raleway'" class="input-group-text" id="inputGroupPrepend">+63</span>
                                                                            </div>
                                                                            <input style="font-family: 'Raleway'" type="number" class="form-control" name="inputMobileNumber" id="inputMobileNumber" placeholder="9876543210" aria-describedby="inputGroupPrepend" maxlength="10" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group col-sm-5">
                                                                        <label style="font-family: 'Raleway'" for="inputPassword4">Gender <text class="text-danger">*</text></label>
                                                                        <select style="font-family: 'Raleway'" class="form-control" name="inputGender" id="inputGender" required>
                                                                            <option value=""></option>
                                                                            <option value="1">Male</option>
                                                                            <option value="2">Female</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-family: 'Raleway'" for="inputUsername">Email Address <text class="text-danger">*</text></label>
                                                                    <input style="font-family: 'Raleway'" type="email" required class="form-control" name="inputEmailAddress" id="inputEmailAddress" placeholder=""  maxlength="50">
                                                                </div>
                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-7">
                                                                        <label style="font-family: 'Raleway'" for="inputEmail4">Place of Birth <text class="text-danger">*</text></label>
                                                                        <input style="font-family: 'Raleway'" type="text" class="form-control" name="inputPlaceOfBirth" id="inputPlaceOfBirth" placeholder="" required  maxlength="50">
                                                                    </div>
                                                                    <div class="form-group col-sm-5">
                                                                        <label style="font-family: 'Raleway'" for="inputPassword4">Civil Status</label>
                                                                        <select style="font-family: 'Raleway'" class="form-control" name="inputCivilStatus" id="inputCivilStatus">
                                                                            <option value="">Select Civil Status</option>
                                                                            <option value="0">Single</option>
                                                                            <option value="1">Married</option>
                                                                            <option value="2">Widow</option>
                                                                            <option value="3">Separated</option>
                                                                            <option value="4">Annulled</option>
                                                                            <option value="5">Single Parent</option>
                                                                            <option value="6">Single with Common Law</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-family: 'Raleway'" for="inputUsername">Mother's Maiden Name</label>
                                                                    <input style="font-family: 'Raleway'" type="text" class="form-control" name="inputMotherMaidenName" id="inputMotherMaidenName" placeholder=""  maxlength="50">
                                                                </div>
                                                                <br><hr>
                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-12">
                                                                        <label style="font-family: 'Raleway'" for="inputEmail4">Enter City or ZIP  <text class="text-danger">*</text></label>
                                                                        <div class="input-group">
                                                                            <input style="font-family: 'Raleway'" type="text" class="form-control" id="inputSearchCity" placeholder="Mandaluyong or 3019" aria-describedby="validationTooltipUsernamePrepend" required>
                                                                            <div class="input-group-prepend">
                                                                                <button type="button" class="btn btn-success" onclick="SearchCity();">Search</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-7">
                                                                        <label style="font-family: 'Raleway'" for="inputEmail4">City/Municipality <text class="text-danger">*</text></label>
                                                                        <select style="font-family: 'Raleway'"class="form-control" id="inputCity" name="inputCity" required><option value=""></option></select>
                                                                    </div>
                                                                    <div class="form-group col-sm-5">
                                                                        <label style="font-family: 'Raleway'" for="inputPassword4">Barangay <text class="text-danger">*</text></label>
                                                                        <select style="font-family: 'Raleway'" class="form-control" id="inputBrgy" name="inputBrgy" required>
                                                                            <option value=""></option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-7">
                                                                        <label style="font-family: 'Raleway'" for="inputUsername">House No., Street / Unit No., Bldg <text class="text-danger">*</text></label>
                                                                        <input style="font-family: 'Raleway'" type="text" required class="form-control" id="inputHouseNo" name="inputHouseNo" placeholder=""  maxlength="50">
                                                                    </div>
                                                                    <div class="form-group col-sm-5">
                                                                        <label style="font-family: 'Raleway'" for="inputUsername">Village <text class="text-danger"></text></label>
                                                                        <input style="font-family: 'Raleway'" type="text" class="form-control" id="inputVillage" name="inputVillage" placeholder=""  maxlength="50">
                                                                    </div>
                                                                </div>

                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-5">
                                                                        <label style="font-family: 'Raleway'" for="inputEmail4">Stayed Since</label>
                                                                        <input style="font-family: 'Raleway'" type="date" class="form-control" id="inputStayedSince" name="inputStayedSince" placeholder="" max="${DateTodayFormatted}">
                                                                    </div>
                                                                    <div class="form-group col-sm-7">
                                                                        <label style="font-family: 'Raleway'" for="inputPassword4">Ownership</label>
                                                                        <select style="font-family: 'Raleway'"  class="form-control" id="ownership" name="inputOwnership">
                                                                            <option value="">Select Ownership</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <br><hr>
                                                                <div class="form-group">
                                                                    <label style="font-family: 'Raleway'" for="inputUsername">Source of Fund</label>
                                                                    <select style="font-family: 'Raleway'" class="form-control" id="source_of_fund" name="inputsource_of_fund" data-sb-validations="required">
                                                                        <option value="">Select Source of Fund</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-family: 'Raleway'" for="inputUsername">Job Title</label>
                                                                    <select style="font-family: 'Raleway'" class="form-control" id="job_title" name="inputJobTitle" data-sb-validations="required">
                                                                        <option value="">Select Job Title</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-family: 'Raleway'" for="inputUsername">Nationality <text class="text-danger">*</text></label>
                                                                    <select style="font-family: 'Raleway'" class="form-control" id="nationality" name="inputNationality" required data-sb-validations="required">
                                                                        <option value="">Select Nationality</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-check form-switch">
                                                                    <input style="font-family: 'Raleway'" class="form-check-input" type="checkbox" id="IsForeignerCB">
                                                                    <input value="0" id="IsForeignerVal" name="IsForeigner" hidden>
                                                                    <label style="font-family: 'Raleway'" class="form-check-label" for="flexSwitchCheckDefault">Is Foreigner?</label>
                                                                </div>
                                                                <div class="form-check form-switch">
                                                                    <input style="font-family: 'Raleway'" class="form-check-input" type="checkbox" id="IsPoliticianCB">
                                                                    <input value="0" id="IsPoliticianVal" name="IsPolitician" hidden>
                                                                    <label style="font-family: 'Raleway'" class="form-check-label" for="flexSwitchCheckChecked">Is Politician?</label>
                                                                </div>
                                                                <br>

                                                                <button type="submit" class="btn btn-success" >Next</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:when test="${AccountType == 'RSA'}">
                                                    <div class=" card col-sm-12" >
                                                        <div class="card-body">
                                                            <form class='EKYCForm' id="EKYCForm2">
                                                                <input type="text" name="step" hidden value="1"/>
                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-7">
                                                                        <label style="font-family: 'Raleway'" for="inputEmail4">Mobile Number <text class="text-danger">*</text></label>
                                                                        <div class="input-group">
                                                                            <div class="input-group-prepend">
                                                                                <span style="font-family: 'Raleway'" class="input-group-text" id="inputGroupPrepend">+63</span>
                                                                            </div>
                                                                            <input style="font-family: 'Raleway'" type="number" class="form-control" name="inputMobileNumber" id="inputMobileNumber" placeholder="9876543210" aria-describedby="inputGroupPrepend" maxlength="10" required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group col-sm-5">
                                                                        <label style="font-family: 'Raleway'" for="inputPassword4">Gender <text class="text-danger">*</text></label>
                                                                        <select style="font-family: 'Raleway'" class="form-control" name="inputGender" id="inputGender" required>
                                                                            <option value=""></option>
                                                                            <option value="1">Male</option>
                                                                            <option value="2">Female</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-family: 'Raleway'" for="inputUsername">Email Address <text class="text-danger">*</text></label>
                                                                    <input style="font-family: 'Raleway'" type="email" required class="form-control" name="inputEmailAddress" id="inputEmailAddress" placeholder=""  maxlength="50">
                                                                </div>
                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-7">
                                                                        <label style="font-family: 'Raleway'" for="inputEmail4">Place of Birth <text class="text-danger">*</text></label>
                                                                        <input style="font-family: 'Raleway'" type="text" class="form-control" name="inputPlaceOfBirth" id="inputPlaceOfBirth" placeholder="" required  maxlength="50">
                                                                    </div>
                                                                    <div class="form-group col-sm-5">
                                                                        <label style="font-family: 'Raleway'" for="inputPassword4">Civil Status <text class="text-danger">*</text></label>
                                                                        <select style="font-family: 'Raleway'" class="form-control" name="inputCivilStatus" required id="inputCivilStatus">
                                                                            <option value="">Select Civil Status</option>
                                                                            <option value="0">Single</option>
                                                                            <option value="1">Married</option>
                                                                            <option value="2">Widow</option>
                                                                            <option value="3">Separated</option>
                                                                            <option value="4">Annulled</option>
                                                                            <option value="5">Single Parent</option>
                                                                            <option value="6">Single with Common Law</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-family: 'Raleway'" for="inputUsername">Mother's Maiden Name <text class="text-danger">*</text></label>
                                                                    <input style="font-family: 'Raleway'" type="text" class="form-control" name="inputMotherMaidenName" required id="inputMotherMaidenName" placeholder=""  maxlength="50">
                                                                </div>
                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-12">
                                                                        <label style="font-family: 'Raleway'" for="inputEmail4">Enter City or ZIP <text class="text-danger">*</text></label>
                                                                        <div class="input-group">
                                                                            <input style="font-family: 'Raleway'" type="text" class="form-control" id="inputSearchCity" placeholder="Mandaluyong or 3019" aria-describedby="validationTooltipUsernamePrepend" required>
                                                                            <div class="input-group-prepend">
                                                                                <button type="button" class="btn btn-success" onclick="SearchCity();">Search</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-7">
                                                                        <label style="font-family: 'Raleway'" for="inputEmail4">City/Municipality <text class="text-danger">*</text></label>
                                                                        <select style="font-family: 'Raleway'" class="form-control" id="inputCity" name="inputCity" required><option value=""></option></select>
                                                                    </div>
                                                                    <div class="form-group col-sm-5">
                                                                        <label style="font-family: 'Raleway'" for="inputPassword4">Barangay <text class="text-danger">*</text></label>
                                                                        <select style="font-family: 'Raleway'" class="form-control" id="inputBrgy" name="inputBrgy" required>
                                                                            <option value=""></option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-7">
                                                                        <label style="font-family: 'Raleway'" for="inputUsername">House No., Street / Unit No., Bldg <text class="text-danger">*</text></label>
                                                                        <input style="font-family: 'Raleway'" type="text" required class="form-control" id="inputHouseNo" name="inputHouseNo" placeholder=""  maxlength="50">
                                                                    </div>
                                                                    <div class="form-group col-sm-5">
                                                                        <label style="font-family: 'Raleway'" for="inputUsername">Village <text class="text-danger">*</text></label>
                                                                        <input style="font-family: 'Raleway'" type="text" required class="form-control" id="inputVillage" name="inputVillage" placeholder=""  maxlength="50">
                                                                    </div>
                                                                </div>

                                                                <div class="form-row row">
                                                                    <div class="form-group col-sm-5">
                                                                        <label style="font-family: 'Raleway'" for="inputEmail4">Stayed Since <text class="text-danger">*</text></label>
                                                                        <input style="font-family: 'Raleway'" type="date" class="form-control" id="inputStayedSince" name="inputStayedSince" placeholder="" required>
                                                                    </div>
                                                                    <div class="form-group col-sm-7">
                                                                        <label style="font-family: 'Raleway'" for="inputPassword4">Ownership <text class="text-danger">*</text></label>
                                                                        <select style="font-family: 'Raleway'"  class="form-control" id="ownership" name="inputOwnership" required>
                                                                            <option value="">Select Ownership</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-family: 'Raleway'" for="inputUsername">Source of Fund <text class="text-danger">*</text></label>
                                                                    <select style="font-family: 'Raleway'" class="form-control" id="source_of_fund" name="inputsource_of_fund" required data-sb-validations="required">
                                                                        <option value="">Select Source of Fund</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-family: 'Raleway'" for="inputUsername">Job Title <text class="text-danger">*</text></label>
                                                                    <select style="font-family: 'Raleway'" class="form-control" id="job_title" name="inputJobTitle"  required data-sb-validations="required">
                                                                        <option value="">Select Job Title</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label style="font-family: 'Raleway'" for="inputUsername">Nationality <text class="text-danger">*</text></label>
                                                                    <select style="font-family: 'Raleway'" class="form-control" id="nationality" name="inputNationality" required data-sb-validations="required">
                                                                        <option value="">Select Nationality</option>
                                                                    </select>
                                                                </div>
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="IsForeignerCB">
                                                                    <input value="0" id="IsForeignerVal" name="IsForeigner" hidden>
                                                                    <label style="font-family: 'Raleway'" class="form-check-label" for="flexSwitchCheckDefault">Is Foreigner?</label>
                                                                </div>
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="IsPoliticianCB">
                                                                    <input value="0" id="IsPoliticianVal" name="IsPolitician" hidden>
                                                                    <label style="font-family: 'Raleway'" class="form-check-label" for="flexSwitchCheckChecked">Is Politician?</label>
                                                                </div>
                                                                <br>
                                                                <button type="submit" class="btn btn-success" >Next</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div id="step-3" class="tab-pane" role="tabpanel" aria-labelledby="step-3">
                                             <iframe id="jumioframe" name ="jumioframe"  width="100%" height="600" allow="camera;fullscreen;accelerometer;gyroscope;magnetometer"></iframe>
                                             
                                            <!--<form enctype="multipart/form-data" method="post" id="EKYCFormFiles" action="Confirmation">  
                                                <input type="text" name="step" hidden value="2"/>
                                                <div>
                                                </div> 
                                                <c:choose>
                                                    <c:when test="${AccountType == 'CashCard'}">
                                                        <div class="form-row row">
                                                            <div class="form-group col-sm-4">
                                                                <label for="inputUsername">Type of ID</label>
                                                                <select class="form-control ids1" name="inputIDClass" id="inputIDClassZ" required  data-sb-validations="required">
                                                                    <option value="">Select ID Type</option>
                                                                    <option value='ID1'>Passport</option>
                                                                    <option value='ID2'>Driver`s License</option>
                                                                    <option value='ID3'>PRC ID</option>
                                                                    <option value='ID4'>NBI Clearance</option>
                                                                    <option value='ID5'>Police Clearance / Police Clearance ID</option>
                                                                    <option value='ID6'>Postal ID</option>
                                                                    <option value='ID7'>Voters ID / Voters Certification</option>
                                                                    <option value='ID8'>TIN</option>
                                                                    <option value='ID9'>Barangay Certification / Barangay ID</option>
                                                                    <option value='ID10'>GSIS e-Card/UMID</option>
                                                                    <option value='ID11'>SSS</option>
                                                                    <option value='ID12'>Senior Citizen Card</option>
                                                                    <option value='ID13'>Overseas Worker Welfare Admin (OWWA) ID</option>
                                                                    <option value='ID14'>OFW ID</option>
                                                                    <option value='ID15'>Seaman`s Book</option>
                                                                    <option value='ID16'>Alien/Immigrant Certificate of Reg.</option>
                                                                    <option value='ID17'>Government ID/GOCC ID</option>
                                                                    <option value='ID18'>Cert. from National Council (NCWDP)</option>
                                                                    <option value='ID19'>DSWD Certification</option>
                                                                    <option value='ID20'>Integrated Bar of the Phil. (IBP) ID</option>
                                                                    <option value='ID21'>Company ID</option>
                                                                    <option value='ID22'>School ID</option>
                                                                    <option value='ID23'>National ID</option>
                                                                    <option value='ID24'>SEC Certification of Registration</option>
                                                                    <option value='ID25'>Business Registration Certificate</option>
                                                                    <option value='ID26'>Seafarers’ Registration Certificate</option>
                                                                </select>  
                                                            </div>
                                                            <div class="form-group col-sm-4">
                                                                <label for="inputPassword4">ID Number</label>
                                                                <input type="text" class="form-control ids2" required id="inputIDRefZ" name="inputIDRef" placeholder=""  maxlength="20">
                                                            </div>
                                                            <div class="form-group col-sm-4">
                                                                <label for="inputPassword4">File <i class="fa fa-info-circle"  data-bs-toggle="modal" data-bs-target="#IDTipsModal"></i></label>
                                                                <input type="file" class="form-control" accept="image/*" required name="ID" id="ID">
                                                                <span id="IDspan"></span>   </div>
                                                        </div>
                                                    </c:when> 
                                                    <c:when test="${AccountType == 'RSA'}">
                                                        <div class="form-row row">
                                                            <div class="form-group col-sm-4">
                                                                <label for="inputUsername">Type of ID</label>
                                                                <select class="form-control ids1" name="inputIDClass" id="inputIDClassZ"  data-sb-validations="required">
                                                                    <option value="">Select ID Type</option>
                                                                    <option value='ID1'>Passport</option>
                                                                    <option value='ID2'>Driver`s License</option>
                                                                    <option value='ID3'>PRC ID</option>
                                                                    <option value='ID4'>NBI Clearance</option>
                                                                    <option value='ID5'>Police Clearance / Police Clearance ID</option>
                                                                    <option value='ID6'>Postal ID</option>
                                                                    <option value='ID7'>Voters ID / Voters Certification</option>
                                                                    <option value='ID8'>TIN</option>
                                                                    <option value='ID9'>Barangay Certification / Barangay ID</option>
                                                                    <option value='ID10'>GSIS e-Card/UMID</option>
                                                                    <option value='ID11'>SSS</option>
                                                                    <option value='ID12'>Senior Citizen Card</option>
                                                                    <option value='ID13'>Overseas Worker Welfare Admin (OWWA) ID</option>
                                                                    <option value='ID14'>OFW ID</option>
                                                                    <option value='ID15'>Seaman`s Book</option>
                                                                    <option value='ID16'>Alien/Immigrant Certificate of Reg.</option>
                                                                    <option value='ID17'>Government ID/GOCC ID</option>
                                                                    <option value='ID18'>Cert. from National Council (NCWDP)</option>
                                                                    <option value='ID19'>DSWD Certification</option>
                                                                    <option value='ID20'>Integrated Bar of the Phil. (IBP) ID</option>
                                                                    <option value='ID21'>Company ID</option>
                                                                    <option value='ID22'>School ID</option>
                                                                    <option value='ID23'>National ID</option>
                                                                    <option value='ID24'>SEC Certification of Registration</option>
                                                                    <option value='ID25'>Business Registration Certificate</option>
                                                                    <option value='ID26'>Seafarers’ Registration Certificate</option>
                                                                </select>  
                                                            </div>
                                                            <div class="form-group col-sm-4">
                                                                <label for="inputPassword4">ID Number</label>
                                                                <input type="text" class="form-control ids2" id="inputIDRefZ" name="inputIDRef" required placeholder=""  maxlength="20">
                                                            </div>
                                                            <div class="form-group col-sm-4">
                                                                <label for="inputPassword4">File <i class="fa fa-info-circle"  data-bs-toggle="modal" data-bs-target="#IDTipsModal"></i></label>
                                                                <input type="file" class="form-control" accept="image/*" required name="ID" id="ID">
                                                                <span id="IDspan"></span>   </div>
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                                <br><div class="form-group">
                                                    <label for="inputUsername">Signature <i class="fa fa-info-circle"  data-bs-toggle="modal" data-bs-target="#SigTipsModal"></i></label>
                                                    <input type="file" class="form-control" accept="image/*" name="Signature" id="Signature">
                                                    <span id="Signaturespan"></span>
                                                </div>

                                                <br><div class="form-group">
                                                    <label for="inputUsername">Selfie <i class="fa fa-info-circle"  data-bs-toggle="modal" data-bs-target="#SelfieTipsModal"></i></label>
                                                    <input type="file" class="form-control" max-file-size="1000000" accept="image/*" capture name="Selfie" id="Selfie">
                                                    <span id="Selfiespan"></span>

                                                </div>
                                                <br>

                                                <div class='row' hidden>
                                                    <div class='col-4'>
                                                        <canvas id= "IDCanvas" width="100px" height="100px"></canvas>

                                                    </div>
                                                    <div class='col-4'>
                                                        <canvas id= "SignatureCanvas" width="100px" height="100px"></canvas>

                                                    </div>
                                                    <div class='col-4'>
                                                        <canvas id= "SelfieCanvas" width="100px" height="100px"></canvas>

                                                    </div>

                                                </div>


                                                <button type="button" class="btn btn-primary" onclick="ValidateFile()" >Next</button>
                                            </form>-->
                                        </div>
                                        <div id="step-4" class="tab-pane" role="tabpanel" aria-labelledby="step-4"></div>
                                        <div id="step-5" class="tab-pane" role="tabpanel" aria-labelledby="step-5"></div>
                                    </div>
                                </div>    
                            </div>
                        </div>
                        <div><p id="ErrorLog"></p></div>
                    </div>

                    <div class="col-sm-2">
                        <p></p>
                    </div>

                </div>
            </div>
        </section>

        <!-- Portfolio Modals-->
        <!-- Portfolio item 1 modal popup-->
        <!--div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" id="portfolioModal1" aria-labelledby="mySmallModalLabel" aria-hidden="true"-->
        <div class="modal fade" id="portfolioModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg  modal-dialog-centered">
                <div class="modal-content" style="background-color : #29292975">

                    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <center><img src="Bootstrap/assets/img/tips/IDTipsGIF.gif" width="100%" class="d-block w-30" alt="..."></center>
                                <div class="carousel-caption d-none d-md-block">

                                </div>
                            </div>
                            <div class="carousel-item">
                                <center><img src="Bootstrap/assets/img/tips/SignatureTipsGIF.gif" width="100%" class="d-block w-30" alt="..."></center>
                                <div class="carousel-caption d-none d-md-block">
                                </div>
                            </div>
                            <div class="carousel-item">
                                <center><img src="Bootstrap/assets/img/tips/SelfieTipsGIF.gif" width="100%" class="d-block w-30" alt="..."></center>

                                <div class="carousel-caption d-none d-md-block">
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"  style="background-image: url(https://img.icons8.com/color/50/000000/circled-chevron-left.png)"  aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                            <span class="carousel-control-next-icon"  style="background-image: url(https://img.icons8.com/color/50/000000/circled-chevron-right.png)"  aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" id="aLoadingModal" aria-labelledby="mySmallModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-md modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <center>
                            <div class="spinner-border" style="width: 5rem; height: 5rem;" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="LoadingModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-body">
                        <center>
                            <div class="spinner-border" style="width: 5rem; height: 5rem;" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </center> </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="IDTipsModal"  data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg  modal-dialog-centered">
                <div class="modal-content" style="background-color : #29292975">

                    <div id="carouselExampleCaptions1" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleCaptions1" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <center><img src="Bootstrap/assets/img/tips/IDTipsGIF.gif" width="100%" class="d-block w-30" alt="..."></center>
                                <div class="carousel-caption d-none d-md-block">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="SigTipsModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg  modal-dialog-centered">
                <div class="modal-content" style="background-color : #29292975">
                    <div id="carouselExampleCaptions2" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <center><img src="Bootstrap/assets/img/tips/SignatureTipsGIF.gif" width="100%" class="d-block w-30" alt="..."></center>
                                <div class="carousel-caption d-none d-md-block">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="SelfieTipsModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg  modal-dialog-centered">
                <div class="modal-content" style="background-color : #29292975">
                    <div id="carouselExampleCaptions3" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleCaptions3" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <center><img src="Bootstrap/assets/img/tips/SelfieTipsGIF.gif" width="100%" class="d-block w-30" alt="..."></center>
                                <div class="carousel-caption d-none d-md-block">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <img hidden src="dist/NoPreview.png" id='nopreviewimg' />
        </div>


        <!--jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="Bootstrap/js/scripts.js"></script>
        <script src="Bootstrap/js/ekycform.js"></script>
        <!-- Smart Wizard-->
        <script src="https://cdn.jsdelivr.net/npm/smartwizard@5/dist/js/jquery.smartWizard.min.js" type="text/javascript"></script>

        <script>
             $.ajax({
                          url: 'jumioAccount_initialize',
                          type: 'POST',
                          success: function (data) {
                                   var access = "";
                                   access = data;
                                   //const obj = JSON.parse(access);
                                   console.log(access);
                                   
                                    $.ajax({
                                            url: 'jumioAccount',
                                            type: 'POST',
                                            data: {Request: access},
                                            success: function (data) {
                                                     const json = JSON.stringify(data);
                                                     const obj = JSON.parse(json);
                                                     console.log(obj);
                                                     document.getElementById("jumioframe").setAttribute("src",obj);
                                                                                  //$('#inputBrgy').html('<option value="">Select Brgy</option>' + produceOptionsAddress(CityList))
                                                                                  //$('#inputCity').append(produceOptions(CityList));
                                                         },
                                                         error: function (xhr, ajaxOptions, thrownError) {
                                                              console.log("Error!" + thrownError);
                                                           }
                                                        }); 
                                       
                                       },
                                       error: function (xhr, ajaxOptions, thrownError) {
                                            console.log("Error!" + thrownError);
                                         }
                                      }); 
            
                    
              
        function receiveMessage(event) {
	var data = window.JSON.parse(event.data);
	console.log('Netverify Web was loaded in an iframe.');
	console.log('auth token:', data.authorizationToken);
	console.log('transaction reference:', data.transactionReference);
	console.log('customer internal reference:', data.customerInternalReference);
	console.log('event type:', data.eventType);
	console.log('date-time:', data.dateTime);
	console.log('event value:', data.payload.value);
            if(data.payload.value === "success"){
                window.location.href = "#step-4";
            }
	console.log('event metainfo:', data.payload.metainfo);
        }
        window.addEventListener("message", receiveMessage, false);     
        
        
        
        
        
                                                    var _0xb029 = ["\x63\x61\x72\x6F\x75\x73\x65\x6C\x45\x78\x61\x6D\x70\x6C\x65\x43\x61\x70\x74\x69\x6F\x6E\x73", "\x67\x65\x74\x45\x6C\x65\x6D\x65\x6E\x74\x42\x79\x49\x64", "\x73\x6C\x69\x64\x2E\x62\x73\x2E\x63\x61\x72\x6F\x75\x73\x65\x6C", "\x74\x6F\x67\x67\x6C\x65", "\x6D\x6F\x64\x61\x6C", "\x23\x70\x6F\x72\x74\x66\x6F\x6C\x69\x6F\x4D\x6F\x64\x61\x6C", "\x61\x64\x64\x45\x76\x65\x6E\x74\x4C\x69\x73\x74\x65\x6E\x65\x72"];
                                                    var Cycle = 0;
                                                    var myCarousel = document[_0xb029[1]](_0xb029[0]);
                                                    myCarousel[_0xb029[6]](_0xb029[2], function () {
                                                        if (Cycle == 2) {
                                                            $(_0xb029[5])[_0xb029[4]](_0xb029[3]);
                                                            Cycle = 0
                                                        } else {
                                                            Cycle++
                                                        }
                                                    })
                                                    var _0x758e = ["\x76\x61\x6C", "\x23\x67\x2D\x72\x65\x63\x61\x70\x74\x63\x68\x61\x2D\x72\x65\x73\x70\x6F\x6E\x73\x65", "\x73\x6C\x69\x63\x65", "\x23\x63\x61\x70\x74\x63\x68\x61\x31", "\x23\x63\x61\x70\x74\x63\x68\x61\x32", "\x23\x63\x61\x70\x74\x63\x68\x61\x33", "", "\x73\x75\x62\x6D\x69\x74", "\x23\x45\x4B\x59\x43\x46\x6F\x72\x6D\x31", "\x73\x68\x6F\x77", "\x50\x6C\x65\x61\x73\x65\x20\x76\x65\x72\x69\x66\x79\x20\x74\x68\x61\x74\x20\x79\x6F\x75\x20\x61\x72\x65\x20\x6E\x6F\x74\x20\x61\x20\x72\x6F\x62\x6F\x74\x2E", "\x74\x65\x78\x74", "\x23\x61\x6C\x65\x72\x74\x45\x72\x72\x6F\x72\x4D\x65\x73\x73\x61\x67\x65"];
                                                    function ValidateCaptcha() {
                                                        var _0x2146x2 = $(_0x758e[1])[_0x758e[0]]();
                                                        $(_0x758e[3])[_0x758e[0]](_0x2146x2[_0x758e[2]](0, 100));
                                                        $(_0x758e[4])[_0x758e[0]](_0x2146x2[_0x758e[2]](100, 200));
                                                        $(_0x758e[5])[_0x758e[0]](_0x2146x2[_0x758e[2]](200));
                                                        if (_0x2146x2 !== _0x758e[6]) {
                                                            $(_0x758e[8])[_0x758e[7]]()
                                                        } else {
                                                            $(_0x758e[12])[_0x758e[11]](_0x758e[10])[_0x758e[9]]()
                                                        }
                                                    }
                                                    $('.EKYCForm').submit(function (e) {
                                                        $('#LoadingModal').modal('toggle');

                                                        var returnmess = "", title = "", color = "", mess = "", userid = "", step = "";
                                                        var form = $(this);
                                                        var dataArray = $(form).serializeArray();
                                                        $.ajax({
                                                            url: 'EKYCFormController',
                                                            type: 'Post',
                                                            data: dataArray,
                                                            success: function (data) {
                                                                topFunction();
                                                                returnmess = data.split(";;");
                                                                title = returnmess[0];
                                                                color = returnmess[1];
                                                                mess = returnmess[2];
                                                                step = returnmess[3];
                                                                //  $.toaster({message: mess, title: title, priority: color});
                                                                if (title === "Alert") {
                                                                    $('#alertErrorMessage').text(mess).show();
                                                                    if (mess == 'Please complete all required fields.') {

                                                                        $('input,select', $('#EKYCForm1')).each(function () {
                                                                            if ($(this).val() === '') {
                                                                                if ($(this).attr('required') === 'required') {
                                                                                    console.log($(this).css('border-color'));
                                                                                    $(this).css("border-color", "#FF0000");
                                                                                }
                                                                            } else {
                                                                                $(this).css("border-color", 'rgb(206, 212, 218)');
                                                                            }
                                                                        });

                                                                    }
                                                                } else if (title === "Success") {
                                                                    $('#alertErrorMessage').text("").hide();
                                                                    $(this).html("");
                                                                    $('#smartwizard').smartWizard("next");
                                                                }


                                                                setTimeout(function () {
                                                                    $('#LoadingModal').modal('toggle');
                                                                }, 1000)
                                                                if (step == 2) {
                                                                    $('#portfolioModal').modal('toggle');
                                                                }
                                                                if ('${step}' === '0') {
                                                                    $('#captcha1').val("");
                                                                    $('#captcha2').val("");
                                                                    $('#captcha3').val("");
                                                                    grecaptcha.reset(widgetId2);
                                                                    $('#cardbody').css("min-height", $('#cardbody').height() + 100)
                                                                }
                                                            },
                                                            error: function (xhr, ajaxOptions, thrownError) {
                                                                console.log("Error! Form Submit " + thrownError);
                                                            }
                                                        });
                                                        e.preventDefault();
                                                    });

                                                    function SearchCity(id) {
                                                        var City = $('#inputSearchCity').val();
                                                        $.ajax({
                                                            url: 'SearchCity',
                                                            type: 'POST',
                                                            data: {City: City, arg: "1"},
                                                            success: function (data) {
                                                                //console.log("data : " + data)
                                                                var CityList = []//[{"ANTCU":"ANTCU","SNNICOLAS":"SNNICOLAS","AGULN":"AGULN","ILOBAL":"ILOBAL","PANMAL":"PANMAL","NOSALAS":"NOSALAS","MAGDA":"MAGDA","BATSANNI":"BATSANNI","BASTL":"BASTL","ILOSN":"ILOSN","LDSPU":"LDSPU","LASPIÑAS":"LASPIÑAS","ABRDAN":"ABRDAN","PANVI":"PANVI","AURDI":"AURDI","PANCA":"PANCA","PANSN":"PANSN","CAGLAS":"CAGLAS","BUKCA":"BUKCA"}];
                                                                CityList = jQuery.parseJSON(data)
                                                                $('#inputCity').html('<option value="">Select City/Municipality</option>' + produceOptionsAddress(CityList))
                                                                //$('#inputCity').append(produceOptions(CityList));
                                                            },
                                                            error: function (xhr, ajaxOptions, thrownError) {
                                                                console.log("Error! City Listing" + thrownError);
                                                            }
                                                        });
                                                    }
                                                    $('#inputCity').on("change", function () {
                                                        var City = $(this).val();
                                                        $.ajax({
                                                            url: 'SearchCity',
                                                            type: 'POST',
                                                            data: {City: $(this).val(), arg: 2},
                                                            success: function (data) {
                                                                //console.log(data)
                                                                var CityList = []//[{"ANTCU":"ANTCU","SNNICOLAS":"SNNICOLAS","AGULN":"AGULN","ILOBAL":"ILOBAL","PANMAL":"PANMAL","NOSALAS":"NOSALAS","MAGDA":"MAGDA","BATSANNI":"BATSANNI","BASTL":"BASTL","ILOSN":"ILOSN","LDSPU":"LDSPU","LASPIÑAS":"LASPIÑAS","ABRDAN":"ABRDAN","PANVI":"PANVI","AURDI":"AURDI","PANCA":"PANCA","PANSN":"PANSN","CAGLAS":"CAGLAS","BUKCA":"BUKCA"}];
                                                                CityList = jQuery.parseJSON(data)
                                                                $('#inputBrgy').html('<option value="">Select Brgy</option>' + produceOptionsAddress(CityList))
                                                                //$('#inputCity').append(produceOptions(CityList));
                                                            },
                                                            error: function (xhr, ajaxOptions, thrownError) {
                                                                console.log("Error! Brgy Listing" + thrownError);
                                                            }
                                                        });
                                                    });
                                                    function produceOptionsAddress(List) {
                                                        // console.log(List)
                                                        var populated_options = "";
                                                        $.each(List, function (key, value) {
                                                            var object = value;
                                                            $.each(object, function (k, v) {
                                                                populated_options += "<option value='" + k + ";;" + v + "'>" + v + "</option>";
                                                            })
                                                        });
                                                        return populated_options;
                                                    }

                                                    function produceOptions(List) {
                                                        // console.log(List)
                                                        var populated_options = "";
                                                        $.each(List, function (key, value) {
                                                            var object = value;
                                                            $.each(object, function (k, v) {
                                                                populated_options += "<option value='" + k + ";;" + v + "'>" + v + "</option>";
                                                            })
                                                        });
                                                        return populated_options;
                                                    }

                                                    var nationalities =${NationalityList}

                                                    $('#nationality').append(produceOptions(nationalities))

                                                    var SourceofFunds =${SourceofFundList}
                                                    $('#source_of_fund').append(produceOptions(SourceofFunds))

                                                    var JobTitle =${JobTitleList}
                                                    $('#job_title').append(produceOptions(JobTitle))

                                                    var Ownership =${OwnershipList}
                                                    $('#ownership').append(produceOptions(Ownership))
                                                    var _0x6c0a = ["", "\x68\x74\x6D\x6C", "\x23", "\x73\x70\x61\x6E", "\x62\x6F\x72\x64\x65\x72\x2D\x63\x6F\x6C\x6F\x72", "\x23\x46\x30\x46\x30\x46\x30", "\x63\x73\x73", "\x6C\x65\x6E\x67\x74\x68", "\x66\x69\x6C\x65\x73", "\x50\x6C\x65\x61\x73\x65\x20\x61\x74\x74\x61\x63\x68\x20\x66\x69\x6C\x65", "\x23\x46\x46\x30\x30\x30\x30", "\x72\x67\x62\x28\x32\x30\x36\x2C\x20\x32\x31\x32\x2C\x20\x32\x31\x38\x29", "\x73\x69\x7A\x65", "\x46\x69\x6C\x65\x20\x73\x69\x7A\x65\x20\x69\x73\x20\x67\x72\x65\x61\x74\x65\x72\x20\x74\x68\x61\x6E\x20\x31\x4D\x42", "\x76\x61\x6C", "\x72\x65\x71\x75\x69\x72\x65\x64", "\x61\x74\x74\x72", "\x6C\x6F\x67", "\x49\x44", "\x53\x69\x67\x6E\x61\x74\x75\x72\x65", "\x53\x65\x6C\x66\x69\x65", "\x73\x75\x62\x6D\x69\x74", "\x23\x45\x4B\x59\x43\x46\x6F\x72\x6D\x46\x69\x6C\x65\x73", "\x74\x6F\x67\x67\x6C\x65", "\x6D\x6F\x64\x61\x6C", "\x23\x4C\x6F\x61\x64\x69\x6E\x67\x4D\x6F\x64\x61\x6C", "\x65\x61\x63\x68", "\x69\x6E\x70\x75\x74\x2C\x73\x65\x6C\x65\x63\x74"];
                                                    function validate(_0x8e05x2) {
                                                        $(_0x6c0a[2] + _0x8e05x2 + _0x6c0a[3])[_0x6c0a[1]](_0x6c0a[0]);
                                                        $(_0x6c0a[2] + _0x8e05x2 + _0x6c0a[0])[_0x6c0a[6]](_0x6c0a[4], _0x6c0a[5]);
                                                        if ($(_0x6c0a[2] + _0x8e05x2 + _0x6c0a[0])[0][_0x6c0a[8]][_0x6c0a[7]] < 1) {
                                                            $(_0x6c0a[2] + _0x8e05x2 + _0x6c0a[3])[_0x6c0a[1]](_0x6c0a[9]);
                                                            $(_0x6c0a[2] + _0x8e05x2 + _0x6c0a[0])[_0x6c0a[6]](_0x6c0a[4], _0x6c0a[10]);
                                                            return false
                                                        } else {
                                                            $(_0x6c0a[2] + _0x8e05x2 + _0x6c0a[3])[_0x6c0a[1]](_0x6c0a[0]);
                                                            $(_0x6c0a[2] + _0x8e05x2 + _0x6c0a[0])[_0x6c0a[6]](_0x6c0a[4], _0x6c0a[11]);
                                                            var _0x8e05x3 = $(_0x6c0a[2] + _0x8e05x2 + _0x6c0a[0])[0][_0x6c0a[8]][0][_0x6c0a[12]];
                                                            if (_0x8e05x3 > 1000000) {
                                                                $(_0x6c0a[2] + _0x8e05x2 + _0x6c0a[3])[_0x6c0a[1]](_0x6c0a[13]);
                                                                $(_0x6c0a[2] + _0x8e05x2 + _0x6c0a[0])[_0x6c0a[6]](_0x6c0a[4], _0x6c0a[10]);
                                                                return false
                                                            }
                                                            ;
                                                            return true
                                                        }
                                                    }
                                                    var isIDLim = false;
                                                    var IsSigLim = false;
                                                    var IsSelfieLim = false;
                                                    function ValidateFile() {
                                                        var _0x8e05x8 = 0;
                                                        $(_0x6c0a[27], $(_0x6c0a[22]))[_0x6c0a[26]](function () {
                                                            if ($(this)[_0x6c0a[14]]() === _0x6c0a[0]) {
                                                                if ($(this)[_0x6c0a[16]](_0x6c0a[15]) === _0x6c0a[15]) {
                                                                    console[_0x6c0a[17]]($(this)[_0x6c0a[6]](_0x6c0a[4]));
                                                                    $(this)[_0x6c0a[6]](_0x6c0a[4], _0x6c0a[10]);
                                                                    _0x8e05x8++
                                                                }
                                                            } else {
                                                                $(this)[_0x6c0a[6]](_0x6c0a[4], _0x6c0a[11])
                                                            }
                                                            ;
                                                            if (_0x8e05x8 < 1) {
                                                                isIDLim = validate(_0x6c0a[18]);
                                                                IsSigLim = validate(_0x6c0a[19]);
                                                                IsSelfieLim = validate(_0x6c0a[20]);
                                                                if (isIDLim === true && IsSigLim === true && IsSelfieLim === true) {
                                                                    $(_0x6c0a[22])[_0x6c0a[21]]();
                                                                    $(_0x6c0a[25])[_0x6c0a[24]](_0x6c0a[23])
                                                                }
                                                            }
                                                        })
                                                    }
        </script>
        <script>
            $(document).ready(function () {
                setTimeout(function () {
                    $('#cardbody').css("min-height", $('#cardbody').height() + 100)
                }, 1000)
                $('[name="AFHTOKEN"]').addClass("AFHTokenRetain")
                $('#smartwizard').smartWizard({
                    selected: 0, // Initial selected step, 0 = first step
                    theme: 'dots', // theme for the wizard, related css need to include for other than default theme
                    justified: true, // Nav menu justification. true/false
                    darkMode: false, // Enable/disable Dark Mode if the theme supports. true/false
                    autoAdjustHeight: true, // Automatically adjust content height
                    cycleSteps: false, // Allows to cycle the navigation of steps
                    backButtonSupport: true, // Enable the back button support
                    enableURLhash: true, // Enable selection of the step based on url hash
                    transition: {
                        animation: 'fade', // Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
                        speed: '400', // Transion animation speed
                        easing: '' // Transition animation easing. Not supported without a jQuery easing plugin
                    },
                    toolbarSettings: {
                        toolbarPosition: 'bottom', // none, top, bottom, both
                        toolbarButtonPosition: 'right', // left, right, center
                        showNextButton: false, // show/hide a Next button
                        showPreviousButton: false, // show/hide a Previous button
                        toolbarExtraButtons: [] // Extra buttons to show on toolbar, array of jQuery input/buttons elements
                    },
                    anchorSettings: {
                        anchorClickable: false, // Enable/Disable anchor navigation
                        enableAllAnchors: false, // Activates all anchors clickable all times
                        markDoneStep: true, // Add done state on navigation
                        markAllPreviousStepsAsDone: true, // When a step selected by url hash, all previous steps are marked done
                        removeDoneStepOnNavigateBack: false, // While navigate back done step after active step will be cleared
                        enableAnchorOnDoneStep: true // Enable/Disable the done steps navigation
                    },
                    keyboardSettings: {
                        keyNavigation: false, // Enable/Disable keyboard navigation(left and right keys are used if enabled)
                        keyLeft: [37], // Left key code
                        keyRight: [39] // Right key code
                    },
                    lang: {// Language variables for button
                        next: 'Next',
                        previous: 'Previous'
                    },
                    disabledSteps: [], // Array Steps disabled
                    errorSteps: [], // Highlight step with errors
                    hiddenSteps: [] // Hidden steps
                });
                var _0xcc2c = ["\x63\x68\x61\x6E\x67\x65", "\x63\x68\x65\x63\x6B\x65\x64", "\x70\x72\x6F\x70", "\x31", "\x76\x61\x6C", "\x23\x49\x73\x46\x6F\x72\x65\x69\x67\x6E\x65\x72\x56\x61\x6C", "\x30", "\x6F\x6E", "\x23\x49\x73\x46\x6F\x72\x65\x69\x67\x6E\x65\x72\x43\x42", "\x23\x49\x73\x50\x6F\x6C\x69\x74\x69\x63\x69\x61\x6E\x56\x61\x6C", "\x23\x49\x73\x50\x6F\x6C\x69\x74\x69\x63\x69\x61\x6E\x43\x42", "\x72\x65\x6D\x6F\x76\x65", "\x2E\x45\x4B\x59\x43\x46\x6F\x72\x6D\x20\x3E\x20\x70"];
                $(_0xcc2c[8])[_0xcc2c[7]](_0xcc2c[0], function () {
                    if ($(this)[_0xcc2c[2]](_0xcc2c[1]) == true) {
                        $(_0xcc2c[5])[_0xcc2c[4]](_0xcc2c[3])
                    } else {
                        if ($(this)[_0xcc2c[2]](_0xcc2c[1]) == false) {
                            $(_0xcc2c[5])[_0xcc2c[4]](_0xcc2c[6])
                        }
                    }
                });
                $(_0xcc2c[10])[_0xcc2c[7]](_0xcc2c[0], function () {
                    if ($(this)[_0xcc2c[2]](_0xcc2c[1]) == true) {
                        $(_0xcc2c[9])[_0xcc2c[4]](_0xcc2c[3])
                    } else {
                        if ($(this)[_0xcc2c[2]](_0xcc2c[1]) == false) {
                            $(_0xcc2c[9])[_0xcc2c[4]](_0xcc2c[6])
                        }
                    }
                });
                $(_0xcc2c[12])[_0xcc2c[11]]()
            });
        </script>
        <!--
        <script>
            let imgInput = document.getElementById('ID');
            imgInput.addEventListener('change', function (e) {
                if (e.target.files) {
                    let imageFile = e.target.files[0]; //here we get the image file
                    var reader = new FileReader();
                    reader.readAsDataURL(imageFile);
                    reader.onloadend = function (e) {
                        var myImage = new Image(); // Creates image object
                        myImage.src = e.target.result; // Assigns converted image to image object
                        myImage.onload = function (ev) {
                            var myCanvas = document.getElementById("IDCanvas"); // Creates a canvas object
                            var myContext = myCanvas.getContext("2d"); // Creates a contect object
                            myCanvas.width = 100; // Assigns image's width to canvas
                            myCanvas.height = 100; // Assigns image's height to canvas
                            myContext.drawImage(myImage, 0, 0, 100, 100); // Draws the image on canvas
                            let imgData = myCanvas.toDataURL("image/jpeg", 0.10); // Assigns image base64 string in jpeg format to a variable
                        }
                    }
                }
            });
        </script>
        <script>
            let imgInput2 = document.getElementById('Signature');
            imgInput2.addEventListener('change', function (e) {
                if (e.target.files) {
                    let imageFile2 = e.target.files[0]; //here we get the image file
                    var reader2 = new FileReader();
                    reader2.readAsDataURL(imageFile2);
                    reader2.onloadend = function (e) {
                        var myImage2 = new Image(); // Creates image object
                        myImage2.src = e.target.result; // Assigns converted image to image object
                        myImage2.onload = function (ev) {
                            var myCanvas2 = document.getElementById("SignatureCanvas"); // Creates a canvas object
                            var myContext2 = myCanvas2.getContext("2d"); // Creates a contect object
                            myCanvas2.width = 100; // Assigns image's width to canvas
                            myCanvas2.height = 100; // Assigns image's height to canvas
                            myContext2.drawImage(myImage2, 0, 0, 100, 100); // Draws the image on canvas
                            let imgData2 = myCanvas2.toDataURL("image/jpeg", 0.10); // Assigns image base64 string in jpeg format to a variable
                        }
                    }
                }
            });
        </script>
        <script>
            let imgInput3 = document.getElementById('Selfie');
            imgInput3.addEventListener('change', function (e) {
                if (e.target.files) {
                    let imageFile3 = e.target.files[0]; //here we get the image file
                    var reader3 = new FileReader();
                    reader3.readAsDataURL(imageFile3);
                    reader3.onloadend = function (e) {
                        var myImage3 = new Image(); // Creates image object
                        myImage3.src = e.target.result; // Assigns converted image to image object
                        myImage3.onload = function (ev) {
                            var myCanvas3 = document.getElementById("SelfieCanvas"); // Creates a canvas object
                            var myContext3 = myCanvas3.getContext("2d"); // Creates a contect object
                            myCanvas3.width = 100; // Assigns image's width to canvas
                            myCanvas3.height = 100; // Assigns image's height to canvas
                            myContext3.drawImage(myImage3, 0, 0, 100, 100); // Draws the image on canvas
                            let imgData3 = myCanvas3.toDataURL("image/jpeg", 0.10); // Assigns image base64 string in jpeg format to a variable
                        }
                    }
                }
            });
        </script>
        -->
    </body>
</html>
