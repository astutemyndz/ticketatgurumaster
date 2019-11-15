const PartnerComponent = function(props) {
    //console.log(props);
    const {sponsor, image} = props;
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
const ListOfPartnerComponent = function(callback) {
    let sponsorArr = [];
    const $sponsors = $('.partner-inner-slide');
    $sponsors.loading();
    get('/sponsors').then(function(res) {
        
        $sponsors.loading('stop');
        const {data} = res;
        const sponsors = data;
        $.each(sponsors, function(index, sponsor) {
            sponsorArr.push(PartnerComponent({sponsor: sponsor, image: BASE_URL + sponsor.sponsor_image}));
        });
        $sponsors.html(sponsorArr.join(''));
        callback();
    })
    
}
const reCallOwlCarouselCallback = function() {
    $('.partner-inner-slide').owlCarousel({
		loop:true,
		margin:2,
		nav:false,
		responsive:{
			0:{
				items:1
			},
			600:{
				items:3
			},
			1000:{
				items:4
			}
		}
	});
}
$(document).ready(function () {
    ListOfPartnerComponent(reCallOwlCarouselCallback);
});
