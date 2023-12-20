<?php
// Include Composer's autoloader
require_once __DIR__ . '/vendor/autoload.php';

// Use the Hello class from the Silarhi namespace
use Silarhi\Hello;

// Create an instance of the Hello class
$hello = new Hello();

// Call the display method and output its result
echo $hello->display() . "\n";

