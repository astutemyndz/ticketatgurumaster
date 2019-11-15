
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
   


    // const $AllDatesComponent = $('#AllDatesComponent');
    // $AllDatesComponent.html(AllDatesComponent);
    //ListOfEventComponent();
   
   
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
