const SliderComponent =  function(props) {
    const {event, artists} = props;
    var artistSectionArr = [];
    artists.forEach(function(artist) {
        artistSectionArr.push(ArtistComponent({artist: artist}));
    });
    return(`
        <div class="item">
            <img src="${BASE_URL}${event.event_img}" class="img-fluid" alt=""/>
            <div class="banner-text">
				<div class="banner-heading-text">
					<h1>${event.title}</h1>
					<p>${event.small_description}</p>
					<p>${artistSectionArr.join(' | ')}</p>
				</div>
				<div class="banner-heading-button">
					<a href="${BASE_URL}event/${event.slug}" class="btn my-btn">See Tickets</a>
				</div>
            </div>
        </div>
    `);
}
const SliderComponentEventHandler = function(callback) {
    let eventArr = [];
    const $upcomingEvents = $('.banner-main');
    $upcomingEvents.loading();
    get('/events/type/1').then(function(res) {
        $upcomingEvents.loading('stop');
        const events = res.data.events;
       // response = {status: false};
        // if(events !== undefined && events.length > 0) {
        //     response.status = true;
        // }
        $.each(events, function(index, event) {
           /// console.log(event.artists);
            eventArr.push(SliderComponent({event: event, artists: event.artists}));
        });
        $upcomingEvents.html(eventArr.join(''));
        callback();
    })
}
const callbackSliderScript = function() {
    $('.banner-main').owlCarousel({
        margin:10,
        loop:true,
        autoWidth:true,
        //items:3,
        nav:true,
		dots: false,
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
