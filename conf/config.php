<?php

// System constants
define("CLASS_ROOT", $_SERVER['DOCUMENT_ROOT'] . "../app/");

// Register the default autoloader
spl_autoload_register("primary_autoloader");

// Default autoloader
function primary_autoloader($class) {
    $class = ltrim($class, '\\');

    $file_name = '';
    if (strrpos($class, "\\") > 0) {
        $namespace = substr($class, 0, strrpos($class, "\\"));
        $class = substr($class, strrpos($class, "\\") + 1);
        $file_name = CLASS_ROOT . str_replace('\\', DIRECTORY_SEPARATOR, $namespace) . DIRECTORY_SEPARATOR . $class . ".php";
    } else {
        $file_name = $class . ".php";
    }

    if (file_exists($file_name)) {
        require_once $file_name;
    }
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