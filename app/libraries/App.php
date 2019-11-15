<?php
if (!defined("ROOT_PATH")) {
    header("HTTP/1.1 403 Forbidden");
    exit;
}

class App {

    public static function setSession($key, $value) {
        if(isset($key)) $_SESSION[$key] = $value;
    }
    public static function getSession($key) {
        if(isset($key)) return $_SESSION[$key];
        
    }
    public static function getRoleId() {
        return self::getSession('role_id');
    }

    public static function isSuperAdmin() {
        if(self::getSession('is_superadmin')) { 
            return true;
        } 
        return false;
    }

    public static function printSession() {
        echo "<pre>";
        print_r($_SESSION);
    }
    public static function dd($data, $exit = true) {
        echo "<pre>";
        print_r($data);
        if($exit) exit; 
    }
    public static function getUserRoles() {
        $roles = array();
        if(self::getSession('roles')) { 
            foreach(self::getSession('roles') as $role) {
                $roles[] = $role['path'];
            }
        } 
        return $roles;
    }
    public static function getUserRoleControllers() {
        $controllers = array();
        if(self::getSession('roles')) { 
            foreach(self::getSession('roles') as $role) {
                $controllers[] = $role['controller'];
            }
        } 
        return $controllers;
    }
    public static function getQueryString() {
        return (isset($_SERVER['QUERY_STRING'])) ? $_SERVER['QUERY_STRING'] : '';
    }

    public static function getController() {
        return $_GET['controller'];
    }
    public static function isView()
    {
        if (self::isSuperAdmin()) {
            return true;
        }

        $controllers = self::getUserRoleControllers();
        // echo "<pre>";
        // print_r($controllers);
        foreach ($controllers as $v) {
            if ($v == self::getController()) {
                return (bool) $v['is_visible'];
            }
        }
    }

    public static function isCart() {
        $CI =& get_instance();
        $CI->load->library('cart');
        if(count($CI->cart->contents()) >0) {
            return TRUE;
        }
        return FALSE;
    }

   public static function setMapHolderWidth($mapHolderWidth) {
       self::setSession('mapHolderWidth', $mapHolderWidth);
       return $this;
   }
   public static function getMapHolderWidth() {
       return self::getSession('mapHolderWidth');
   }
   public static function setMapHolderHeight($mapHolderHeight) {
        self::setSession('mapHolderHeight', $mapHolderHeight);
        return $this;
   }
   public static function getMapHolderHeight() {
     return self::getSession('mapHolderHeight');
   }
}