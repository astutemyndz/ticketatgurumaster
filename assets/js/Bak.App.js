const get = function(url, options = {headers: null}) {
    return fetch(API_URL + url, {
        headers: (options.headers) ? options.headers : { "Content-Type": 'application/json'},
        method: 'get',
    })
    .then(function (response) {
        return response.json();
    });
}
const post = function(url, body = null, options = {headers: null}) {
    return fetch(API_URL + url, {
        headers: (options.headers) ? options.headers : { "Content-Type": 'application/x-www-form-urlencoded'},
        method: 'post',
        body: body
    })
    .then(function (response) {
        return response.json();
    });
}
// @Components
const BannerComponent =  function(props) {
    console.log(props);
    const {event} = props;
    return(`
        <div class="item">
            <img src="${BASE_URL}${event.event_img}" class="img-fluid" alt=""/>
            <div class="banner-text">
                <h1>${event.title}</h1>
                <p>${event.small_description}</p>
                <a href="${BASE_URL}event/${event.slug}" class="btn my-btn">See Tickets</a>
            </div>
        </div>
    `);
}
const ListOfBannerComponent = function(callback) {
    let eventArr = [];
    const $upcomingEvents = $('.banner-main');
    $upcomingEvents.loading();
    get('/events/type/1').then(function(res) {
        $upcomingEvents.loading('stop');
        const events = res.data.events;
        response = {status: false};
        if(events !== undefined && events.length > 0) {
            response.status = true;
        }
        $.each(events, function(index, event) {
            eventArr.push(BannerComponent({event: event}));
        });
        $upcomingEvents.html(eventArr.join(''));
        callback(response);
    })
}

/**
 * 
 * @param {*} props 
 */
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
const SponsorComponent = function(props) {
    const {sponsor, image} = props;
    //console.log(image);
    const {name, sponsor_year, sponsor_link} = sponsor;
    return(`
    <div class="item">
        <div class="client-area">
            <img src="${image}" class="img-fluid" alt=""/>
            <h3>${name}</h3>
            <p>Sponsor Year: <span>${sponsor_year}</span></p>
        </div>
    </div>
    `);
}
const RenderListOfSponsorsComponent = function(callback) {
    let sponsorArr = [];
    const $sponsors = $('.partner-slider');
    $sponsors.loading();
    get('/sponsors').then(function(res) {
        
        $sponsors.loading('stop');
        const {data} = res;
        const sponsors = data;
        //const baseUrl = sponsors.baseUrl;
        $.each(sponsors, function(index, sponsor) {
            sponsorArr.push(SponsorComponent({sponsor: sponsor, image: BASE_URL + sponsor.sponsor_image}));
        });
        
        $sponsors.html(sponsorArr.join(''));
        callback();
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

const GalleryComponent = function(props) {
    const {galleries} = props;
    let galleryArr = [];
    const $GalleryComponent = $('#GalleryComponent');
    $.each(galleries, function(index, gallery) {
        if(gallery.gallery_image !== undefined) {
            //if(index > 3) {
            //    galleryArr.push(WallItemComponent({gallery: gallery, baseUrl: baseUrl, className: 'hidden'}));
            //} else {
                galleryArr.push(WallItemComponent({gallery: gallery, className: ''}));
            //}
            
        }
        
        
        
    });
    if(galleryArr !== undefined && galleryArr.length > 0) {
        $GalleryComponent.html(`<div class="imglist" >` + galleryArr.join('') + `</div>`);
    } else {
        $GalleryComponent.html(`<div class="imglist" > Image Not Available </div>`);
    }
}
const loadGalleryImageEventHandler = function(callback) {
    get('/gallery').then(function(res) {
        const galleries = res.data;
       // const baseUrl = res.data.baseUrl;
        GalleryComponent({galleries: galleries});
        callback();
    });
}
// @Components
/*
store(key, model:any) {
    localStorage.setItem(key,btoa(JSON.stringify(model)));
}

delete(key) {
    localStorage.removeItem(key);
    return true
}

get(key) {
    if(localStorage.getItem(key)) {
      return JSON.parse(atob(localStorage.getItem(key)));
    }
    return null;
}

clear(){
    localStorage.clear();
}

storeToken(model:any) {
    this.store("session",model);
}

isActive() {
    return this.get("session") != null ? true : false;
}
isAdmin(): boolean {
    var session =  this.get('session');
    console.log(session);
    if(session.profile[0].role === 'ADMIN') {
        //console.log(session.profile.role);
        return true;
    }
    //console.log(session.profile.role);
    return false;
}
deleteToken() {
    this.delete("session");
    return true;
}
getToken(): any {
    return this.get("session").token;
}
getTokenByKey(key: string) {
  if(!this.get(key))
    return '';

  return this.get(key).registrationToken? this.get(key).registrationToken : this.get(key);
}

getJWTToken() {
    return this.getToken();
}

function getHttpHeader() {

    let headers = new Headers().set('Authorization', `Bearer ${this.sessionServiceProvider.getJWTToken()}`);
    // console.warn('this.getJWTToken():', this.sessionServiceProvider.getJWTToken());
    return headers;
}
*/

const reCallOwlCarousel = function() {
    $('.partner-slider').owlCarousel({
        loop:true,
        margin:10,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1199:{
                items:5
            }
        }
    });
}
const reCallMasonryScript = function() {
    $('.wall').jaliswall({item:'.wall-item'});
}
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
    const $AllDatesComponent = $('#AllDatesComponent');
    $AllDatesComponent.html(AllDatesComponent);
    ListOfEventComponent();
    RenderListOfSponsorsComponent(reCallOwlCarousel);
    loadGalleryImageEventHandler(reCallMasonryScript);
    let classQueryString = '';
    const setQueryString = function(paramQueryString) {
        classQueryString = BASE_URL + paramQueryString;
        return this;
    }
    $('#searchButton').on('click', function(e) {
        e.preventDefault();
        const location = $('#location').val();
        const daterange = $('#daterange').val();

        setQueryString(`search?daterange=${daterange}&location=${location}&filter=1`);
        console.log(classQueryString);
        //window.location.href = classQueryString;

    })
    // Home page upcoming event banners
    ListOfBannerComponent(function(response) {
        const {status} = response;
        if(status === true) {
            $('.banner-main').owlCarousel({
                margin:10,
                loop:true,
                autoWidth:true,
                //items:3,
                nav:true,
                autoplayTimeout: 6000,
                autoplay:true,
                smartSpeed: 500,
                autoplayHoverPause: true,
                center: true,
                responsive:{
                    0:{
                        items:1
                     },
                    600:{
                        items:2
                     },
                    1025:{
                        items:3
                     },
                }
            })
        }
        
    });
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
