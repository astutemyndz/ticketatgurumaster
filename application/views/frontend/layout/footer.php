<footer>
    	<div class="footer-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3">
                        <ul class="footer-link">
                            <li><a href="#">Useful Links</a></li>
                            <li><a href="<?php echo base_url();?>">Home</a></li>
                            <li><a href="<?php echo base_url();?>events">Events</a></li>
                            <li><a href="<?php echo base_url();?>cart">Ticket Cart</a></li>
                            <li><a href="<?php echo base_url();?>gallery">Gallery</a></li>
                            <li><a href="<?php echo base_url();?>partners">Partners</a></li>
                            <!-- <li><a href="<?php echo base_url();?>">Singin</a></li> -->
                            <li><a href="<?php echo base_url();?>contact">Contact</a></li>
                            <li><a href="<?php echo base_url();?>about">About Us</a></li>
                            <!-- <li><a href="#">Gift Cards</a></li>
                            <li><a href="#">N.Y. Registered Brokers</a></li> -->
                        </ul>
                    </div>
                    <div class="col-sm-3">
                        <ul class="footer-link">
                            <li><a href="#">Our Network</a></li>
                            <li><a href="#">Live Nation</a></li>
                            <li><a href="#">House of Blues</a></li>
                            <li><a href="#">Front Gate Tickets</a></li>
                            <li><a href="#">TicketWeb</a></li>
                            <li><a href="#">TicketsNow</a></li>
                            <li><a href="#">Universe</a></li>
                            <li><a href="#">NFL Ticket Exchange</a></li>
                            <li><a href="#">NBATICKETS.com</a></li>
                            <li><a href="#">NHL Ticket Exchange</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-3">
                        <ul class="footer-link">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Ticketmaster Blog</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Work With Us</a></li>
                            <li><a href="#">Across the Globe</a></li>
                            <li><a href="#">Innovation</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-3">
                        <ul class="footer-link">
                            <li><a href="#">Friends & Partners</a></li>
                            <li><a href="#">American Express</a></li>
                            <li><a href="#">Allianz</a></li>
                            <li><a href="#">AWS</a></li>
                            <li>Get Our App <span><a href="#"><i class="fab fa-apple"></i></a> <a href="#"><i class="fab fa-android"></i></a></span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
        	<div class="container-fluid">
            	<div class="row align-items-center">
                	<div class="col-sm-2">
                    	<img src="<?php echo base_url();?>assets/images/logo.png" class="img-fluid footer-logo" alt=""/>
                    </div>
                    <div class="col-sm-5">
                    	<p class="footer-copyright">© 2019 All Rights Reserved. Design And Developed By <a href="https://astutemyndz.com" target="_blank">Astutemyndz</a></p>
                    </div>
                    <div class="col-sm-5">
                    	<ul class="footer-social-media">
                        	<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                            <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- Modal date -->
   
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-custome" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div id="logreg-forms">
        <!-- Sign In Form start from  here -->
            <form id="loginForm" class="form-signin" action="<?php echo base_url();?>auth/login/post" method="post" id="registerForm" >
                <h3 class="font-weight-normal" style="text-align: center"> Sign in</h3>
                <input autocomplete="false" class="form-control" type="email" placeholder="Username" name="email" id="signInIdentity" required>
                <input autocomplete="false" class="form-control" type="password" placeholder="Password" name="password" id="password" required>
                <label class="check">
                    <input type="checkbox" id="remember" name="remember">
                        <span class="checkmark"></span>
                            Keep me logged in
                </label>
                <button id="signInButton" class="btn btn-block my-btn" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                <div class="text-center">
                        <p>Don't have an account? <a href="#" id="btn-signup">Sign Up</a></p>
                        <!-- <a href="#" id="forgot_pswd">Forgot password?</a> -->
                </div> 
                <!-- <div class="social-login">
                    <button class="btn facebook-btn social-btn" type="button"><span><i class="fab fa-facebook-f"></i> Sign in with Facebook</span> </button>
                    <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i> Sign in with Google+</span> </button>
                </div> -->      
            </form>
        <!-- Sign In Form close here -->
        <!-- Sign Up Form start from here -->
            <form id="registerForm"  class="form-signup" method="post" action="<?php echo base_url();?>auth/register/post">
                <h3 class="font-weight-normal" style="text-align: center"> Sign Up</h3>
                <input autocomplete="false" class="form-control" type="text" placeholder="First Name" name="first_name" id="first_name" required>
                <input autocomplete="false" class="form-control" type="text" placeholder="Last Name" name="last_name" id="last_name" required>
                <!-- <input autocomplete="false" class="form-control" type="text" placeholder="Username" name="identity" id="identity" required> -->
                <input autocomplete="false" class="form-control" type="email" placeholder="Email" name="email" id="email" required>
                <input autocomplete="false" class="form-control" type="text" placeholder="Phone" name="phone" id="phone" required>
                <!-- <input autocomplete="false" class="form-control" type="email" placeholder="Confirm Email" name="confirm_email" id="confirm_email" required> -->
                <input autocomplete="false" class="form-control" type="password" placeholder="Password" name="password" id="main_password" required>
                <input autocomplete="false" class="form-control" type="password" placeholder="Confirm Password" name="password_confirm" id="password_confirm" required>
                <label class="check">
                    <input type="checkbox" id="agree" name="agree" required>
                    <span class="checkmark"></span>I agree with the Terms and Conditions</a>
                </label>
                
                <button class="btn btn-block my-btn" type="submit"><i class="fas fa-sign-in-alt"></i> Sign Up</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
            </form>  
        <!-- Sign Up Form close here --> 
        <!-- Forgot Password Form start from here -->
            <form action="/reset/password/" class="form-reset"> 
                <h3 class="font-weight-normal" style="text-align: center"> Forgot Password</h3>
                <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required autofocus>
                <!-- <button class="btn btn-block my-btn" type="submit">Reset Password</button> -->
                <button class="btn btn-block my-btn" type="submit"><i class="fas fa-sign-in-alt"></i> Reset Password </button>
                <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
            </form>  
        <!-- Forgot Password Form close here -->     
        <div class="flash"></div>                  
        </div>
      </div>
      
    </div>
  </div>
</div>


<!-- Style Customizer -->
<div id="style-customizer">
    <div class="style-customizer-wrap get-quote-right">
        <h6 class="sc-header">Get A Quote</h6>
        <form>
        	<div class="form-group">
            	<input type="text" class="form-control" placeholder="Name"/>
            </div>
            <div class="form-group">
            	<input type="text" class="form-control" placeholder="Email"/>
            </div>
            <div class="form-group">
            	<input type="text" class="form-control" placeholder="Phone"/>
            </div>
            <div class="form-group">
            	<textarea rows="3" placeholder="Comments..."></textarea>
            </div>
            <button type="submit" class="btn my-btn">Submit</button>
        </form>
    </div>
    <!-- <button id="sc-toggle" class="get-a-quote-btn" title="Styles Customizer">Get A Quote</button> -->
</div>


<?php /*
<div id="auth" >
    <div id="hello" style="display: none;width:100%;max-width:660px;">
        <div id="logreg-forms">
        <!-- Sign In Form start from  here -->
            <form id="loginForm" class="form-signin" action="<?php echo base_url();?>auth/login/post" method="post" id="registerForm" >
                <h3 class="font-weight-normal" style="text-align: center"> Sign in</h3>
                <input autocomplete="false" class="form-control" type="email" placeholder="Username" name="email" id="signInIdentity" required>
                <input autocomplete="false" class="form-control" type="password" placeholder="Password" name="password" id="password" required>
                <label class="check">
                    <input type="checkbox" id="remember" name="remember">
                        <span class="checkmark"></span>
                            Keep me logged in
                </label>
                <button id="signInButton" class="btn btn-block my-btn" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                <div class="text-center">
                        <p>Don't have an account? <a href="#" id="btn-signup">Sign Up</a></p>
                        <!-- <a href="#" id="forgot_pswd">Forgot password?</a> -->
                </div> 
                <!-- <div class="social-login">
                    <button class="btn facebook-btn social-btn" type="button"><span><i class="fab fa-facebook-f"></i> Sign in with Facebook</span> </button>
                    <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i> Sign in with Google+</span> </button>
                </div> -->      
            </form>
        <!-- Sign In Form close here -->
        <!-- Sign Up Form start from here -->
            <form id="registerForm"  class="form-signup" method="post" action="<?php echo base_url();?>auth/register/post">
                <h3 class="font-weight-normal" style="text-align: center"> Sign Up</h3>
                <input autocomplete="false" class="form-control" type="text" placeholder="First Name" name="first_name" id="first_name" required>
                <input autocomplete="false" class="form-control" type="text" placeholder="Last Name" name="last_name" id="last_name" required>
                <!-- <input autocomplete="false" class="form-control" type="text" placeholder="Username" name="identity" id="identity" required> -->
                <input autocomplete="false" class="form-control" type="email" placeholder="Email" name="email" id="email" required>
                <!-- <input autocomplete="false" class="form-control" type="email" placeholder="Confirm Email" name="confirm_email" id="confirm_email" required> -->
                <input autocomplete="false" class="form-control" type="password" placeholder="Password" name="password" id="main_password" required>
                <input autocomplete="false" class="form-control" type="password" placeholder="Confirm Password" name="password_confirm" id="password_confirm" required>
                <label class="check">
                    <input type="checkbox" id="agree" name="agree" required>
                    <span class="checkmark"></span>I agree with the Terms and Conditions</a>
                </label>
                
                <button class="btn btn-block my-btn" type="submit"><i class="fas fa-sign-in-alt"></i> Sign Up</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
            </form>  
        <!-- Sign Up Form close here --> 
        <!-- Forgot Password Form start from here -->
            <form action="/reset/password/" class="form-reset"> 
                <h3 class="font-weight-normal" style="text-align: center"> Forgot Password</h3>
                <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required autofocus>
                <!-- <button class="btn btn-block my-btn" type="submit">Reset Password</button> -->
                <button class="btn btn-block my-btn" type="submit"><i class="fas fa-sign-in-alt"></i> Reset Password </button>
                <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
            </form>  
        <!-- Forgot Password Form close here -->     
        <div class="flash"></div>                  
        </div>
    </div>
    <!-- <div id="subscribe" style="display: none;width:100%;max-width:660px;">
        subscribe
    </div> -->
</div>
*/?>
<!-- <div id="confirmMessageBox" style="display: none;width:100%;max-width:660px;">

</div> -->

    <!-- Optional JavaScript -->
    <script>
        const API_URL = 'http://127.0.0.1/ticketatgurumaster/api/v0.1.0';
        const BASE_URL = '<?php echo base_url();?>';
       
    </script>
    <!-- Jquery lib-->
    <script type="text/javascript" src="<?php echo base_url();?>assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap lib-->
    <script type="text/javascript" src="<?php echo base_url();?>assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>assets/js/Custom.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>assets/js/jquery.loading.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>assets/js/loadingoverlay.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>assets/js/owl.carousel.min.js"></script>
    <!-- ############################### Plugins integration start from here ###################################################-->
    <script type="text/javascript" src="<?php echo base_url();?>assets/plugins/fancybox/js/jquery.fancybox.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>assets/plugins/jquery-validation/jquery.validate.js"></script>
    
    <script type="text/javascript" src="<?php echo base_url();?>assets/plugins/jquery-confirm/jquery-confirm.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>assets/plugins/twitter-typeahead/js/handlebars.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>assets/plugins/twitter-typeahead/js/jquery.xdomainrequest.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>assets/plugins/twitter-typeahead/js/typeahead.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>assets/plugins/twitter-typeahead/js/typeahead.bundle.js"></script>
    <!-- ############################### Plugins integration close here ###################################################-->
    <script type="text/javascript" src="<?php echo base_url();?>assets/js/masonry.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>assets/js/sweetalert.min.js"></script>
<script id="result-template" type="text/x-handlebars-template">
      <div class="ProfileCard u-cf">
        <div class="ProfileCard-details">
          <div class="ProfileCard-realName">{{title}}</div>
        </div>
      </div>
</script>
<script id="empty-template" type="text/x-handlebars-template">
    <div class="EmptyMessage">Your search turned up 0 results.</div>
</script>

<!-- ####################################### List of Components ##############################################-->
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/UtilComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/FilterComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/SliderComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/TopSellingComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/JustAnnouncedComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/GalleryComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/SponsorsComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/AuthComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/EventListComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/CartComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/PartnerComponent.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/components/AppComponent.js"></script>
<!-- ####################################### List of Components ##############################################-->

<script type="text/javascript" src="<?php echo base_url();?>assets/js/right-stycky.js"></script>

    </body>
</html>