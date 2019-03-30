<?php
session_start();
$_SESSION['user']    = '';
$_SESSION['user_id'] = '';

header('LOCATION:Loginpage.php');
exit;