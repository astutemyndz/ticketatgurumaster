 <!-- Header -->
 <header>
        	<div class="container-fluid">
            	<div class="header-top">
            		<div class="row align-items-center">
                	<div class="col-sm-2 fixed-center">
                    	<a href="<?php echo base_url();?>"><img src="<?php echo base_url();?>assets/images/logo.png" class="img-fluid site-logo" alt=""/></a>
                    </div>
                    <div class="col-sm-8">
                    	<div class="top-menu-area">
                        	<nav class="navbar navbar-expand-lg navbar-light">
                              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                              </button>
                              <div class="collapse navbar-collapse" id="navbarNavDropdown">
                                <ul class="navbar-nav">
                                 <li class="search-fixed-header">
                                  	<!-- <form>
                                    	<div class="input-group search-fixed ">
                                            <div class="input-group-prepend">
                                              <div class="input-group-text"><i class="fas fa-search"></i></div>
                                            </div>
                                            <div class="the-basics">
                                              <input type="text" class="form-control " name="q"
                       autocomplete="off" placeholder="Search for artist, venue and events">
                                            </div>
                                        </div>
                                    </form> -->
                                    <!-- <form>
                                          <div class="typeahead__container header-fix-search">
                                              <div class="typeahead__field">
                                                  <div class="typeahead__query">
                                                      <input class="js-typeahead"
                                                            name="q"
                                                            autofocus
                                                            autocomplete="off" placeholder="Search">
                                                  </div>
                                                  <div class="typeahead__button">
                                                      <button type="submit">
                                                          <span class="typeahead__search-icon"></span>
                                                      </button>
                                                  </div>
                                              </div>
                                          </div>
                                        </form> -->
                                        <form action="" method="get">
                                                <div class="border-right-none form-group scroll-search typeahead__container">
                                                	<div class="input-group typeahead__field">
                                                        <div class="input-group-prepend">
                                                          <div class="input-group-text"><i class="fas fa-search"></i></div>
                                                        </div>
                                                        <input class="Typeahead-hint" type="text" tabindex="-1" readonly>
                                                        <input id="" class="form-control Typeahead-hint js-typeahead" placeholder="After Scroll Search events"
                                                                    name="q"
                                                                    autofocus
                                                                    autocomplete="off">
                                                        <!-- <img class="Typeahead-spinner" src="<?php echo base_url();?>assets/plugins/twitter-typeahead/img/spinner.gif"> -->
                                                    </div>
                                                </div>
                                          </form>
                                  </li>
                                  <li class="nav-item active">
                                    <a class="nav-link" href="<?php echo base_url();?>">Home</a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link" href="<?php echo base_url();?>events">Events</a>
                                  </li>
                                  <!-- <li class="nav-item">
                                    <a class="nav-link" href="<?php echo base_url();?>cart">Ticket Cart</a>
                                  </li> -->
                                  <li class="nav-item">
                                    <a class="nav-link" href="<?php echo base_url();?>gallery">Gallery</a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link" href="<?php echo base_url();?>partners">Partners</a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link" href="<?php echo base_url();?>contact-us">Contact</a>
                                  </li>
                                  <!-- <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                      More
                                    </a>
                                    <div class="dropdown-menu">
                                      <a class="dropdown-item" href="#">VIP</a>
                                      <a class="dropdown-item" href="#">Deals</a>
                                      <a class="dropdown-item" href="#">Entertainment Guides</a>
                                    </div>
                                  </li> -->
                                </ul>
                              </div>
                            </nav>
                        </div>
                    </div>
                    <div class="col-sm-2">
                    	<nav class="navbar navbar-expand-lg navbar-light help-link-area">
                            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                                <ul class="navbar-nav">
                                	<li class="nav-item">
                                      <a class="nav-link cart-area" href="#"><i class="fab fa-opencart"></i> <span>2</span></a>
                                    </li>
                                    <li class="nav-item dropdown">
                                      <a class="nav-link dropdown-toggle" href="#" id="" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="far fa-user-circle"></i>
                                      </a>
                                      <div class="dropdown-menu" aria-labelledby="">
                                       
                                        
                                        <?php 
                                          if(!empty($this->session->userdata('loggedIn')) && $this->session->userdata('loggedIn') === TRUE) { 
								                            if($this->session->userdata('isCustomer')) {
                                          ?>
                                          <a class="dropdown-item" href="#">My Account</a>
                                          <a class="dropdown-item" href="#">My Tickets</a>
                                          <a class="dropdown-item" href="#">My Listings</a>
                                          <a class="dropdown-item" href="#">Sell</a>
                                          <a class="dropdown-item" href="#">Settings</a>
                                          <a class="dropdown-item" href="#">Learn About Verified Tickets</a>
                                            <a href="javascript:;" class="dropdown-item sign-out" href="#">Sign Out</a>
                                        <?php } ?>
                                        
                                      <?php } else { ?>
                                        <!--<a href="javascript:;" data-fancybox="hello" data-src="#hello" class="dropdown-item sign-in" href="#">Sign In</a>-->
                                        <a href="javascript:;" class="dropdown-item sign-in" data-target="#exampleModal" data-toggle="modal" >Sign In</a>
                                        <?php } ?>
                                      </div>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link" href="#">Help</a>
                                    </li>
                                </ul>
                            </div>
                         </nav>
                    </div>
                </div>
                </div>
                <div class="row">
                	<div class="col-12">
                    	<div class="top-search">
                    		<!-- <h1>Unforgettable Starts Here</h1> -->
                            <div class="form-area">
                            	<div class="row">
                                	<div class="col-sm-10 offset-sm-1">
                                    	<div class="form">
                                        	<div class="form-row">
                                            	<div class="col-sm-3 form-group">
                                                	<div class="input-group">
                                                        <div class="input-group-prepend">
                                                          <div class="input-group-text"><i class="fas fa-map-marker-alt"></i></div>
                                                        </div>
                                                       <input type="text" name="location" id="location" class="form-control" placeholder="City Or Post Code"/>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3 form-group border-right-1">
                                                  <select name="daterange" id="daterange" class="form-control border-right-0">
                                                    <option value="all">All Events</option>
                                                    <option value="this-month">This Month Events</option>
                                                    <option value="this-weekend">This Weekend Events</option>
                                                  </select>
                                                </div>
                                                <!-- <form>
                                                <div class="col-sm-4 border-right-none form-group typeahead__container">
                                                	<div class="input-group typeahead__field">
                                                        <div class="input-group-prepend">
                                                          <div class="input-group-text"><i class="fas fa-search"></i></div>
                                                        </div>
                                                       <input class="form-control js-typeahead" placeholder="Search events"
                                                                    name="q"
                                                                    autofocus
                                                                    autocomplete="off">
                                                    </div>
                                                </div>
                                                </form> -->
                                                
                                                <!-- <form>
                                                  <div class="typeahead__container">
                                                      <div class="typeahead__field">
                                                          <div class="typeahead__query">
                                                              <input class="js-typeahead"
                                                                    name="q"
                                                                    autofocus
                                                                    autocomplete="off">
                                                          </div>
                                                         <div class="typeahead__button">
                                                              <button type="submit">
                                                                  <span class="typeahead__search-icon"></span>
                                                              </button>
                                                          </div> 
                                                      </div>
                                                  </div>
                                                </form> -->
                                             
                                              <!-- <div class="Demo">
                                                <form action="" method="get">
                                                  <input type="hidden" name="mode" value="users">
                                                  <div class="Typeahead Typeahead--twitterUsers">
                                                    <div class="u-posRelative">
                                                      <input class="Typeahead-hint" type="text" tabindex="-1" readonly>
                                                      <input class="Typeahead-input" id="demo-input" type="text" name="q" placeholder="Search Twitter users...">
                                                      <img class="Typeahead-spinner" src="<?php echo base_url();?>assets/js/typeahead/spinner.gif">
                                                    </div>
                                                    <div class="Typeahead-menu"></div>
                                                  </div>
                                                  <button class="u-hidden" type="submit">blah</button>
                                                </form>
                                              </div> -->
                                              	<div class="col-sm-4">
                                              		<form action="" method="get">
                                                    	<div class="border-right-none main-form form-group typeahead__container">
                                                            <div class="input-group typeahead__field">
                                                                <div class="input-group-prepend">
                                                                  <div class="input-group-text"><i class="fas fa-search"></i></div>
                                                                </div>
                                                                <input class="Typeahead-hint" type="text" tabindex="-1" readonly>
                                                                <input id="" class="form-control Typeahead-hint js-typeahead" placeholder="Default Search events"
                                                                            name="q"
                                                                            autofocus
                                                                            autocomplete="off">
                                                                <!-- <img class="Typeahead-spinner" src="<?php echo base_url();?>assets/plugins/twitter-typeahead/img/spinner.gif"> -->
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="col-sm-2 form-group">
                                                	<button type="submit" id="searchButton" class="btn search-btn">Search</button>
                                                </div>
                                            </div>
                                       </div>
                                        
                                        <!-- <div class="under-search">
                                        	<ul>
                                            	<li><a href="#">Taylor Swift</a></li>
                                                <li><a href="#">Eagles</a></li>
                                                <li><a href="#">NBA Tickets</a></li>
                                                <li><a href="#">NHL Tickets</a></li>
                                                <li><a href="#">Jason Aldean</a></li>
                                            </ul>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    <!-- Header -->