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
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="Bootstrap/css/styles.css" rel="stylesheet" />
        <!-- SmartWizard -->
        <!--link href="https://cdn.jsdelivr.net/npm/smartwizard@5/dist/css/smart_wizard_all.min.css" rel="stylesheet" type="text/css" /-->
        <link href="Bootstrap/css/smart_wizard_all.min.css" rel="stylesheet" type="text/css"/>
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
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <h4 class="section-heading text-uppercase">${ProductType} E-KYC Form</h4>

                                </div>
                                <br>
                                <div class="alert alert-warning" role="alert" id="alertSessionTimeout" style="display: none">
                                    Hi, your session is going to time out. Click <a href="#" onclick="ResetSession()" class="alert-link">here</a> to extend.
                                </div>
                                <div class="alert alert-danger" role="alert" id="alertErrorMessage" style="display: none">

                                </div>
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

                                    <div class="tab-content">
                                        <div id="step-1" class="tab-pane" role="tabpanel" aria-labelledby="step-1"></div>
                                        <div id="step-2" class="tab-pane" role="tabpanel" aria-labelledby="step-2"></div>
                                        <div id="step-3" class="tab-pane" role="tabpanel" aria-labelledby="step-3"> </div>
                                        <div id="step-4" class="tab-pane" role="tabpanel" aria-labelledby="step-4">
                                            <div class=" card col-sm-12" >
                                                <div class="card-header">
                                                    <h5 >Confirmation</h5>
                                                </div>
                                                <div class="card-body">
                                                    <form class='EKYCForm'>
                                                        <input type="text" name="step" hidden value="3"/>
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
                                                                <tr><td>Job Title : </td><td class="text-muted">${JobTitleName}</td></tr>
                                                                <tr><td>Nationality : </td><td class="text-muted">${NationalityName}</td></tr>
                                                                <tr><td>Foreigner (YES/NO) : </td><td class="text-muted">
                                                                        <c:choose>
                                                                            <c:when test="${IsForeigner == 0}">NO</c:when>
                                                                            <c:when test="${IsForeigner == 1}">YES</c:when>
                                                                        </c:choose>
                                                                    </td></tr>
                                                                <tr><td>Politician (YES/NO) : </td><td class="text-muted">
                                                                        <c:choose>
                                                                            <c:when test="${IsPolitician == 0}">NO</c:when>
                                                                            <c:when test="${IsPolitician == 1}">YES</c:when>
                                                                        </c:choose>
                                                                    </td></tr>


                                                            </tbody>
                                                        </table> 

                                                        <div class="form-group">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" value="" onclick='enableConfirmButton()' id="invalidCheck" required disabled>
                                                                <label>
                                                                    I Agree to the <a target="_blank" onclick="enable()" href="https://www.allbank.ph/mobile-banking-service-terms-and-conditions/">Terms and Conditions </a> and <a target="_blank" onclick="enable()" href="https://www.allbank.ph/data-privacy-policy/"> Data Privacy Policy</a>
                                                                </label>
                                                                <div class="invalid-feedback">
                                                                    You must agree before submitting.
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <br>
                                                        <button type="submit" disabled id='ConfirmButton' class="btn btn-success">Next</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="step-5" class="tab-pane" role="tabpanel" aria-labelledby="step-5">
                                            <div class=" card col-sm-12" >
                                                <div class="card-body">
                                                    <div>
                                                        <center>
                                                            <img src="Bootstrap/assets/img/logos/check_done.gif" class="w-25">
                                                            <p>Congratulations! <br>
                                                                You have successfully created your application for a new account in AllBank!</p>
                                                            <br>
                                                            <p id="SuccessText"></p>
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
                                        </div>
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

        <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" id="aLoadingModal" aria-labelledby="mySmallModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-md">
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
            <div class="modal-dialog">
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
        <!--jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="Bootstrap/js/scripts.js"></script>
        <!-- Smart Wizard-->
        <script src="https://cdn.jsdelivr.net/npm/smartwizard@5/dist/js/jquery.smartWizard.min.js" type="text/javascript"></script>

        <script>
                                                  var _0x5e8e=["\x64\x69\x73\x61\x62\x6C\x65\x64","\x61\x74\x74\x72","\x23\x43\x6F\x6E\x66\x69\x72\x6D\x42\x75\x74\x74\x6F\x6E","\x73\x63\x72\x6F\x6C\x6C\x54\x6F\x70","\x62\x6F\x64\x79","\x64\x6F\x63\x75\x6D\x65\x6E\x74\x45\x6C\x65\x6D\x65\x6E\x74","\x74\x6F\x67\x67\x6C\x65","\x6D\x6F\x64\x61\x6C","\x23\x4C\x6F\x61\x64\x69\x6E\x67\x4D\x6F\x64\x61\x6C","","\x73\x65\x72\x69\x61\x6C\x69\x7A\x65\x41\x72\x72\x61\x79","\x45\x4B\x59\x43\x46\x6F\x72\x6D\x43\x6F\x6E\x74\x72\x6F\x6C\x6C\x65\x72","\x50\x6F\x73\x74","\x3B\x3B","\x73\x70\x6C\x69\x74","\x41\x6C\x65\x72\x74","\x73\x68\x6F\x77","\x74\x65\x78\x74","\x23\x61\x6C\x65\x72\x74\x45\x72\x72\x6F\x72\x4D\x65\x73\x73\x61\x67\x65","\x50\x6C\x65\x61\x73\x65\x20\x63\x6F\x6D\x70\x6C\x65\x74\x65\x20\x61\x6C\x6C\x20\x72\x65\x71\x75\x69\x72\x65\x64\x20\x66\x69\x65\x6C\x64\x73\x2E","\x76\x61\x6C","\x72\x65\x71\x75\x69\x72\x65\x64","\x62\x6F\x72\x64\x65\x72\x2D\x63\x6F\x6C\x6F\x72","\x63\x73\x73","\x6C\x6F\x67","\x23\x46\x46\x30\x30\x30\x30","\x72\x67\x62\x28\x32\x30\x36\x2C\x20\x32\x31\x32\x2C\x20\x32\x31\x38\x29","\x65\x61\x63\x68","\x69\x6E\x70\x75\x74\x2C\x73\x65\x6C\x65\x63\x74","\x23\x45\x4B\x59\x43\x46\x6F\x72\x6D\x31","\x53\x75\x63\x63\x65\x73\x73","\x68\x74\x6D\x6C","\x23\x53\x75\x63\x63\x65\x73\x73\x54\x65\x78\x74","\x68\x69\x64\x65","\x6E\x65\x78\x74","\x73\x6D\x61\x72\x74\x57\x69\x7A\x61\x72\x64","\x23\x73\x6D\x61\x72\x74\x77\x69\x7A\x61\x72\x64","\x23\x70\x6F\x72\x74\x66\x6F\x6C\x69\x6F\x4D\x6F\x64\x61\x6C","\x45\x72\x72\x6F\x72\x21\x20\x46\x6F\x72\x6D\x20\x53\x75\x62\x6D\x69\x74\x20","\x61\x6A\x61\x78","\x70\x72\x65\x76\x65\x6E\x74\x44\x65\x66\x61\x75\x6C\x74","\x73\x75\x62\x6D\x69\x74","\x2E\x45\x4B\x59\x43\x46\x6F\x72\x6D","\x23\x69\x6E\x76\x61\x6C\x69\x64\x43\x68\x65\x63\x6B"];function enableConfirmButton(){$(_0x5e8e[2])[_0x5e8e[1]](_0x5e8e[0],false)}function topFunction(){document[_0x5e8e[4]][_0x5e8e[3]]= 0;document[_0x5e8e[5]][_0x5e8e[3]]= 0}$(_0x5e8e[42])[_0x5e8e[41]](function(_0x8408x3){$(_0x5e8e[8])[_0x5e8e[7]](_0x5e8e[6]);var _0x8408x4=_0x5e8e[9],_0x8408x5=_0x5e8e[9],_0x8408x6=_0x5e8e[9],_0x8408x7=_0x5e8e[9],_0x8408x8=_0x5e8e[9],_0x8408x9=_0x5e8e[9];var _0x8408xa=$(this);var _0x8408xb=$(_0x8408xa)[_0x5e8e[10]]();$[_0x5e8e[39]]({url:_0x5e8e[11],type:_0x5e8e[12],data:_0x8408xb,success:function(_0x8408xc){topFunction();_0x8408x4= _0x8408xc[_0x5e8e[14]](_0x5e8e[13]);_0x8408x5= _0x8408x4[0];_0x8408x6= _0x8408x4[1];_0x8408x7= _0x8408x4[2];_0x8408x9= _0x8408x4[3];if(_0x8408x5=== _0x5e8e[15]){$(_0x5e8e[18])[_0x5e8e[17]](_0x8408x7)[_0x5e8e[16]]();if(_0x8408x7== _0x5e8e[19]){$(_0x5e8e[28],$(_0x5e8e[29]))[_0x5e8e[27]](function(){if($(this)[_0x5e8e[20]]()=== _0x5e8e[9]){if($(this)[_0x5e8e[1]](_0x5e8e[21])=== _0x5e8e[21]){console[_0x5e8e[24]]($(this)[_0x5e8e[23]](_0x5e8e[22]));$(this)[_0x5e8e[23]](_0x5e8e[22],_0x5e8e[25])}}else {$(this)[_0x5e8e[23]](_0x5e8e[22],_0x5e8e[26])}})}}else {if(_0x8408x5=== _0x5e8e[30]){$(_0x5e8e[32])[_0x5e8e[31]](_0x8408x7);$(_0x5e8e[18])[_0x5e8e[17]](_0x5e8e[9])[_0x5e8e[33]]();$(this)[_0x5e8e[31]](_0x5e8e[9]);$(_0x5e8e[36])[_0x5e8e[35]](_0x5e8e[34])}};setTimeout(function(){$(_0x5e8e[8])[_0x5e8e[7]](_0x5e8e[6])},1000);if(_0x8408x9== 2){$(_0x5e8e[37])[_0x5e8e[7]](_0x5e8e[6])}},error:function(_0x8408xd,_0x8408xe,_0x8408xf){console[_0x5e8e[24]](_0x5e8e[38]+ _0x8408xf)}});_0x8408x3[_0x5e8e[40]]()});function enable(){$(_0x5e8e[43])[_0x5e8e[1]](_0x5e8e[0],false)}                      

                                                                        $(document).ready(function () {
                                                                            var _0x7964 = ["\x73\x6C\x69\x64\x2E\x62\x73\x2E\x63\x61\x72\x6F\x75\x73\x65\x6C", "\x69\x6E\x64\x65\x78", "\x64\x69\x76\x2E\x61\x63\x74\x69\x76\x65", "\x63\x75\x72\x72\x65\x6E\x74\x49\x6E\x64\x65\x78\x20\x3A\x20", "\x6C\x6F\x67", "\x63\x6C\x69\x63\x6B", "\x23\x74\x6F\x67\x67\x6C\x65\x6D\x6F\x64\x61\x6C", "\x6F\x6E", "\x23\x63\x61\x72\x6F\x75\x73\x65\x6C\x45\x78\x61\x6D\x70\x6C\x65\x43\x6F\x6E\x74\x72\x6F\x6C\x73"];
                                                                            $(_0x7964[8])[_0x7964[7]](_0x7964[0], function () {
                                                                                currentIndex = $(_0x7964[2])[_0x7964[1]]();
                                                                                console[_0x7964[4]](_0x7964[3] + currentIndex);
                                                                                if (currentIndex == 0) {
                                                                                    $(_0x7964[6])[_0x7964[5]]()
                                                                                }
                                                                            })

                                                                            $('#smartwizard').smartWizard({
                                                                                selected: 3, // Initial selected step, 0 = first step
                                                                                theme: 'dots', // theme for the wizard, related css need to include for other than default theme
                                                                                justified: true, // Nav menu justification. true/false
                                                                                darkMode: false, // Enable/disable Dark Mode if the theme supports. true/false
                                                                                autoAdjustHeight: true, // Automatically adjust content height
                                                                                cycleSteps: false, // Allows to cycle the navigation of steps
                                                                                backButtonSupport: false, // Enable the back button support
                                                                                enableURLhash: true, // Enable selection of the step based on url hash
                                                                                transition: {
                                                                                    animation: 'none', // Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
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
                                                                        });
        </script>
    </body>
</html>
