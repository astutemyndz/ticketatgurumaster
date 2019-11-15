<!doctype html>
<html>
	<head>
		<title>Ticket at Guru</title>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		 <!-- add the jQuery script -->
		 <!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script> -->
		<?php
		foreach ($controller->getCss() as $css)
		{
			echo '<link type="text/css" rel="stylesheet" href="'.(isset($css['remote']) && $css['remote'] ? NULL : PJ_INSTALL_URL).$css['path'].htmlspecialchars($css['file']).'" />';
		}
		foreach ($controller->getJs() as $js)
		{
			echo '<script src="'.(isset($js['remote']) && $js['remote'] ? NULL : PJ_INSTALL_URL).$js['path'].htmlspecialchars($js['file']).'"></script>';
		}
		?>
		<!--[if gte IE 9]>
  		<style type="text/css">.gradient {filter: none}</style>
		<![endif]-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
		<style>
		
		</style>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
		
	</head>
	<body>
		<div id="container">
    		<div id="header">
    			<div id="logo">
    				<a href="<?php echo PJ_INSTALL_URL;?>" target="_blank" rel="nofollow"><img src="app/web/img/logo.png"/></a>
					<!--<span>v<?php echo PJ_SCRIPT_VERSION;?></span>-->
    			</div>
			</div>
			
			<div id="middle">
				<div id="leftmenu">
					<?php require PJ_VIEWS_PATH . 'pjLayouts/elements/leftmenu.php'; ?>
				</div>
				<div id="right">
					<div class="content-top"></div>
					<div class="content-middle" id="content">
					<?php require $content_tpl; ?>
					</div>
					<div class="content-bottom"></div>
				</div> <!-- content -->
				<div class="clear_both"></div>
			</div> <!-- middle -->
		
		</div> <!-- container -->
		<div id="footer-wrap">
			<div id="footer">
			   	<p>Copyright &copy; <?php echo date("Y"); ?> <a href="https://www.astutemyndz.com/" target="_blank">astutemyndz.com</a></p>
	        </div>
		</div>
		 
		<script>
			function myFunction() {
				document.getElementById("myDropdown").classList.toggle("show");
			}

				// Close the dropdown if the user clicks outside of it
				window.onclick = function(event) {
				if (!event.target.matches('.dropbtn')) {
					var dropdowns = document.getElementsByClassName("dropdown-content");
					var i;
					for (i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
					}
				}
				}
				
				//$("#print").jqxButton({ width: 80 });
				var JQueryFileUpload = '<?php echo PJ_THIRD_PARTY_PATH?>jquery_file_upload/9.11.2';
				var PdfJs = '<?php echo PJ_THIRD_PARTY_PATH?>pdfjs/2.3.200';
		</script>
		

	</body>
</html>