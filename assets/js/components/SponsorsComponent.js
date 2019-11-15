const SponsorComponent = function(props) {
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
const RenderListOfSponsorsComponent = function(callback) {
    let sponsorArr = [];
    const $sponsors = $('.partner-slider');
    $sponsors.loading();
    get('/sponsors').then(function(res) {
        $sponsors.loading('stop');
        const {data} = res;
        const sponsors = data;
        $.each(sponsors, function(index, sponsor) {
            sponsorArr.push(SponsorComponent({sponsor: sponsor, image: BASE_URL + sponsor.sponsor_image}));
        });
        $sponsors.html(sponsorArr.join(''));
        callback();
    })
    
}
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
$(document).ready(function () {
    RenderListOfSponsorsComponent(reCallOwlCarousel);
});
