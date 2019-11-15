
const ArtistComponent = function(props) {
    const {artist} = props;
    return(`${artist.artistName}`);
    
}
const TopSellingItemComponent = function(props) {
    const {title, event_img, duration, slug, date_time, explicitFormatDay, explicitFormatMonth, artists} = props;
    
    const space = ' ';
   // const [day,month, year] = formatDate(new Date(date_time)).split(space);
    var hours = Math.floor(duration / 60); 
    var min = duration- (hours * 60); 
    var artistSectionArr = [];
    artists.forEach(function(artist) {
        artistSectionArr.push(ArtistComponent({artist: artist}));
    });
    return(`
    <div class="item">
        <div class="event-inner event-list">
        <a href="${BASE_URL}event/${slug}">
        <div class="card">
            <img src="${BASE_URL}${event_img}" class="img-fluid" alt="">
            <div class="card-body">
                <div class="media">
                    <div class="show-date">
                        <h3>${explicitFormatDay}</h3>
                        <p>${explicitFormatMonth}</p>
                    </div>
                    <div class="media-body">
                        <h5 class="mt-0">${title}</h5>
                        <p>Duration: ${hours}:${min}hrs</p>
                        <p>Lal Bahadur Shastri Stadium: Hyderabad</p>
                        <p>${artistSectionArr.join(' | ')}</p>
                    </div>
                </div>
            </div>
        </div>
        </a>
        </div>
    </div>
    `);
}
const TopSellingComponent = function(props) {
    const {events} = props;
    var appendItemComponents = '';
    $.each(events, function(index, event) {
        appendItemComponents += (TopSellingItemComponent(event));
    });
   
    return(`
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="selling-slider">
                            <h4>Top Selling</h4>
                        </div>
                    </div>
                </div>
                <div id="" class="owl-carousel owl-theme sell-slider">
                `+appendItemComponents+`
                </div>
                
            </div>
        </section>
    `);
}
const TopSellingEventHandler = function(callback) {
   const $TopSellingComponent = $('#TopSellingComponent');
    get('/events/bestselling').then(function(res) {
        const events = res.data.events;
        if(events !== undefined && events.length > 0) {
            $TopSellingComponent.html(TopSellingComponent({events:events}));
        }
        callback();
    });
}
const callbackToSellingScript = function() {
    $('.sell-slider').owlCarousel({
        loop:true,
        margin:10,
        dots: false,
        nav: true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1199:{
                items:3
            }
        }
        
     })
}
