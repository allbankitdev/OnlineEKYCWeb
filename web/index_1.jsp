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
        <!-- SmartWizard -->
        <link href="https://cdn.jsdelivr.net/npm/smartwizard@5/dist/css/smart_wizard_all.min.css" rel="stylesheet" type="text/css" />

    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><img src="dist/ALBlogo.png" alt="..." /></a>

            </div>
        </nav>
       
     
  <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h4 class="section-heading text-uppercase">CashCard EKYC Form</h4>
                                <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                              s
                            </a></div>
                <br>

                <div class="col-sm-12 row">
                    <div class="col-sm-2">
                        <p></p>
                    </div>
                    <div class="col-sm-8 row">
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
                                        <td><li class="nav-item"><a class="nav-link" href="#step-6">Step 6</a></li></td>
                                        </tr>
                                    </table>
                                </div>

                            </ol>

                            <div class="tab-content">
                                <div id="step-1" class="tab-pane" role="tabpanel" aria-labelledby="step-1">

                                </div>
                                <div id="step-2" class="tab-pane" role="tabpanel" aria-labelledby="step-2">

                                </div>
                                <div id="step-3" class="tab-pane" role="tabpanel" aria-labelledby="step-3">
                                 
                                </div>
                                <div id="step-4" class="tab-pane" role="tabpanel" aria-labelledby="step-4">
                                   
                                </div>

                                <div id="step-5" class="tab-pane" role="tabpanel" aria-labelledby="step-5">
                                    Step 5 Content
                                </div>

                                <div id="step-6" class="tab-pane" role="tabpanel" aria-labelledby="step-6">
                                    Step 5 Content
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
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="Bootstrap/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h4 class="text-uppercase">Cash Card</h4>
                                    <p class="item-intro text-muted">Mobile Banking Velocity</p>
                                    <img class="img-fluid d-block mx-auto" src="Bootstrap/assets/img/products/CASHCARDLogo.png" alt="..." />
                                    <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                    <form action="CashCardForm" method="post">
                                        <button class="btn btn-primary btn-xl text-uppercase"  type="Submit">
                                            Open Cashcard
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 2 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="Bootstrap/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h4 class="text-uppercase">BDA</h4>
                                    <p class="item-intro text-muted">Basic Deposit Account</p>
                                    <img class="img-fluid d-block mx-auto" src="Bootstrap/assets/img/products/RSALogo.png" alt="..." />
                                    <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                    <form action="CashCardForm" method="post">
                                        <button class="btn btn-primary btn-xl text-uppercase"  type="Submit">       Close Project
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 3 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="Bootstrap/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h4 class="text-uppercase">RSA</h4>
                                    <p class="item-intro text-muted">Regular Savings Account</p>
                                    <img class="img-fluid d-block mx-auto" src="Bootstrap/assets/img/products/RSALogo.png" alt="..." />
                                    <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                                    <form action="CashCardForm" method="post">
                                        <button class="btn btn-primary btn-xl text-uppercase"  type="Submit">    Close Project
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
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
        <!-- Smart Wizard-->
        <script src="https://cdn.jsdelivr.net/npm/smartwizard@5/dist/js/jquery.smartWizard.min.js" type="text/javascript"></script>
        
        <script>
              $(document).ready(function () {

                //  rection to give the direction of navigation.Here is an ajax call example with Promise.
                // Ajax content loading with "stepContent" event

                $("#smartwizard").on("stepContent", function (e, anchorObject, stepIndex, stepDirection) {
                    // Return a promise object
                    return new Promise((resolve, reject) => {
                        $.ajax({
                            url: 'Contents/FormContent.jsp',
                            type: 'POST',
                            data: {stepIndex: stepIndex},
                            success: function (data) {
                                //console.log(data)
                                resolve(data);
                                // Show the loader
                                $('#smartwizard').smartWizard("loader", "hide");

                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                reject("An error loading the resource");
                                // Show the loader
                                $('#smartwizard').smartWizard("loader", "hide");
                            }
                        });
                    });
                });
                // SmartWizard initialize
                //$('#smartwizard').smartWizard();

                $('#smartwizard').smartWizard({
                    selected: ${step}, // Initial selected step, 0 = first step
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
