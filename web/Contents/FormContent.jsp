
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:choose>
        <c:when test="${step == 0 && param.stepIndex == 0 }">
            <script type="text/javascript">
                var widgetId2;
                var onloadCallback = function () {
                    widgetId2 = grecaptcha.render('html_element', {
                        'sitekey': '6LdZUFEcAAAAADgbWcg2b37NVt5VbAajkoKncR0P'
                    });
                };
            </script>  
            <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer>
            </script>
            <div class=" card col-sm-12" >
                <div class="card-body">
                    <form class='EKYCForm'>
                        <div class="form-group">
                            <label style="font-family: 'Raleway'" for="inputUsername">Username</label>
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
                                    <option >Ms.</option>
                                    <option >Mrs.</option>
                                    <option >Mr.</option>
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
                                <input style="font-family: 'Raleway'" type="date" class="form-control" name="inputBirthDate" id="inputBirthDate" required max="2000-12-31">
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
        </c:when>
        <c:when test="${step == 1 && param.stepIndex == 1}">
            <c:choose>
                <c:when test="${AccountType == 'CashCard'}">
                    <div class=" card col-sm-12" >
                        <div class="card-body">
                            <form class='EKYCForm'>
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
                                        <label style="font-family: 'Raleway'" for="inputUsername">Village <text class="text-danger">*</text></label>
                                        <input style="font-family: 'Raleway'" type="text" required class="form-control" id="inputVillage" name="inputVillage" placeholder=""  maxlength="50">
                                    </div>
                                </div>

                                <div class="form-row row">
                                    <div class="form-group col-sm-5">
                                        <label style="font-family: 'Raleway'" for="inputEmail4">Stayed Since</label>
                                        <input style="font-family: 'Raleway'" type="date" class="form-control" id="inputStayedSince" name="inputStayedSince" placeholder="">
                                    </div>
                                    <div class="form-group col-sm-7">
                                        <label style="font-family: 'Raleway'" for="inputPassword4">Ownership</label>
                                        <select style="font-family: 'Raleway'"  class="form-control" id="ownership" name="inputOwnership">
                                            <option value="">Select Ownership</option>
                                        </select>
                                    </div>
                                </div>
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
                            <form class='EKYCForm'>
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

        </c:when>
        <c:when test="${step == 2 &&  param.stepIndex == 2 }">
            <div class=" card col-sm-12" >
                <div class="card-body">
                    <form enctype="multipart/form-data" method="post" id="EKYCFormFiles" action="Confirmation">  
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
                                <div class="form-row row">
                                    <div class="form-group col-sm-4">
                                        <label for="inputUsername">Type of ID</label>
                                        <select class="form-control ids1" name="inputIDClass2" id="inputIDClassQ"  data-sb-validations="required">
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
                                        <input type="text" class="form-control ids2" id="inputIDRefQ" required name="inputIDRef2" placeholder=""  maxlength="20">
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label for="inputPassword4">File <i class="fa fa-info-circle"   data-bs-toggle="modal" data-bs-target="#IDTipsModal"></i></label>
                                        <input type="file" class="form-control" accept="image/*" name="ID2" required id="ID2">
                                        <span id="IDspan2"></span>   </div>
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

                        <button type="button" class="btn btn-primary" onclick="ValidateFile()" >Next</button>
                    </form>

                </div>
            </div>
        </c:when>

        <c:when test="${step == 3 && param.stepIndex == 3 }">
            <div class=" card col-sm-12" >
                <div class="card-header">
                    <h5 >Confirmation</h5>
                </div>
                <div class="card-body">
                    <form class='EKYCForm'>
                        <table class="table table-sm">
                            <thead>
                                <tr><th width="35%"></th><th width="70%"></th></tr>
                            </thead>
                            <tbody>
                                <tr><td>UserName : </td><td class="text-muted">${username}</td></tr>
                                <tr><td>Name : </td><td class="text-muted">${FirstName} ${MiddleName} ${LastName}</td></tr>
                                <tr><td>Birth Date : </td><td class="text-muted">${BDate}</td></tr>
                                <tr><td>Place of Birth : </td><td class="text-muted">${POB}</td></tr>
                                <tr><td>Mobile Number : </td><td class="text-muted">${MobileNumber}</td></tr>
                                <tr><td>Email Address : </td><td class="text-muted">${Email}</td></tr>
                                <tr><td>Gender : </td><td class="text-muted">
                                        <c:choose>
                                            <c:when test="${Gender == 1}">Male</c:when>
                                            <c:when test="${Gender == 2}">Female</c:when>
                                        </c:choose>
                                    </td></tr>
                                <tr><td>Civil Status : </td><td class="text-muted">
                                        <c:choose>
                                            <c:when test="${CivilStatus == 0}">Single</c:when>
                                            <c:when test="${CivilStatus == 1}">Married</c:when>
                                            <c:when test="${CivilStatus == 2}">Widow</c:when>
                                            <c:when test="${CivilStatus == 3}">Separated</c:when>
                                            <c:when test="${CivilStatus == 4}">Anulled</c:when>
                                            <c:when test="${CivilStatus == 5}">Single Parent</c:when>
                                            <c:when test="${CivilStatus == 6}">Single with Common Law</c:when>
                                        </c:choose>
                                    </td></tr>
                                <tr><td>Mother’s Maiden Name : </td><td class="text-muted">${MotherMaidenName}</td></tr>
                                <tr><td>Address : </td><td  class="text-muted">${HouseNo} ${Village} ${BrgyName} ${CityName}</td></tr>
                                <tr><td>Stayed since : </td><td  class="text-muted">${StayedSince}</td></tr>
                                <tr><td>Ownership : </td><td class="text-muted">${OwnershipName}</td></tr>
                                <tr><td>Source of Fund : </td><td class="text-muted">${SourceOfFundName}</td></tr>
                                <tr><td>Job Title : </td><td>${JobTitleName}</td></tr>
                                <tr><td>Nationality : </td><td>${NationalityName}</td></tr>
                                <tr><td>Foreigner (YES/NO) : </td><td>
                                        <c:choose>
                                            <c:when test="${IsForeigner == 0}">NO</c:when>
                                            <c:when test="${IsForeigner == 1}">YES</c:when>
                                        </c:choose>
                                    </td></tr>
                                <tr><td>Politician (YES/NO) : </td><td>
                                        <c:choose>
                                            <c:when test="${IsPolitician == 0}">NO</c:when>
                                            <c:when test="${IsPolitician == 1}">YES</c:when>
                                        </c:choose>
                                    </td></tr>


                            </tbody>
                        </table> 

                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required disabled>
                                <label class="form-check-label" for="invalidCheck" >
                                    Agree to <a target="_blank" onclick="enable()" href="https://www.allbank.ph/mobile-banking-service-terms-and-conditions/">Terms and Conditions</a>
                                </label>
                                <div class="invalid-feedback">
                                    You must agree before submitting.
                                </div>
                            </div>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-success">Next</button>
                    </form>
                </div>
            </div>
        </c:when>
        <c:when test="${step == 4 &&  param.stepIndex == 4 }">
            <div class=" card col-sm-12" >
                <div class="card-body">
                    <div>
                        <center>
                            <img src="Bootstrap/assets/img/logos/check_done.gif" class="w-25">
                            <p>Congratulations AllBanker! <br>
                                You have successfully created your application for new account in AllBank!</p>
                            <br>
                            <p>Download the mobile banking now to check your account! Click <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseExample">here</button> to download</p>

                        </center>
                        <br>
                        <div class="collapse" id="collapseExample">
                            <div class="card card-body">
                                <div class="card-group">
                                    <div class="card">
                                        <center><img src="Bootstrap/assets/img/logos/AndroidLink2.png" class="card-img-top w-50" alt="..."></center>
                                        <div class="card-body">
                                            <h5 class="card-title">Android</h5>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <center><img src="Bootstrap/assets/img/logos/IOSLink2.png" class="card-img-top w-50" alt="..."></center>
                                        <div class="card-body">
                                            <h5 class="card-title">IOS</h5>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </c:when> 
        <c:otherwise>
            <p>You are not allowed to access this page</p>
        </c:otherwise>

    </c:choose>


    <script>
        function asd() {
            alert();
        };
    </script>
    <script>
        function enable() {
            var _0x9e3e = ["\x64\x69\x73\x61\x62\x6C\x65\x64", "\x61\x74\x74\x72", "\x23\x69\x6E\x76\x61\x6C\x69\x64\x43\x68\x65\x63\x6B"];
            $(_0x9e3e[2])[_0x9e3e[1]](_0x9e3e[0], false)
        }
        $(document).ready(function () {

            var _0xa59a = ["\x63\x68\x61\x6E\x67\x65", "\x63\x68\x65\x63\x6B\x65\x64", "\x70\x72\x6F\x70", "\x31", "\x76\x61\x6C", "\x23\x49\x73\x46\x6F\x72\x65\x69\x67\x6E\x65\x72\x56\x61\x6C", "\x30", "\x6F\x6E", "\x23\x49\x73\x46\x6F\x72\x65\x69\x67\x6E\x65\x72\x43\x42", "\x23\x49\x73\x50\x6F\x6C\x69\x74\x69\x63\x69\x61\x6E\x56\x61\x6C", "\x23\x49\x73\x50\x6F\x6C\x69\x74\x69\x63\x69\x61\x6E\x43\x42", "\x72\x65\x6D\x6F\x76\x65", "\x2E\x45\x4B\x59\x43\x46\x6F\x72\x6D\x20\x3E\x20\x70"];
            $(_0xa59a[8])[_0xa59a[7]](_0xa59a[0], function () {
                if ($(this)[_0xa59a[2]](_0xa59a[1]) == true) {
                    $(_0xa59a[5])[_0xa59a[4]](_0xa59a[3])
                } else {
                    if ($(this)[_0xa59a[2]](_0xa59a[1]) == false) {
                        $(_0xa59a[5])[_0xa59a[4]](_0xa59a[6])
                    }
                }
            });
            $(_0xa59a[10])[_0xa59a[7]](_0xa59a[0], function () {
                if ($(this)[_0xa59a[2]](_0xa59a[1]) == true) {
                    $(_0xa59a[9])[_0xa59a[4]](_0xa59a[3])
                } else {
                    if ($(this)[_0xa59a[2]](_0xa59a[1]) == false) {
                        $(_0xa59a[9])[_0xa59a[4]](_0xa59a[6])
                    }
                }
            });
            $(_0xa59a[12])[_0xa59a[11]]()
            setTimeout(function () {
                if (${param.stepIndex} === 0 ||${param.stepIndex} === 4) {
                    var _0x8893 = ["\x6D\x69\x6E\x2D\x68\x65\x69\x67\x68\x74", "\x68\x65\x69\x67\x68\x74", "\x23\x63\x61\x72\x64\x62\x6F\x64\x79", "\x63\x73\x73"];
                    $(_0x8893[2])[_0x8893[3]](_0x8893[0], $(_0x8893[2])[_0x8893[1]]() + 100)
                }
            }, 1000)
        });
        var _0x7db7 = ["\x63\x68\x61\x6E\x67\x65", "\x76\x61\x6C", "\x23\x69\x6E\x70\x75\x74\x49\x44\x43\x6C\x61\x73\x73", "\x6F\x6E", "\x2E\x69\x64\x73\x31", "\x63\x68\x61\x6E\x67\x65\x20\x2C\x6B\x65\x79\x75\x70", "\x23\x69\x6E\x70\x75\x74\x49\x44\x52\x65\x66", "\x2E\x69\x64\x73\x32"];
        $(_0x7db7[4])[_0x7db7[3]](_0x7db7[0], function () {
            $(_0x7db7[2])[_0x7db7[1]]($(this)[_0x7db7[1]]())
        });
        $(_0x7db7[7])[_0x7db7[3]](_0x7db7[5], function () {
            $(_0x7db7[6])[_0x7db7[1]]($(this)[_0x7db7[1]]())
        })
        setTimeout(function () {
            $.ajax({
                url: 'SessionChecker',
                type: 'GET',
                data: {dummy: null},
                success: function (data) {
                    //       $('#alertSessionTimeout').show();
                    //      $('#sessionmin').text(data);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    console.log("Error! Change Password (New Password)" + thrownError);
                }
            });
        }, 10000);//1680000);

        function ValidateCaptcha() {
            var _0x5a75 = ["\x76\x61\x6C", "\x23\x67\x2D\x72\x65\x63\x61\x70\x74\x63\x68\x61\x2D\x72\x65\x73\x70\x6F\x6E\x73\x65", "\x73\x6C\x69\x63\x65", "\x23\x63\x61\x70\x74\x63\x68\x61\x31", "\x23\x63\x61\x70\x74\x63\x68\x61\x32", "\x23\x63\x61\x70\x74\x63\x68\x61\x33", "", "\x73\x75\x62\x6D\x69\x74", "\x2E\x45\x4B\x59\x43\x46\x6F\x72\x6D", "\x73\x68\x6F\x77", "\x50\x6C\x65\x61\x73\x65\x20\x76\x65\x72\x69\x66\x79\x20\x74\x68\x61\x74\x20\x79\x6F\x75\x20\x61\x72\x65\x20\x6E\x6F\x74\x20\x61\x20\x72\x6F\x62\x6F\x74\x2E", "\x74\x65\x78\x74", "\x23\x61\x6C\x65\x72\x74\x45\x72\x72\x6F\x72\x4D\x65\x73\x73\x61\x67\x65"];
            var captcha = $(_0x5a75[1])[_0x5a75[0]]();
            $(_0x5a75[3])[_0x5a75[0]](captcha[_0x5a75[2]](0, 100));
            $(_0x5a75[4])[_0x5a75[0]](captcha[_0x5a75[2]](100, 200));
            $(_0x5a75[5])[_0x5a75[0]](captcha[_0x5a75[2]](200));
            if (captcha !== _0x5a75[6]) {
                $(_0x5a75[8])[_0x5a75[7]]()
            } else {
                $(_0x5a75[12])[_0x5a75[11]](_0x5a75[10])[_0x5a75[9]]()
            }
        }


        function validate(id) {
            var _0x80a7 = ["", "\x68\x74\x6D\x6C", "\x23", "\x73\x70\x61\x6E", "\x62\x6F\x72\x64\x65\x72\x2D\x63\x6F\x6C\x6F\x72", "\x23\x46\x30\x46\x30\x46\x30", "\x63\x73\x73", "\x73\x69\x7A\x65", "\x66\x69\x6C\x65\x73", "\x46\x69\x6C\x65\x20\x73\x69\x7A\x65\x20\x69\x73\x20\x67\x72\x65\x61\x74\x65\x72\x20\x74\x68\x61\x6E\x20\x31\x4D\x42", "\x23\x46\x46\x30\x30\x30\x30"];
            $(_0x80a7[2] + id + _0x80a7[3])[_0x80a7[1]](_0x80a7[0]);
            $(_0x80a7[2] + id + _0x80a7[0])[_0x80a7[6]](_0x80a7[4], _0x80a7[5]);
            var file_size = $(_0x80a7[2] + id + _0x80a7[0])[0][_0x80a7[8]][0][_0x80a7[7]];
            if (file_size > 1000000) {
                $(_0x80a7[2] + id + _0x80a7[3])[_0x80a7[1]](_0x80a7[9]);
                $(_0x80a7[2] + id + _0x80a7[0])[_0x80a7[6]](_0x80a7[4], _0x80a7[10]);
                return false
            }
            ;
            return true
        }
        var isIDLim = false;
        var IsSigLim = false;
        var IsSelfieLim = false;
        function ValidateFile() {
            var _0x40d0 = ["\x49\x44", "\x53\x69\x67\x6E\x61\x74\x75\x72\x65", "\x53\x65\x6C\x66\x69\x65", "\x73\x75\x62\x6D\x69\x74", "\x23\x45\x4B\x59\x43\x46\x6F\x72\x6D\x46\x69\x6C\x65\x73", "\x74\x6F\x67\x67\x6C\x65", "\x6D\x6F\x64\x61\x6C", "\x23\x4C\x6F\x61\x64\x69\x6E\x67\x4D\x6F\x64\x61\x6C"];
            isIDLim = validate(_0x40d0[0]);
            IsSigLim = validate(_0x40d0[1]);
            IsSelfieLim = validate(_0x40d0[2]);
            if (isIDLim === true && IsSigLim === true && IsSelfieLim === true) {
                $(_0x40d0[4])[_0x40d0[3]]();
                $(_0x40d0[7])[_0x40d0[6]](_0x40d0[5])
            }
        }
        //var _0xc02b=["\x74\x6F\x67\x67\x6C\x65","\x6D\x6F\x64\x61\x6C","\x23\x4C\x6F\x61\x64\x69\x6E\x67\x4D\x6F\x64\x61\x6C","","\x73\x65\x72\x69\x61\x6C\x69\x7A\x65\x41\x72\x72\x61\x79","\x45\x4B\x59\x43\x46\x6F\x72\x6D\x43\x6F\x6E\x74\x72\x6F\x6C\x6C\x65\x72","\x50\x6F\x73\x74","\x3B\x3B","\x73\x70\x6C\x69\x74","\x41\x6C\x65\x72\x74","\x73\x68\x6F\x77","\x74\x65\x78\x74","\x23\x61\x6C\x65\x72\x74\x45\x72\x72\x6F\x72\x4D\x65\x73\x73\x61\x67\x65","\x53\x75\x63\x63\x65\x73\x73","\x68\x69\x64\x65","\x68\x74\x6D\x6C","\x6E\x65\x78\x74","\x73\x6D\x61\x72\x74\x57\x69\x7A\x61\x72\x64","\x23\x73\x6D\x61\x72\x74\x77\x69\x7A\x61\x72\x64","\x24\x7B\x73\x74\x65\x70\x7D","\x30","\x76\x61\x6C","\x23\x63\x61\x70\x74\x63\x68\x61\x31","\x23\x63\x61\x70\x74\x63\x68\x61\x32","\x23\x63\x61\x70\x74\x63\x68\x61\x33","\x72\x65\x73\x65\x74","\x6D\x69\x6E\x2D\x68\x65\x69\x67\x68\x74","\x68\x65\x69\x67\x68\x74","\x23\x63\x61\x72\x64\x62\x6F\x64\x79","\x63\x73\x73","\x45\x72\x72\x6F\x72\x21\x20\x43\x68\x61\x6E\x67\x65\x20\x50\x61\x73\x73\x77\x6F\x72\x64\x20\x28\x4E\x65\x77\x20\x50\x61\x73\x73\x77\x6F\x72\x64\x29","\x6C\x6F\x67","\x61\x6A\x61\x78","\x70\x72\x65\x76\x65\x6E\x74\x44\x65\x66\x61\x75\x6C\x74","\x73\x75\x62\x6D\x69\x74","\x2E\x45\x4B\x59\x43\x46\x6F\x72\x6D","\x45\x4B\x59\x43\x46\x6F\x72\x6D\x46\x69\x6C\x65\x73","\x50\x4F\x53\x54","\x23\x61\x74\x74\x61\x63\x68\x65\x6D\x65\x6E\x74\x46\x69\x6C\x65"];$(_0xc02b[35])[_0xc02b[34]](function(_0xe5bax1){$(_0xc02b[2])[_0xc02b[1]](_0xc02b[0]);var _0xe5bax2=_0xc02b[3],_0xe5bax3=_0xc02b[3],_0xe5bax4=_0xc02b[3],_0xe5bax5=_0xc02b[3],_0xe5bax6=_0xc02b[3];var _0xe5bax7=$(this);var _0xe5bax8=$(_0xe5bax7)[_0xc02b[4]]();$[_0xc02b[32]]({url:_0xc02b[5],type:_0xc02b[6],data:_0xe5bax8,success:function(_0xe5bax9){_0xe5bax2= _0xe5bax9[_0xc02b[8]](_0xc02b[7]);_0xe5bax3= _0xe5bax2[0];_0xe5bax4= _0xe5bax2[1];_0xe5bax5= _0xe5bax2[2];if(_0xe5bax3=== _0xc02b[9]){$(_0xc02b[12])[_0xc02b[11]](_0xe5bax5)[_0xc02b[10]]()}else {if(_0xe5bax3=== _0xc02b[13]){$(_0xc02b[12])[_0xc02b[11]](_0xc02b[3])[_0xc02b[14]]();$(this)[_0xc02b[15]](_0xc02b[3]);$(_0xc02b[18])[_0xc02b[17]](_0xc02b[16])}};setTimeout(function(){$(_0xc02b[2])[_0xc02b[1]](_0xc02b[0])},1000);if(_0xc02b[19]=== _0xc02b[20]){$(_0xc02b[22])[_0xc02b[21]](_0xc02b[3]);$(_0xc02b[23])[_0xc02b[21]](_0xc02b[3]);$(_0xc02b[24])[_0xc02b[21]](_0xc02b[3]);grecaptcha[_0xc02b[25]](widgetId2);$(_0xc02b[28])[_0xc02b[29]](_0xc02b[26],$(_0xc02b[28])[_0xc02b[27]]()+ 100)}},error:function(_0xe5baxa,_0xe5baxb,_0xe5baxc){console[_0xc02b[31]](_0xc02b[30]+ _0xe5baxc)}});_0xe5bax1[_0xc02b[33]]()});$(_0xc02b[38])[_0xc02b[34]](function(_0xe5bax1){$(_0xc02b[2])[_0xc02b[1]](_0xc02b[0]);var _0xe5bax2=_0xc02b[3],_0xe5bax3=_0xc02b[3],_0xe5bax4=_0xc02b[3],_0xe5bax5=_0xc02b[3],_0xe5bax6=_0xc02b[3];var _0xe5bax7=$(this);var _0xe5bax8=$(_0xe5bax7)[_0xc02b[4]]();$[_0xc02b[32]]({url:_0xc02b[36],type:_0xc02b[37],data: new FormData(this),contentType:false,cache:false,processData:false,success:function(_0xe5bax9){_0xe5bax2= _0xe5bax9[_0xc02b[8]](_0xc02b[7]);_0xe5bax3= _0xe5bax2[0];_0xe5bax4= _0xe5bax2[1];_0xe5bax5= _0xe5bax2[2];if(_0xe5bax3=== _0xc02b[9]){$(_0xc02b[12])[_0xc02b[11]](_0xe5bax5)[_0xc02b[10]]()}else {if(_0xe5bax3=== _0xc02b[13]){$(_0xc02b[12])[_0xc02b[11]](_0xc02b[3])[_0xc02b[14]]();$(this)[_0xc02b[15]](_0xc02b[3]);$(_0xc02b[18])[_0xc02b[17]](_0xc02b[16])}};setTimeout(function(){$(_0xc02b[2])[_0xc02b[1]](_0xc02b[0])},1000)},error:function(_0xe5baxa,_0xe5baxb,_0xe5baxc){console[_0xc02b[31]](_0xc02b[30]+ _0xe5baxc)}});_0xe5bax1[_0xc02b[33]]()})
        $('.EKYCForm').submit(function (e) {
            $('#LoadingModal').modal('toggle');

            var returnmess = "", title = "", color = "", mess = "", userid = "";
            var form = $(this);
            var dataArray = $(form).serializeArray();
            $.ajax({
                url: 'EKYCFormController',
                type: 'Post',
                data: dataArray,
                success: function (data) {

                    returnmess = data.split(";;");
                    title = returnmess[0];
                    color = returnmess[1];
                    mess = returnmess[2];
                    //  $.toaster({message: mess, title: title, priority: color});
                    if (title === "Alert") {
                        $('#alertErrorMessage').text(mess).show();
                    } else if (title === "Success") {
                        var _0x5f77 = ["\x68\x69\x64\x65", "", "\x74\x65\x78\x74", "\x23\x61\x6C\x65\x72\x74\x45\x72\x72\x6F\x72\x4D\x65\x73\x73\x61\x67\x65", "\x68\x74\x6D\x6C", "\x6E\x65\x78\x74", "\x73\x6D\x61\x72\x74\x57\x69\x7A\x61\x72\x64", "\x23\x73\x6D\x61\x72\x74\x77\x69\x7A\x61\x72\x64"];
                        $(_0x5f77[3])[_0x5f77[2]](_0x5f77[1])[_0x5f77[0]]();
                        $(this)[_0x5f77[4]](_0x5f77[1]);
                        $(_0x5f77[7])[_0x5f77[6]](_0x5f77[5])
                    }

                    setTimeout(function () {
                        $('#LoadingModal').modal('toggle');
                    }, 1000)
                    if ('${step}' === '0') {
                        var _0x635d = ["", "\x76\x61\x6C", "\x23\x63\x61\x70\x74\x63\x68\x61\x31", "\x23\x63\x61\x70\x74\x63\x68\x61\x32", "\x23\x63\x61\x70\x74\x63\x68\x61\x33"];
                        $(_0x635d[2])[_0x635d[1]](_0x635d[0]);
                        $(_0x635d[3])[_0x635d[1]](_0x635d[0]);
                        $(_0x635d[4])[_0x635d[1]](_0x635d[0]);
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
        function produceOptions(List) {
            var _0xf923 = ["", "\x3C\x6F\x70\x74\x69\x6F\x6E\x20\x76\x61\x6C\x75\x65\x3D\x27", "\x3B\x3B", "\x27\x3E", "\x3C\x2F\x6F\x70\x74\x69\x6F\x6E\x3E", "\x65\x61\x63\x68"];
            var populated_options = _0xf923[0];
            $[_0xf923[5]](List, function (_0x19e4x2, _0x19e4x3) {
                var _0x19e4x4 = _0x19e4x3;
                $[_0xf923[5]](_0x19e4x4, function (_0x19e4x5, _0x19e4x6) {
                    populated_options += _0xf923[1] + _0x19e4x5 + _0xf923[2] + _0x19e4x6 + _0xf923[3] + _0x19e4x6 + _0xf923[4]
                })
            });
            return populated_options
        }

        function produceOptionsAddress(List) {
            var _0xee14 = ["", "\x3C\x6F\x70\x74\x69\x6F\x6E\x20\x76\x61\x6C\x75\x65\x3D\x27", "\x3B\x3B", "\x27\x3E", "\x3C\x2F\x6F\x70\x74\x69\x6F\x6E\x3E", "\x65\x61\x63\x68"];
            var populated_options = _0xee14[0];
            $[_0xee14[5]](List, function (_0x389cx2, _0x389cx3) {
                var _0x389cx4 = _0x389cx3;
                $[_0xee14[5]](_0x389cx4, function (_0x389cx5, _0x389cx6) {
                    populated_options += _0xee14[1] + _0x389cx5 + _0xee14[2] + _0x389cx6 + _0xee14[3] + _0x389cx6 + _0xee14[4]
                })
            });
            return populated_options
        }

        var nationalities =${NationalityList}
        $('#nationality').append(produceOptions(nationalities))

        var SourceofFunds =${SourceofFundList}
        $('#source_of_fund').append(produceOptions(SourceofFunds))

        var JobTitle =${JobTitleList}
        $('#job_title').append(produceOptions(JobTitle))

        var Ownership =${OwnershipList}
        $('#ownership').append(produceOptions(Ownership))

        function SearchCity(id) {
            var _0x6a9b = ["\x76\x61\x6C", "\x23\x69\x6E\x70\x75\x74\x53\x65\x61\x72\x63\x68\x43\x69\x74\x79", "\x53\x65\x61\x72\x63\x68\x43\x69\x74\x79", "\x50\x4F\x53\x54", "\x31", "\x64\x61\x74\x61\x20\x3A\x20", "\x6C\x6F\x67", "\x70\x61\x72\x73\x65\x4A\x53\x4F\x4E", "\x3C\x6F\x70\x74\x69\x6F\x6E\x20\x76\x61\x6C\x75\x65\x3D\x22\x22\x3E\x53\x65\x6C\x65\x63\x74\x20\x43\x69\x74\x79\x2F\x4D\x75\x6E\x69\x63\x69\x70\x61\x6C\x69\x74\x79\x3C\x2F\x6F\x70\x74\x69\x6F\x6E\x3E", "\x68\x74\x6D\x6C", "\x23\x69\x6E\x70\x75\x74\x43\x69\x74\x79", "\x45\x72\x72\x6F\x72\x21\x20\x43\x68\x61\x6E\x67\x65\x20\x50\x61\x73\x73\x77\x6F\x72\x64\x20\x28\x4E\x65\x77\x20\x50\x61\x73\x73\x77\x6F\x72\x64\x29", "\x61\x6A\x61\x78"];
            var City = $(_0x6a9b[1])[_0x6a9b[0]]();
            $[_0x6a9b[12]]({url: _0x6a9b[2], type: _0x6a9b[3], data: {City: City, arg: _0x6a9b[4]}, success: function (_0xfa6cx2) {
                    console[_0x6a9b[6]](_0x6a9b[5] + _0xfa6cx2);
                    var _0xfa6cx3 = [];
                    _0xfa6cx3 = jQuery[_0x6a9b[7]](_0xfa6cx2);
                    $(_0x6a9b[10])[_0x6a9b[9]](_0x6a9b[8] + produceOptionsAddress(_0xfa6cx3))
                }, error: function (_0xfa6cx4, _0xfa6cx5, _0xfa6cx6) {
                    console[_0x6a9b[6]](_0x6a9b[11] + _0xfa6cx6)
                }})
        }
        var _0x6c90 = ["\x63\x68\x61\x6E\x67\x65", "\x76\x61\x6C", "\x53\x65\x61\x72\x63\x68\x43\x69\x74\x79", "\x50\x4F\x53\x54", "\x70\x61\x72\x73\x65\x4A\x53\x4F\x4E", "\x3C\x6F\x70\x74\x69\x6F\x6E\x20\x76\x61\x6C\x75\x65\x3D\x22\x22\x3E\x53\x65\x6C\x65\x63\x74\x20\x42\x72\x67\x79\x3C\x2F\x6F\x70\x74\x69\x6F\x6E\x3E", "\x68\x74\x6D\x6C", "\x23\x69\x6E\x70\x75\x74\x42\x72\x67\x79", "\x45\x72\x72\x6F\x72\x21\x20\x43\x68\x61\x6E\x67\x65\x20\x50\x61\x73\x73\x77\x6F\x72\x64\x20\x28\x4E\x65\x77\x20\x50\x61\x73\x73\x77\x6F\x72\x64\x29", "\x6C\x6F\x67", "\x61\x6A\x61\x78", "\x6F\x6E", "\x23\x69\x6E\x70\x75\x74\x43\x69\x74\x79"];
        $(_0x6c90[12])[_0x6c90[11]](_0x6c90[0], function () {
            var _0x7a97x1 = $(this)[_0x6c90[1]]();
            $[_0x6c90[10]]({url: _0x6c90[2], type: _0x6c90[3], data: {City: $(this)[_0x6c90[1]](), arg: 2}, success: function (_0x7a97x2) {
                    var _0x7a97x3 = [];
                    _0x7a97x3 = jQuery[_0x6c90[4]](_0x7a97x2);
                    $(_0x6c90[7])[_0x6c90[6]](_0x6c90[5] + produceOptionsAddress(_0x7a97x3))
                }, error: function (_0x7a97x4, _0x7a97x5, _0x7a97x6) {
                    console[_0x6c90[9]](_0x6c90[8] + _0x7a97x6)
                }})
        })

    </script>

</html>
