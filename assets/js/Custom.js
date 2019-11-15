
jQuery(document).ready(function($) {
	
	
  
	// $('.partner-slider').owlCarousel({
	// 	loop:true,
	// 	margin:10,
	// 	responsive:{
	// 		0:{
	// 			items:1
	// 		},
	// 		600:{
	// 			items:2
	// 		},
	// 		1199:{
	// 			items:5
	// 		}
	// 	}
		
	// })
	//$( ".news-slider .owl-prev").html('<img src="images/arrow-left2.png"/>');
	//$( ".news-slider .owl-next").html('<img src="images/arrow-right2.png"/>');
	
	
	
	
	
    $(function() {
		var header = $(".header-top");
		$(window).scroll(function() {    
			var scroll = $(window).scrollTop();

			if (scroll >= 10) {
				header.addClass("header-alt");
			} else {
				header.removeClass("header-alt");
			}
		});
	});
	
	
	
	
	$(document).ready(function() {
            $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
            $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
        });
		
		
		$(document).ready(function() {
			// Configure/customize these variables.
			var showChar = 450;  // How many characters are shown by default
			var ellipsestext = "...";
			var moretext = "Read more";
			var lesstext = "Read less";
			
		
			$('.more').each(function() {
				var content = $(this).html();
		 
				if(content.length > showChar) {
		 
					var c = content.substr(0, showChar);
					var h = content.substr(showChar, content.length - showChar);
		 
					var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
		 
					$(this).html(html);
				}
		 
			});
		 
			$(".morelink").click(function(){
				if($(this).hasClass("less")) {
					$(this).removeClass("less");
					$(this).html(moretext);
				} else {
					$(this).addClass("less");
					$(this).html(lesstext);
				}
				$(this).parent().prev().toggle();
				$(this).prev().toggle();
				return false;
			});
		});
		
		
		 

});

