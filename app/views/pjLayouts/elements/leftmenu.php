<?php
// if (pjObject::getPlugin('pjOneAdmin') !== NULL && $controller->isAdmin())
// {
// 	$controller->requestAction(array('controller' => 'pjOneAdmin', 'action' => 'pjActionMenu'));
// }
// echo "<pre>";
// print_r(App::printSession());
// exit;


?>

<div class="leftmenu-top"></div>
<div class="leftmenu-middle">
	<ul class="menu">
		<?php 
		// is_superadmin = false
		if(!$_SESSION['is_superadmin']) { ?>
		<li <?php echo (in_array( 'controller=pjAdmin&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdmin&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdmin' && $_GET['action'] == 'pjActionIndex' ? 'menu-focus' : NULL; ?>"><span class="menu-dashboard">&nbsp;</span><?php __('menuDashboard'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminSchedule&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminSchedule&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminSchedule' ? 'menu-focus' : NULL; ?>"><span class="menu-schedule">&nbsp;</span><?php __('menuSchedule'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminBookings&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&action=pjActionIndex" class="<?php echo ($_GET['controller'] == 'pjAdminBookings' || ($_GET['controller'] == 'pjInvoice' && $_GET['action'] != 'pjActionIndex')) ? 'menu-focus' : NULL; ?>"><span class="menu-bookings">&nbsp;</span><?php __('menuBookings'); ?></a>
		
		</li>


		
		<li <?php echo (in_array( 'controller=pjAdminArtists&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminArtists&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminArtists' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuArtist'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminEvents&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminEvents&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminEvents' ? 'menu-focus' : NULL; ?>"><span class="menu-events">&nbsp;</span><?php __('menuEvents'); ?></a>
		</li>
		<!-- Add new menu Customer requested songs -->
		<li <?php echo (in_array( 'controller=pjAdminCustomerRequest&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminCustomerRequest&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminCustomerRequest' ? 'menu-focus' : NULL; ?>"><span class="menu-pjAdminCustomerRequest">&nbsp;</span><?php __('menuCustomerRequest'); ?></a>
		</li>
		<!-- Add new menu Customer requested songs -->
		<li <?php echo (in_array( 'controller=pjAdminVenues&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminVenues&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminVenues' ? 'menu-focus' : NULL; ?>"><span class="menu-venues">&nbsp;</span><?php __('menuVenues'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminImageGallery&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminImageGallery&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminImageGallery' ? 'menu-focus' : NULL; ?>"><span class="menu-venues">&nbsp;</span>Image Gallery</a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminSlider&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminSlider&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminSlider' ? 'menu-focus' : NULL; ?>"><span class="menu-venues">&nbsp;</span><?php __('menuSlider'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminSponsors&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminSponsors&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminSponsors' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuSponsor'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminGroups&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminGroups&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminGroups' ? 'menu-focus' : NULL; ?>"><span class="menu-groups">&nbsp;</span><?php __('menuGroups'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminSubscribers&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminSubscribers&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminSubscribers' ? 'menu-focus' : NULL; ?>"><span class="menu-subscribers">&nbsp;</span><?php __('menuSubscriber'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminMessages&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminMessages&action=pjActionIndex" class="<?php echo ($_GET['controller'] == 'pjAdminMessages' && $_GET['action'] != 'pjActionSend') ? 'menu-focus' : NULL; ?>"><span class="menu-messages">&nbsp;</span><?php __('menuMessages'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminCms&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminCms&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminCms' ? 'menu-focus' : NULL; ?>"><span class="menu-venues">&nbsp;</span><?php __('menuCms'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminAdvertisements&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminAdvertisements&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminAdvertisements' ? 'menu-focus' : NULL; ?>"><span class="menu-venues">&nbsp;</span><?php __('menuAdvertisement'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminVideo&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminVideo&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminVideo' ? 'menu-focus' : NULL; ?>"><span class="menu-events">&nbsp;</span><?php __('menuVideo'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminOptions&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminOptions&action=pjActionIndex" class="<?php echo ($_GET['controller'] == 'pjAdminOptions' && in_array($_GET['action'], array('pjActionIndex', 'pjActionBooking', 'pjActionNotification', 'pjActionBookingForm', 'pjActionTicket', 'pjActionTerm'))) || in_array($_GET['controller'], array('pjAdminLocales', 'pjBackup', 'pjLocale', 'pjSms')) || ($_GET['controller'] == 'pjInvoice' && $_GET['action'] == 'pjActionIndex') ? 'menu-focus' : NULL; ?>"><span class="menu-options">&nbsp;</span><?php __('menuOptions'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminCustomers&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminCustomers&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminCustomers' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuCustomers'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdminUsers&action=pjActionIndex', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminUsers&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminUsers' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuUsers'); ?></a>
		</li>
		<li <?php echo (in_array( 'controller=pjAdmin&action=pjActionProfile', App::getUserRoles())) ? "style=display:block" : "style=display:none;"?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdmin&action=pjActionProfile" class="<?php echo $_GET['controller'] == 'pjAdmin' && $_GET['action'] == 'pjActionProfile' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuProfile'); ?></a>
		</li>
		<?php } else { 
			//this section is super admin part
			// is_superadmin = true;
			?>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdmin&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdmin' && $_GET['action'] == 'pjActionIndex' ? 'menu-focus' : NULL; ?>"><span class="menu-dashboard">&nbsp;</span><?php __('menuDashboard'); ?></a>
		</li>
		
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminSchedule&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminSchedule' ? 'menu-focus' : NULL; ?>"><span class="menu-schedule">&nbsp;</span><?php __('menuSchedule'); ?></a>
		</li>
		
		

		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&action=pjActionIndex" class="<?php echo ($_GET['controller'] == 'pjAdminBookings' || ($_GET['controller'] == 'pjInvoice' && $_GET['action'] != 'pjActionIndex')) ? 'menu-focus' : NULL; ?>"><span class="menu-bookings">&nbsp;</span><?php __('menuBookings'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminArtists&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminArtists' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuArtist'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminEvents&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminEvents' ? 'menu-focus' : NULL; ?>"><span class="menu-events">&nbsp;</span><?php __('menuEvents'); ?></a>
		</li>
		<!-- Add new menu Customer requested songs -->
	
		<!-- <li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminCustomerRequest&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminCustomerRequest' ? 'menu-focus' : NULL; ?>"><span class="menu-pjAdminCustomerRequest">&nbsp;</span><?php __('menuCustomerRequest'); ?></a>
		</li> -->
		<!-- Add new menu Customer requested songs -->
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminVenues&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminVenues' ? 'menu-focus' : NULL; ?>"><span class="menu-venues">&nbsp;</span><?php __('menuVenues'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminImageGallery&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminImageGallery' ? 'menu-focus' : NULL; ?>"><span class="menu-venues">&nbsp;</span>Image Gallery</a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminSlider&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminSlider' ? 'menu-focus' : NULL; ?>"><span class="menu-venues">&nbsp;</span><?php __('menuSlider'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminSponsors&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminSponsors' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuSponsor'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminGroups&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminGroups' ? 'menu-focus' : NULL; ?>"><span class="menu-groups">&nbsp;</span><?php __('menuGroups'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminSubscribers&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminSubscribers' ? 'menu-focus' : NULL; ?>"><span class="menu-subscribers">&nbsp;</span><?php __('menuSubscriber'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminMessages&action=pjActionIndex" class="<?php echo ($_GET['controller'] == 'pjAdminMessages' && $_GET['action'] != 'pjActionSend') ? 'menu-focus' : NULL; ?>"><span class="menu-messages">&nbsp;</span><?php __('menuMessages'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminCms&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminCms' ? 'menu-focus' : NULL; ?>"><span class="menu-venues">&nbsp;</span><?php __('menuCms'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminAdvertisements&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminAdvertisements' ? 'menu-focus' : NULL; ?>"><span class="menu-venues">&nbsp;</span><?php __('menuAdvertisement'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminVideo&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminVideo' ? 'menu-focus' : NULL; ?>"><span class="menu-events">&nbsp;</span><?php __('menuVideo'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminOptions&action=pjActionIndex" class="<?php echo ($_GET['controller'] == 'pjAdminOptions' && in_array($_GET['action'], array('pjActionIndex', 'pjActionBooking', 'pjActionNotification', 'pjActionBookingForm', 'pjActionTicket', 'pjActionTerm'))) || in_array($_GET['controller'], array('pjAdminLocales', 'pjBackup', 'pjLocale', 'pjSms')) || ($_GET['controller'] == 'pjInvoice' && $_GET['action'] == 'pjActionIndex') ? 'menu-focus' : NULL; ?>"><span class="menu-options">&nbsp;</span><?php __('menuOptions'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminCustomers&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminCustomers' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuCustomers'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminUsers&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminUsers' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuUsers'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdmin&action=pjActionProfile" class="<?php echo $_GET['controller'] == 'pjAdmin' && $_GET['action'] == 'pjActionProfile' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuProfile'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminRoleAcl&action=pjActionIndex" class="<?php echo $_GET['controller'] == 'pjAdminRoleAcl' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuPrivilege');?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjInvoice&action=pjActionInvoices" class="<?php echo $_GET['controller'] == 'pjInvoice' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span><?php __('menuInvoice');?></a>
		</li>
		<?php } ?>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdmin&action=pjActionLogout"><span class="menu-logout">&nbsp;</span><?php __('menuLogout'); ?></a>
		</li>
		<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminReports&action=pjActionDashboard"><span class="menu-logout">&nbsp;</span><?php __('menuReports'); ?></a>
		</li>
		<li class="dropdown">
			<a href="javascript:;" onclick="myFunction()" class="dropbtn"><span class="menu-schedule">&nbsp;</span> Garbage Recrod <i class="fa fa-angle-down" aria-hidden="true"></i></a>
			<ul id="myDropdown" class="dropdown-content">
				<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminArtists&action=pjActionDeletedArtistView&viewGarbageRecord=1" class="<?php echo $_GET['controller'] == 'pjAdminArtists' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span>Artist</a></li>
				<li><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminEvents&action=pjAdminEvents&viewGarbageRecord=1" class="<?php echo $_GET['controller'] == 'pjAdminArtists' ? 'menu-focus' : NULL; ?>"><span class="menu-users">&nbsp;</span>Events</a></li>
			</ul>
		</li>

	</ul>
</div>
<div class="leftmenu-bottom"></div>