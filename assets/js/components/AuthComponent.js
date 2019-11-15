const messageBox = function(targetElement, props) {
	
	return $(targetElement).append(
		`<div class="alert ${props.className} alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<strong>${props.message.title}</strong> ${props.message.text}
		</div>`
	);
}
jQuery.validator.addMethod("phone", function(phone_number, element) {
    phone_number = phone_number.replace(/\s+/g, "");
    return this.optional(element) || phone_number.length > 9 && 
    phone_number.match(/^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/);
}, "Please specify a valid phone number");

var foo = function(props) {
	console.log(props.name);
	$('.signupFlash').append("<p>"+ props.name + "</p>");
}
$("document").ready(function() {


	$('#loginLink').on('click', function() {
		setTimeout(() => {
			window.location.href = `${API_URL}auth/login`;
		}, 300);
	});
	$('#logoutLink').on('click', function() {
		setTimeout(() => {
			window.location.href = `${API_URL}auth/logout`;
		}, 300);
	});
	

	// validate signup form on keyup and submit
	$("#registerForm").validate({
		rules: {
			firs_tname: "required",
			last_name: "required",
			main_password: {
				required: true,
				minlength: 8
			},
			password_confirm: {
				required: true,
				minlength: 8,
				equalTo: "#main_password"
			},
			email: {
				required: true,
				email: true
			},
			phone: {
				required: true,
				phone: true,
				minlength:10,
				maxlength:10
			},
			registerIdentity: {
				required: true,
			},
			confirm_email: {
				required: true,
				email: true,
				equalTo: "#email"
			},
			agree: "required"
		},
		messages: {
			firs_tname: "Please enter your firstname",
			last_name: "Please enter your lastname",
		
			main_password: {
				required: "Please provide a password",
				minlength: "Your password must be at least 8 characters long"
			},
			password_confirm: {
				required: "Please provide a password",
				minlength: "Your password must be at least 8 characters long",
				equalTo: "Please enter the same password as above"
			},
			email: "Please enter a valid email address",
			registerIdentity: "Please enter a valid username",
			confirm_email: {
				required: "Please provide a confirm email",
				minlength: "Your email must be at least 5 characters long",
				equalTo: "Please enter the same email as above"
			},
			//agree: "I agree with the Terms and Conditions",
		},
		submitHandler: function(form) {
			$.ajax({
				url: form.action,
				type: form.method,
				data: $(form).serialize(),
				beforeSend: function() {
					//$("#auth").loading({theme: 'dark'});
					$('#hello').loading({
						overlay: $("#custom-overlay")
					});
				},
				success: function(res) {
					if(res.status == 200) {
						if(res.loggedIn) {
							$("#auth").loading('stop');
							messageBox('.flash', {message: {title: 'MessageBox', text: res.message}, className: 'alert-success'});
							setTimeout(() => {
									$('.alert').delay(2000).fadeOut();
							}, 500);
							setTimeout(function() {
								location.reload();
							}, 3000);
						} else {
							const errors = res.errors;
							console.log(errors);
							$("#auth").loading('stop');
							if($.isArray(errors)) {
								$.each(errors, function( index, value ) {
									messageBox('.flash', {message: {title: 'MessageBox', text: value}, className: 'alert-danger'});
								});
								// setTimeout(() => {
								// 	$('.flash').delay(2000).fadeOut();
								// }, 500);
							} else {
								messageBox('.flash', {message: {title: 'MessageBox', text: res.message}, className: 'alert-danger'});
								// setTimeout(() => {
								// 	$('.flash').delay(2000).fadeOut();
								// }, 2000);
							}
						}
					} 
				},
				error: function(res) {
					const errors = res.errors;
						console.log(errors);
				}         
			});
		}
	});
	$("#loginForm").validate({
		rules: {
			password: {
				required: true,
				minlength: 5
			},
			identity: {
				required: true,
				email: true
			},
			agree: "required"
		},
		messages: {
			email: "Please enter a valid email address",
			password: {
				required: "Please provide a password",
				minlength: "Your password must be at least 5 characters long"
			},
			agree: "I agree with the Terms and Conditions",
		},
		submitHandler: function(form, e) {
			e.preventDefault();
			$.ajax({
				url: form.action,
				type: form.method,
				data: {
					email: $('#signInIdentity').val(),
					password: $('#password').val()
				},
				beforeSend: function() {
					$("#auth").loading({theme: 'dark'});
					
				},
				success: function(res) {
				
					if(res.status == 200) {
						
						if(res.loggedIn) {
							$("#auth").loading('stop');
							messageBox('.flash', {message: {title: 'MessageBox', text: res.message}, className: 'alert-success'});
							setTimeout(() => {
								$('.flash').delay(2000).fadeOut();
							}, 500);
							setTimeout(function() {
								location.reload();
							}, 500);
						} else {
							$("#auth").loading('stop');
							messageBox('.flash', {message: {title: 'MessageBox', text: res.message}, className: 'alert-danger'});
							// setTimeout(() => {
							// 	$('.alert').delay(2000).fadeOut();
							// }, 500);
						}
					} 
				},
				error: function(res) {
					console.log(res);
					//this.messageBox('.flash', {message: {title: res.message, text: res.message}, className: 'alert-danger'});
				}         
			});
		}
	});
	$("#resetPasswordForm").validate({
		rules: {
			new_password: {
				required: true,
				minlength: 8
			},
			new_confirm: {
				required: true,
				minlength: 8,
				equalTo: "#new_password"
			}
		},
		messages: {
			new_password: {
				required: "Please provide a password",
				minlength: "Your password must be at least 8 characters long"
			},
			password_confirm: {
				required: "Please provide a password",
				minlength: "Your password must be at least 8 characters long",
				equalTo: "Please enter the same password as above"
			}
		},
		submitHandler: function(form) {
			$.ajax({
				url: form.action,
				type: form.method,
				data: $(form).serialize(),
				beforeSend: function() {
					$('#resetPasswordForm').loading();
				},
				success: function(res) {
					console.log(res);
					setTimeout(() => {
						$('#resetPasswordForm').loading('stop');
					}, 600);
					if(res != null && res != undefined) {
						const {status, message, valid_csrf_nonce} = res;
						const {code, text} = status;
						if(code === 200 && valid_csrf_nonce === true) {
							swal({
								title: "Success",
								text: message, 
								icon: "success",
							});
							setTimeout(() => {
								window.location.href = BASE_URL;
							}, 1000);
							
						} else {
							swal({
								title: "Error",
								text: message, 
								icon: "error",
							})
						}
					}
					
					
				},
				error: function(res) {
					console.log(res);
				}         
			});
		}
	});

    $('.sign-out').on('click', function() {
        $.confirm({
            title: 'Warning',
            content: `Are you sure to continue?
            <form id="logoutForm" method="post" action="${API_URL}/logout"></form>
            `,
            icon: 'fa fa-exclamation-triangle',
            theme: 'material',
            closeIcon: true,
            animation: 'scale',
            type: 'orange',
            buttons: {   
                formSubmit: {
                    text: 'OK',
                    btnClass: 'btn-blue',
                    action: function(){
                        // var url = $('#logoutForm').attr('action');//.val();
                         post('/auth/logout',).then(function(res) {
                            //console.log(res);
							const {message} = res;
							/*
                            $.alert({
                                title: 'MessageBox',
                                content: `<strong class="btn-success">${message}</strong>`,
                                icon: 'fa fa-success',
                                theme: 'material',
                                animation: 'scale',
                                closeAnimation: 'scale',
                                buttons: {
                                    okay: {
                                        text: 'Okay',
                                        btnClass: 'btn-blue',
                                        action: function() {
                                            location.reload();
                                        }
                                    }
                                }
							});
							*/
							location.reload();
                         }).catch(function(err) {
                             console.log(err);
                             $.alert(err);
                         })
                        // console.log(action);
                        // if(!name){
                        //     $.alert('provide a valid name');
                        //     return false;
                        // }
                        // $.alert('Your name is ' + name);

                    }
                },
                cancel: function(){
                        console.log('the user clicked cancel');
                }
            },
            onContentReady: function(){
                // you can bind to the form
                var jc = this;
                this.$content.find('form').on('submit', function(e){ // if the user submits the form by pressing enter in the field.
                    e.preventDefault();
                    jc.$$formSubmit.trigger('click'); // reference the button and click it
                });
            }
        });
    
})
});