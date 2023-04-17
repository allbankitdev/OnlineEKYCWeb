<%-- 
    Document   : index.jsp
    Created on : Aug 26, 2021, 3:01:40 PM
    Author     : vgponciano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <style>
            #rectangle_1 {
                top: 674px;
                left: 240px;
                width: 291px;
                height: 68px;
                -ms-border-radius: 23px;
                -o-border-radius: 23px;
                -moz-border-radius: 23px;
                -webkit-border-radius: 23px;
                border-radius: 23px;
                background:rgba(99,174,92,1);

                #get_started__ {
                    top: 694px;
                    left: 292px;
                    width: 204px;
                    height: 45px;
                    overflow: hidden;
                    font-family: Roboto;
                    font-size: 24px;
                    text-align: left;
                    color:#FFFFFF;
                }
            </style>
        </head>
        <body id="page-top">
            <!-- Navigation-->
            <!-- Masthead-->
            <header class="masthead" style="padding-top: 0px;text-align : start">
                    <img style="height: 4.5rem ; margin-left: 4.5rem"  src="dist/ALBlogo.png" alt="..." />
                   
                    <div class="container">
 <br>
                        <div class="masthead-heading text-uppercase text-start">
                            Opening an account <br> made easy!</div>
                        <div class="masthead-subheading text-start">
                            <p style="font-family:'Raleway'">Welcome to AllBank Online E-KYC</p></div>
                        <div>
                            <a href="#portfolio" type="button" id="rectangle_1" class="btn float-start"><h3 class="text-light">Get Started  <i class="fas fa-arrow-right"></i></h3></a>
                        </div>

                        <br>
                        <br>
                        <br>
                        <br>
                        <div class="text-small text-start">*Available for new customer only</div>

                    </div>
                </header>
                <!-- Portfolio Grid-->
                <section class="page-section bg-light" id="portfolio">
                    <div class="container">
                        <div class="text-center">
                            <h2 class="section-heading text-uppercase">Account Type</h2>
                            <h3 class=" text-muted" style="font-family: 'Raleway';font-size: 1rem;">What Account would you like to open?</h3>
                        <br>    
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-sm-6 mb-4">
                            <!-- Portfolio item 1-->
                            <div class="portfolio-item">
                                <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                    <div class="portfolio-hover" style='background: #bfd3f766;'>
                                        <div class="portfolio-hover-content"></div>
                                    </div>
                                    <img class="img-fluid" src="Bootstrap/assets/img/products/MBVLogoNBG.png" alt="..." />
                                </a>
                                <div class="portfolio-caption">
                                    <div class="portfolio-caption-heading">Cash Card</div>
                                    <div class="" style="font-family: 'Raleway'">Mobile Banking Velocity</div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 col-sm-6 mb-4">
                                <!-- Portfolio item 3-->
                                <div class="portfolio-item">
                                    <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
                                        <div class="portfolio-hover" style='background: #bfd3f766;'>
                                        <div class="portfolio-hover-content"></div>
                                    </div>
                                    <img class="img-fluid" src="Bootstrap/assets/img/products/RSALogoNBG.png" alt="..." />
                                </a>
                                <div class="portfolio-caption">
                                    <div class="portfolio-caption-heading">ATM</div>
                                    <div class="" style="font-family: 'Raleway'">Regular Savings Account</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6 mb-4">
                                <!-- Portfolio item 2-->
                                <div class="portfolio-item">
                                    <a class="portfolio-link" data-bs-toggle="modal" href="">
                                        <div class="portfolio-hover" style='background: #bfd3f766;'>
                                        <div class="portfolio-hover-content"></div>
                                    </div>
                                    <img class="img-fluid" src="Bootstrap/assets/img/products/Virtual.png" alt="..." />
                                </a>
                                <div class="portfolio-caption">
                                    <div class="portfolio-caption-heading">Virtual Card</div>
                                    <div class="" style="font-family: 'Raleway'">Coming Soon!</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Footer-->
                <footer class="footer py-4">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-4 text-lg-start">Copyright &copy;AllBank.ph 2021</div>
                            <div class="col-lg-4 my-3 my-lg-0">
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                            <div class="col-lg-4 text-lg-end">
                                <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                                <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- Portfolio Modals-->
                <!-- Portfolio item 1 modal popup-->
                <!-- Button trigger modal -->


                <!-- Modal -->
                <div class="modal fade" id="portfolioModal1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h6 class="text-uppercase">Cash Card<span ><small class="text-muted"> (Mobile Banking Velocity)</small></span></h6>

                            </div>
                            <div class="modal-body" style="overflow: hidden;">
                            <center>
                                <img src="Bootstrap/assets/img/products/MBVLogoNBG.png" class="d-block w-50" alt="...">
                                <h4>Account Features</h4>
                            </center>
                            <ul class="">
                                <li style="font-family: 'Raleway'">No initial deposit</li>
                                    <li style="font-family: 'Raleway'">No maintaining balance</li>
                                    <li style="font-family: 'Raleway'">No dormancy fee</li>
                                    <li style="font-family: 'Raleway'">Php 50,000 maximum</li>
                                    <li style="font-family: 'Raleway'">No account closure fees</li>
                                    <li style="font-family: 'Raleway'">Php 15 fee transfer to other Bank via Instapay</li>
                                    <li style="font-family: 'Raleway'">Free Allbank to Allbank Transfer</li>
                                </ul>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
                                <a  class="btn btn-warning" href="CashCardForm">Open Cashcard</a>  
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal fade" id="portfolioModal3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h6 class="text-uppercase">ATM<span ><small class="text-muted"> (Regular Savings Account)</small></span></h6>
                            </div>
                            <div class="modal-body" style="overflow: hidden;">
                            <center>
                                <img src="Bootstrap/assets/img/products/RSALogoNBG.png" class="d-block w-50" alt="...">
                                <h4>Account Features</h4>
                            </center>
                            <ul class="">
                                <li style="font-family: 'Raleway'">Php 500 Initial Deposit</li>
                                    <li style="font-family: 'Raleway'">Php 500 Maintaining Balance</li>
                                    <li style="font-family: 'Raleway'">ADB to earn interest : Php 5,000</li>
                                    <li style="font-family: 'Raleway'">Php 30 Dormancy Fee</li>
                                    <li style="font-family: 'Raleway'">No maximum deposit</li>
                                    <li style="font-family: 'Raleway'">Php 15 fee transfer to other Bank via Instapay</li>
                                    <li style="font-family: 'Raleway'">Free Allbank to Allbank Transfer</li>
                                </ul>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
                                <a  class="btn btn-warning" href="RSAForm">Open ATM Savings</a>  
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Bootstrap core JS-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Core theme JS-->
                <script src="Bootstrap/js/scripts.js"></script>

            </body>
        </html>
