<!doctype html>
<html>
	<head>
		<title>Ticket at Guru</title>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<?php
		foreach ($controller->getCss() as $css)
		{
			echo '<link type="text/css" rel="stylesheet" href="'.(isset($css['remote']) && $css['remote'] ? NULL : PJ_INSTALL_URL).$css['path'].$css['file'].'" />';
		}
		
		foreach ($controller->getJs() as $js)
		{
			echo '<script src="'.(isset($js['remote']) && $js['remote'] ? NULL : PJ_INSTALL_URL).$js['path'].$js['file'].'"></script>';
		}
		?>
	</head>
	<body>
		<div id="container">
			<!--<div id="header">
				<div id="logo">
    				<a href="<?php echo PJ_INSTALL_URL;?>" target="_blank" rel="nofollow">Ticket at Guru</a>
					<span>v<?php echo PJ_SCRIPT_VERSION;?></span>
    			</div>
			</div>-->
			<div id="middle">
				<div id="login-content">
				<?php require $content_tpl; ?>
				</div>
			</div> <!-- middle -->
		</div> <!-- container -->
		<!--<div id="footer-wrap">
			<div id="footer">
			   	<p>Copyright &copy; <?php echo date("Y"); ?> <a href="https://www.astutemyndz.com/" target="_blank">astutemyndz.com</a></p>
	        </div>
        </div>-->
	</body>
</html>