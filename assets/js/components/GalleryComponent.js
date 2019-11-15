const reCallMasonryScript = function() {
    $('.wall').jaliswall({item:'.wall-item'});
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
$(document).ready(function () {
    loadGalleryImageEventHandler(reCallMasonryScript);
});