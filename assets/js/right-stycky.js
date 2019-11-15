


// Listen to variable controls changes
//$('.sc-variable').change(function(e) {
//	styleCustomizer.changeVar(this.dataset.key, this.value, this);
//});

// Toggle styles customizer
$('#sc-toggle').click(function(e) {
	$('#style-customizer').toggleClass('expanded');
});

//if(navigator.userAgent.indexOf('Trident') !== -1) {
//	$('#sc-download-css').after('<p><strong class="text-danger">File download is not supported in Internet Explorer.</strong></p>');
//}
//$('#sc-download-css').click(function(e) {
//	styleCustomizer.downloadCssFile();
//});

// Fill in the variables into controls
//$('.sc-variable').each(function() {
//	if(this.dataset.key === 'outerBgImage') return;
//
//	if(this.type === 'radio') {
//		this.checked = this.value === lessVars[this.dataset.key];
//	} else {
//		this.value = lessVars[this.dataset.key];
//	}
//});