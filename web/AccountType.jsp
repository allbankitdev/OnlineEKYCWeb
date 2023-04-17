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
            <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
                <div class="container">
                    <a class="navbar-brand" href="#page-top"><img src="dist/ALBlogo.png" alt="..." /></a>

                </div>
            </nav>
            <!-- Masthead-->
            <header class="masthead">
                <div class="container">
                    <div class="masthead-heading text-uppercase text-start">Opening an account <br> made easy!</div>
                    <div class="masthead-subheading text-start">Welcome to AllBank Online E-KYC</div>
                    <div>
                        <a  href="#portfolio" type="button" id="rectangle_1" class="btn float-start"><h3 class="text-light">Get Started  <i class="fas fa-arrow-right"></i></h3></a>
                    </div>

                    <br>
                    <br>
                    <br>
                    <br>
                    <div class="text-small text-start">*Available only for new customer</div>

                </div>
            </header>
            <!-- Portfolio Grid-->
            <section class="page-section bg-light" id="portfolio">
                <div class="container">
                    <div class="text-center">
                        <h2 class="section-heading text-uppercase">Account Type</h2>
                        <h3 class="section-subheading text-muted">What Account would you like to open?</h3>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-sm-6 mb-4">
                            <!-- Portfolio item 1-->
                            <div class="portfolio-item">
                                <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                    <div class="portfolio-hover">
                                        <div class="portfolio-hover-content"><img class="img-fluid" src="Bootstrap/assets/img/products/CASHCARD.png" alt="..." /></div>
                                    </div>
                                    <img class="img-fluid" src="Bootstrap/assets/img/products/CASHCARDLogo.png" alt="..." />
                                </a>
                                <div class="portfolio-caption">
                                    <div class="portfolio-caption-heading">Cash card</div>
                                    <div class="portfolio-caption-subheading text-muted">Mobile Banking Velocity</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 mb-4">
                            <!-- Portfolio item 2-->
                            <div class="portfolio-item">
                                <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                                    <div class="portfolio-hover">
                                        <div class="portfolio-hover-content"><img class="img-fluid" src="Bootstrap/assets/img/products/BDA.png" alt="..." /></div>
                                    </div>
                                    <img class="img-fluid" src="Bootstrap/assets/img/products/RSALogo.png" alt="..." />
                                </a>
                                <div class="portfolio-caption">
                                    <div class="portfolio-caption-heading">BDA</div>
                                    <div class="portfolio-caption-subheading text-muted">Basic Deposit Account</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6 mb-4">
                            <!-- Portfolio item 3-->
                            <div class="portfolio-item">
                                <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
                                    <div class="portfolio-hover">
                                        <div class="portfolio-hover-content"><img class="img-fluid" src="Bootstrap/assets/img/products/RSA.png" alt="..." /></div>
                                    </div>
                                    <img class="img-fluid" src="Bootstrap/assets/img/products/RSALogo.png" alt="..." />
                                </a>
                                <div class="portfolio-caption">
                                    <div class="portfolio-caption-heading">RSA</div>
                                    <div class="portfolio-caption-subheading text-muted">Regular Savings Account</div>
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
                        <div class="modal-body">

                            <img class="img-fluid d-block mx-auto" src="Bootstrap/assets/img/products/CASHCARDLogo.png" alt="..." />
                            <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
                            <form action="CashCardForm" method="post">
                               
                            </form>
                             <a  class="btn btn-warning" href="CashCardForm">Open Cashcard</a>  
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal fade" id="portfolioModal2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h6 class="text-uppercase">BDA<span ><small class="text-muted"> (Basic Deposit Account)</small></span></h6>

                        </div>
                        <div class="modal-body">

                            <img class="img-fluid d-block mx-auto" src="Bootstrap/assets/img/products/CASHCARDLogo.png" alt="..." />
                            <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
                            <form action="BDAForm" method="post">
                                <button type="submit" class="btn btn-success">Open Basic Deposit Account</button>  
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade" id="portfolioModal3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h6 class="text-uppercase">RSA<span ><small class="text-muted"> (Regular Savings Account)</small></span></h6>

                        </div>
                        <div class="modal-body">

                            <img class="img-fluid d-block mx-auto" src="Bootstrap/assets/img/products/CASHCARDLogo.png" alt="..." />
                            <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Back</button>
                            <form action="RSAForm" method="post"><button type="submit" class="btn btn-success">Open RSA Account</button>  </form>
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
