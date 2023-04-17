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
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet'>
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
                    <a class="navbar-brand" href="#page-top"><img style="" class="w-25" src="dist/ALBlogo.png" alt="..." /></a>
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
                                        <div id="step-1" class="tab-pane" role="tabpanel" aria-labelledby="step-1"></div>
                                        <div id="step-2" class="tab-pane" role="tabpanel" aria-labelledby="step-2"></div>
                                        <div id="step-3" class="tab-pane" role="tabpanel" aria-labelledby="step-3">
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
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">

                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="col-sm-12">
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <center>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <div class="card">
                                                <div class="card-body">
                                                    <img src="Bootstrap/assets/img/tips/IDLoop.gif" class="d-block w-50" alt="...">
                                                    <center>
                                                        <h4>Take a Photo of your ID</h4>
                                                    </center>
                                                    <ul class="list-group list-group-flush text-small   ">
                                                        <li class="list-group-item">Place your ID on a dark surface.</li>
                                                        <li class="list-group-item">Make sure your camera flash is off to avoid glares and shadows.</li>
                                                        <li class="list-group-item">ID Surface should not have glares.</li>
                                                        <li class="list-group-item">Make sure that the details you provided in the application matches the details written in your ID.</li>
                                                        <li class="list-group-item">Make to submit a clear photo of your ID. Retake the shot if the photo is blurred.</li>
                                                    </ul>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <div class="card">
                                                <div class="card-body">
                                                    <img src="Bootstrap/assets/img/tips/SignatureLoop.gif" class="d-block w-50" alt="...">
                                                    <center>
                                                        <h4>Photo of your Signature</h4>
                                                    </center>
                                                    <ul class="list-group list-group-flush text-small   ">
                                                        <li class="list-group-item">Using a dark ink, sign on a white sheet of paper.</li>
                                                        <li class="list-group-item">Place the paper on a dark surface.</li>
                                                        <li class="list-group-item">Make sure your camera flash is off to avoid glares and shadows.</li>
                                                        <li class="list-group-item">Make to submit a clear photo of your signature. Retake the shot if the photo is blurred.</li>
                                                    </ul>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <div class="card">
                                                <div class="card-body">
                                                    <img src="Bootstrap/assets/img/tips/SelfieLoop.gif" class="d-block w-50" alt="...">
                                                    <center>
                                                        <h4>Taking a Selfie</h4>
                                                    </center>
                                                    <ul class="list-group list-group-flush text-small   ">
                                                        <li class="list-group-item">Make sure to wear a shirt when taking a selfie.</li>
                                                        <li class="list-group-item">Avoid glares and shadows on the photo. Look for a well-lighted area.</li>
                                                        <li class="list-group-item">Keep your phone at eye level.</li>
                                                        <li class="list-group-item">Make sure that there are no other faces in the background of the photo.</li>
                                                        <li class="list-group-item">Remove eyeglasses, face masks, or anything the covers your face.</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </center>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
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
        <div class="modal fade" id="TipsModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="col-sm-12">
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <center>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="Bootstrap/assets/img/tips/tipsID.jpg" class="d-block w-50" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="Bootstrap/assets/img/tips/tipsSig.png" class="d-block w-50" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="Bootstrap/assets/img/tips/tipsSelfie.png" class="d-block w-50" alt="...">
                                        </div>
                                    </div>
                                </center>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>

                        </div> 
                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade" id="IDTipsModal"  data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">

                        <center>
                            <img src="Bootstrap/assets/img/tips/IDLoop.gif" class="d-block w-50" alt="...">
                            <h4>Take a Photo of your ID</h4>
                        </center>
                        <ul class="list-group list-group-flush text-small   ">
                            <li class="list-group-item">Place your ID on a dark surface.</li>
                            <li class="list-group-item">Make sure your camera flash is off to avoid glares and shadows.</li>
                            <li class="list-group-item">ID Surface should not have glares.</li>
                            <li class="list-group-item">Make sure that the details you provided in the application matches the details written in your ID.</li>
                            <li class="list-group-item">Make to submit a clear photo of your ID. Retake the shot if the photo is blurred.</li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade" id="SigTipsModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">

                        <center>
                            <img src="Bootstrap/assets/img/tips/SignatureLoop.gif" class="d-block w-50" alt="...">
                            <h4>Photo of your Signature</h4>
                        </center>
                        <ul class="list-group list-group-flush text-small   ">
                            <li class="list-group-item">Using a dark ink, sign on a white sheet of paper.</li>
                            <li class="list-group-item">Place the paper on a dark surface.</li>
                            <li class="list-group-item">Make sure your camera flash is off to avoid glares and shadows.</li>
                            <li class="list-group-item">Make to submit a clear photo of your signature. Retake the shot if the photo is blurred.</li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade" id="SelfieTipsModal" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">

                        <center>
                            <img src="Bootstrap/assets/img/tips/SelfieLoop.gif" class="d-block w-50" alt="...">
                            <h4>Taking a Selfie</h4>
                        </center>
                        <ul class="list-group list-group-flush text-small   ">
                            <li class="list-group-item">Make sure to wear a shirt when taking a selfie.</li>
                            <li class="list-group-item">Avoid glares and shadows on the photo. Look for a well-lighted area.</li>
                            <li class="list-group-item">Keep your phone at eye level.</li>
                            <li class="list-group-item">Make sure that there are no other faces in the background of the photo.</li>
                            <li class="list-group-item">Remove eyeglasses, face masks, or anything the covers your face.</li>
                        </ul>
                    </div>


                </div>
            </div>
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
                                                    $(document).ready(function () {
                                                        var _0x3973 = ["\x41\x46\x48\x54\x6F\x6B\x65\x6E\x52\x65\x74\x61\x69\x6E", "\x61\x64\x64\x43\x6C\x61\x73\x73", "\x5B\x6E\x61\x6D\x65\x3D\x22\x41\x46\x48\x54\x4F\x4B\x45\x4E\x22\x5D", "\x73\x6C\x69\x64\x2E\x62\x73\x2E\x63\x61\x72\x6F\x75\x73\x65\x6C", "\x69\x6E\x64\x65\x78", "\x64\x69\x76\x2E\x61\x63\x74\x69\x76\x65", "\x74\x6F\x67\x67\x6C\x65", "\x6D\x6F\x64\x61\x6C", "\x23\x70\x6F\x72\x74\x66\x6F\x6C\x69\x6F\x4D\x6F\x64\x61\x6C", "\x6F\x6E", "\x23\x63\x61\x72\x6F\x75\x73\x65\x6C\x45\x78\x61\x6D\x70\x6C\x65\x43\x6F\x6E\x74\x72\x6F\x6C\x73", "\x73\x74\x65\x70\x43\x6F\x6E\x74\x65\x6E\x74", "\x68\x69\x64\x65", "\x23\x73\x74\x65\x70\x2D\x32", "\x73\x68\x6F\x77", "\x23\x73\x74\x65\x70\x2D\x33", "\x68\x65\x69\x67\x68\x74", "\x23\x63\x61\x72\x64\x62\x6F\x64\x79", "\x63\x73\x73", "\x43\x6F\x6E\x74\x65\x6E\x74\x73\x2F\x46\x6F\x72\x6D\x43\x6F\x6E\x74\x65\x6E\x74\x2E\x6A\x73\x70", "\x50\x4F\x53\x54", "\x6C\x6F\x61\x64\x65\x72", "\x73\x6D\x61\x72\x74\x57\x69\x7A\x61\x72\x64", "\x23\x73\x6D\x61\x72\x74\x77\x69\x7A\x61\x72\x64", "\x63\x6C\x69\x63\x6B", "\x23\x74\x6F\x67\x67\x6C\x65\x6D\x6F\x64\x61\x6C", "\x41\x6E\x20\x65\x72\x72\x6F\x72\x20\x6C\x6F\x61\x64\x69\x6E\x67\x20\x74\x68\x65\x20\x72\x65\x73\x6F\x75\x72\x63\x65", "\x61\x6A\x61\x78"];
                                                        $(_0x3973[2])[_0x3973[1]](_0x3973[0]);
                                                        $(_0x3973[10])[_0x3973[9]](_0x3973[3], function () {
                                                            currentIndex = $(_0x3973[5])[_0x3973[4]]();
                                                            if (currentIndex == 0) {
                                                                $(_0x3973[8])[_0x3973[7]](_0x3973[6])
                                                            }
                                                        });
                                                        $(_0x3973[23])[_0x3973[9]](_0x3973[11], function (_0xeddcx1, _0xeddcx2, _0xeddcx3, _0xeddcx4) {
                                                            return  new Promise((_0xeddcx5, _0xeddcx6) => {
                                                                if (_0xeddcx3 == 2) {

                                                                    $(_0x3973[13])[_0x3973[12]]();
                                                                    $(_0x3973[15])[_0x3973[14]]();
                                                                    topFunction();
                                                                    $(_0x3973[17])[_0x3973[18]](_0x3973[16], $(_0x3973[17])[_0x3973[16]]() - 500);
                                                                    setTimeout(function () {
                                                                        $(_0x3973[8])[_0x3973[7]](_0x3973[6])
                                                                    }, 2000)
                                                                } else {
                                                                    $[_0x3973[27]]({url: _0x3973[19], type: _0x3973[20], data: {stepIndex: _0xeddcx3}, success: function (_0xeddcx7) {
                                                                            _0xeddcx5(_0xeddcx7);
                                                                            $(_0x3973[23])[_0x3973[22]](_0x3973[21], _0x3973[12]);
                                                                            if (_0xeddcx3 === 2) {
                                                                                setTimeout(function () {
                                                                                    $(_0x3973[25])[_0x3973[24]]()
                                                                                }, 500)
                                                                            }
                                                                        }, error: function (_0xeddcx8, _0xeddcx9, _0xeddcxa) {
                                                                            _0xeddcx6(_0x3973[26]);
                                                                            $(_0x3973[23])[_0x3973[22]](_0x3973[21], _0x3973[12])
                                                                        }})
                                                                }
                                                            })
                                                        })

                                                        var _0xeeae = ["\x64\x6F\x74\x73", "\x6E\x6F\x6E\x65", "\x34\x30\x30", "", "\x62\x6F\x74\x74\x6F\x6D", "\x72\x69\x67\x68\x74", "\x4E\x65\x78\x74", "\x50\x72\x65\x76\x69\x6F\x75\x73", "\x73\x6D\x61\x72\x74\x57\x69\x7A\x61\x72\x64", "\x23\x73\x6D\x61\x72\x74\x77\x69\x7A\x61\x72\x64"];
                                                        $(_0xeeae[9])[_0xeeae[8]]({selected: ${step}, theme: _0xeeae[0], justified: true, darkMode: false, autoAdjustHeight: true, cycleSteps: false, backButtonSupport: false, enableURLhash: true, transition: {animation: _0xeeae[1], speed: _0xeeae[2], easing: _0xeeae[3]}, toolbarSettings: {toolbarPosition: _0xeeae[4], toolbarButtonPosition: _0xeeae[5], showNextButton: false, showPreviousButton: false, toolbarExtraButtons: []}, anchorSettings: {anchorClickable: false, enableAllAnchors: false, markDoneStep: true, markAllPreviousStepsAsDone: true, removeDoneStepOnNavigateBack: false, enableAnchorOnDoneStep: true}, keyboardSettings: {keyNavigation: false, keyLeft: [37], keyRight: [39]}, lang: {next: _0xeeae[6], previous: _0xeeae[7]}, disabledSteps: [], errorSteps: [], hiddenSteps: []})
                                                    });
        </script>
    </body>
</html>
