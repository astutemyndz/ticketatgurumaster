<?php

defined('BASEPATH') OR exit('No direct script access allowed');



/*

| -------------------------------------------------------------------------

| URI ROUTING

| -------------------------------------------------------------------------

| This file lets you re-map URI requests to specific controller functions.

|

| Typically there is a one-to-one relationship between a URL string

| and its corresponding controller class/method. The segments in a

| URL normally follow this pattern:

|

|	example.com/class/method/id/

|

| In some instances, however, you may want to remap this relationship

| so that a different class/function is called than the one

| corresponding to the URL.

|

| Please see the user guide for complete details:

|

|	https://codeigniter.com/user_guide/general/routing.html

|

| -------------------------------------------------------------------------

| RESERVED ROUTES

| -------------------------------------------------------------------------

|

| There are three reserved routes:

|

|	$route['default_controller'] = 'welcome';

|

| This route indicates which controller class should be loaded if the

| URI contains no data. In the above example, the "welcome" class

| would be loaded.

|

|	$route['404_override'] = 'errors/page_missing';

|

| This route will tell the Router which controller/method to use if those

| provided in the URL cannot be matched to a valid route.

|

|	$route['translate_uri_dashes'] = FALSE;

|

| This is not exactly a route, but allows you to automatically route

| controller and method names that contain dashes. '-' isn't a valid

| class or method name character, so it requires translation.

| When you set this option to TRUE, it will replace ALL dashes in the

| controller and method URI segments.

|

| Examples:	my-controller/index	-> my_controller/index

|		my-controller/my-method	-> my_controller/my_method

*/

$route['default_controller'] = 'HomeController/index';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
$route['ajaxCity'] = 'home/ajaxCity';
$route['location'] = 'home/location';
$route['admin'] = 'login';
$route['admin/login'] = 'login';
$route['admin/logout'] = 'logout';
$route['job/(:any)'] = 'job/listings';







$route['event/details/(:any)'] = 'EventController/pjActionDetails/$1';
$route['event/pjActionSeatsAjax'] = 'EventController/pjActionSeatsAjax';
$route['event/pjActionSaveSeats'] = 'EventController/pjActionSaveSeats';

$route['event/cart'] = 'EventController/pjActionCart';
$route['event/list'] = 'EventController/eventList';
$route['gallery'] = 'HomeController/gallery';
$route['partners'] = 'EventController/partnersList';
$route['contact-us'] = 'ContactController';
$route['about-us'] = 'ContactController/about_us';
$route['terms-conditions'] = 'ContactController/terms_conditions';
$route['privacy-policy'] = 'ContactController/privacy_policy';




$route['event/seats']           = 'EventController/pjActionSeats';
//$route['event/(:any)'] = ''
$route['welcome']               = 'welcome';

$route['set'] = 'EventController/setSessionData';
$route['get'] = 'EventController/getSessionData';


//Get Login Form
$route['auth/login'] = 'AuthController/pjAuthForm';
// Post Login
$route['auth/login/post'] = 'AuthController/login';

//Post Logout 
$route['auth/logout'] = 'AuthController/logout';

// Post Register
$route['auth/register/post'] = 'AuthController/register';


$route['account']           = 'AccountController/pjAccountForm';
$route['cart']              = 'CartController';
$route['cart/checkout']     = 'CartController/pjActionCheckout';
$route['cart/post/checkout']     = 'CartController/pjActionPostCheckout';
$route['pjActionCart']      = 'CartController/pjActionCart';
$route['loadCartPage']      = 'CartController/loadCartPage';
$route['updateCartPini']    = 'CartController/updateCartPini';
$route['cart/empty']        = 'CartController/pjActionCartEmpty';

/**
 * @method GET
 */
$route['pjActionLoadMap']   = 'CartController/pjActionLoadMap';
/**
 * @method POST
 */
$route['pjActionCart']      = 'CartController/pjActionCart';
$route['loadCart']      = 'CartController/loadCart';
$route['loadCartSummery']      = 'CartController/loadCartSummery';
$route['cart/remove']      = 'CartController/removeCartItemOnClickEventListener';

$route['cart/checkout'] = 'CartController/checkout';

$route['paypal/pay/credit-card'] = 'PayPalPaymentController/payWithCreditCard';
$route['payment/status'] = 'PayPalPaymentController/paymentStatus';

$route['paypal/pay/success'] = 'PayPalPaymentController/success';
$route['paypal/pay/failed'] = 'PayPalPaymentController/failed';


$route['session/empty'] = 'AuthController/emptySession';

$route['location/countries'] = 'LocationController/countries';

$route['session'] = 'LocationController/session';
$route['location/states'] = 'LocationController/states';
$route['location/cities'] = 'LocationController/cities';


$route['sendMailWithAttachmentTicket'] = 'PayPalPaymentController/sendMailWithAttachmentTicket';


$route['marks'] = 'ApiController/marks';
$route['api/v1/users'] = 'ApiController/users';
$route['api/v1/reports'] = 'ApiController/reports';
$route['api/v1/reportByDayPerUser'] = 'ApiController/reportByDayPerUser';


$route['events'] = 'EventController/index';
$route['event/(:any)'] = 'EventController/show';
$route['search'] = 'EventController/search';

// Get Request
$route['auth/reset_password/(:any)'] = 'AuthController/render_reset_password/$1';

// Post Request
$route['auth/change_password'] = 'AuthController/change_password';
//$route['search'] = 'ApiController/events';
/**
 * @desc Api URLS
 */
$route['api/v0.1.0/events'] = 'ApiController/events';
$route['api/v0.1.0/events/(:any)'] = 'ApiController/events';
$route['api/v0.1.0/events/type/(:num)'] = 'ApiController/events';
$route['api/v0.1.0/autocompleteEventHandler'] = 'ApiController/autocompleteEventHandler';
$route['api/v0.1.0/sponsors'] = 'ApiController/sponsors';
$route['api/v0.1.0/gallery'] = 'ApiController/gallery';

$route['api/v0.1.0/auth/register'] = 'AuthController/register';
$route['api/v0.1.0/auth/login'] = 'AuthController/login';
$route['api/v0.1.0/auth/forgot_password'] = 'AuthController/forgot_password';
$route['api/v0.1.0/auth/logout'] = 'AuthController/logout';

$route['api/v0.1.0/user/(:num)'] = 'AuthController/getUser';
$route['api/v0.1.0/user'] = 'AuthController/updateUser';


$route['api/v0.1.0/map/venue-created'] = 'ApiController/venueCreated';
$route['api/v0.1.0/map/venue/(:num)'] = 'ApiController/getVenueByMapId';

