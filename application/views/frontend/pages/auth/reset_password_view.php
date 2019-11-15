<section class="">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 text-center">
                <div class="heading-area">
                    <h2 class="mb-5">Reset Password</h2>
                </div>
            </div>
        </div>
        <div class="row">
        	<div class="col-sm-8 offset-sm-2">
            	<div class="contact-form">
                <?php echo form_open('auth/change_password', array('id' => 'resetPasswordForm'));?>
						<div class="form-row">
                        <div class="col-sm-8 offset-sm-2">
                                <div class="col-sm-4 form-group">
                                New Password (at least <?php echo $min_password_length;?> characters long): <br />
        <?php echo form_input($new_password);?>
                                </div>
                                <div class="col-sm-4 form-group">
                                Confirm New Password:
                                <?php echo form_input($new_password_confirm);?>
                                </div>
                            </div>
                        </div>
                        <?php echo form_input($user_id);?>
                        <?php echo form_input($code);?>
						<button id="resetPasswordButton" class="cont-form-sub btn my-btn" type="submit" value="Submit">Save</button>
                        <?php echo form_close();?>
                </div>
            </div>
        </div>
    </div>
</section>