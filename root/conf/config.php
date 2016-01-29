<?php

$debug = true;
if ($debug) {
	ini_set('display_errors', 1);
	error_reporting(E_ALL);
	ini_set('xdebug.default_enable', 1);
	ini_set('xdebug.force_display_errors', 1);
	ini_set('xdebug.force_error_reporting', 1);
	xdebug_enable();
}

// System constants
define("CLASS_ROOT", $_SERVER['DOCUMENT_ROOT'] . "/../app/");


// Load the composer autoloaders
if (file_exists('../vendor/autoload.php')) {
    require_once('../vendor/autoload.php');
} else {
    die("You're going to want to run `composer install` to set up the autoloader.");
}


// Basic dump function.
function dump($data, $fail = false) {
    echo "<pre>";
    if (is_object($data) || is_array($data)) {
        print_r($data);
    } else {
        var_dump($data);
    }
    echo "</pre>";
    if ($fail) {
        exit();
    }
}
