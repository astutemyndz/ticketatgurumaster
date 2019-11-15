
const HomeEventComponent = function(props) {
    const {event, image} = props;
    const {title, small_description,slug, date, time} = event;
    return(`
    <div class="event-book">
        <div class="row align-items-center">
            <div class="col-sm-9 border-right">
                <div class="row align-items-center">
                    <div class="col-sm-4">
                        <a href="#" class="announced-image">
                            <img src="${image}" class="img-fluid" alt=""/>
                        </a>
                    </div>
                    <div class="col-sm-8">
                        <div class="announced-details">
                            <h3 class="color-blue">${title}</h3>
                            <p>${small_description}</p>
                            <a href="${BASE_URL}event/${slug}" class="btn my-btn">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="announce-readmore">
                    <div class="date-view-ticket">
                        <div class="show-date">
                        <h3>${date}</h3>
                        </div>
                    </div>
                    <p><i class="far fa-clock"></i> ${time}</p>
                    
                </div>
            </div>
        </div>
    </div>
    `);
}
const ListOfEventComponent = function() {
    let eventArr = [];
    const $events = $('#events');
    $events.loading();
    get('/events').then(function(res) {
        $events.loading('stop');
        const events = res.data.events;
        $.each(events, function(index, event) {
            eventArr.push(HomeEventComponent({event: event, image: BASE_URL+event.event_img}));
        });
        
        $events.html(eventArr.join(''));
    })
}


const AllDatesComponent = function() {
    return(`
        <a class="dropdown-item" href="javascript:;">All Dates</a>
        <a class="dropdown-item" href="javascript:;">This Weekend</a>
        <a class="dropdown-item daterange" href="javascript:;" >Select Days</a>
    `);
}

const WallItemComponent = function(props) {
    const {gallery, className} = props;
    return(`
        <div class="wall-item moreBox ${className}"> 
            <a href="${BASE_URL}${gallery.gallery_image}" class="image-gallery" data-fancybox="images">
                <img src="${BASE_URL}${gallery.gallery_image}" class="img-fluid"/>
            </a>
        </div>
    `);
}


// @Components




function toggleResetPswd(e){
		e.preventDefault();
		$('#logreg-forms .form-signin').toggle() // display:block or none
		$('#logreg-forms .form-reset').toggle() // display:block or none
	}
function toggleSignUp(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle(); // display:block or none
    $('#logreg-forms .form-signup').toggle(); // display:block or none
}
$(function(){
    // Login Register Form
    $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
    $('#logreg-forms #cancel_reset').click(toggleResetPswd);
    $('#logreg-forms #btn-signup').click(toggleSignUp);
    $('#logreg-forms #cancel_signup').click(toggleSignUp);
})
$(document).ready(function () {
    SliderComponentEventHandler(callbackSliderScript);
    FilterComponent();
    TopSellingEventHandler(callbackToSellingScript);
    JustAnnouncedComponentEventHandler(callbackJustAnnouncedScript);
    //RegisterComponent();
   
   
    // Home page upcoming event banners
   
    
    /*
	$('#subscribeSignInButton').on('click', function() {
		console.log('click');
		//$('#hello').show();
		$("#hello").fancybox().trigger('click');
		
	});
	$('.sign-in').on('click', function() {
		$("#hello").fancybox().trigger('click');
	});
	$('#subscribeButton').on('click', function() {
		$("#subscribe").fancybox().trigger('click');
    });
    */
	
});
/*
$(function () {
    $("div").slice(0, 4).show();
    $("#loadMore").on('click', function (e) {
        e.preventDefault();
        $("div:hidden").slice(0, 4).slideDown();
        if ($("div:hidden").length == 0) {
            $("#load").fadeOut('slow');
        }
        $('html,body').animate({
            scrollTop: $(this).offset().top
        }, 1500);
    });
});
*/
// $('a[href=#top]').click(function () {
//     $('body,html').animate({
//         scrollTop: 0
//     }, 600);
//     return false;
// });
$( document ).ready(function () {
    $(".moreBox").slice(0, 3).show();
      if ($(".blogBox:hidden").length != 0) {
        $("#loadMore").show();
      }   
      $("#loadMore").on('click', function (e) {
        e.preventDefault();
        $(".moreBox:hidden").slice(0, 3).slideDown();
        if ($(".moreBox:hidden").length == 0) {
          $("#loadMore").fadeOut('slow');
        }
      });
});
$(window).scroll(function () {
    if ($(this).scrollTop() > 50) {
        $('.totop a').fadeIn();
    } else {
        $('.totop a').fadeOut();
    }
});
/*
$(".sign-in").on('click', function() {

    $.fancybox.open(`
    <div id="hello" style="display: none;width:100%;max-width:660px;">
        <div id="logreg-forms">
       
            <form id="loginForm" class="form-signin" action="${BASE_URL}auth/login/post" method="post" id="registerForm" >
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
       
                </div> 
                 
            </form>
       
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
      
            <form action="/reset/password/" class="form-reset"> 
                <h3 class="font-weight-normal" style="text-align: center"> Forgot Password</h3>
                <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required autofocus>
                <!-- <button class="btn btn-block my-btn" type="submit">Reset Password</button> -->
                <button class="btn btn-block my-btn" type="submit"><i class="fas fa-sign-in-alt"></i> Reset Password </button>
                <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
            </form>  
          
        <div class="flash"></div>                  
        </div>
    </div>
   
`);
  
  });
  */