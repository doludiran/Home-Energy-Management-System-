<?php require_once("process.php"); ?>
<!DOCTYPE html>
    <html lang ="en">
    <head>
        <meta charset="UTF-8"/>
       <title>utility-portal </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" type="text/css"  href="css/my-style-sheet.css" />
    </head>
    <body>
        
        <div class="top_container">
            <div class="header_logo">
              <img src="image/abd.png" alt="abd company" height="150" width="150">
               
                <h2>ToU PORTAL</h2>
            </div>
                
            <nav class="header_menu">
               <ul class="main_nav">
                <?php 
                    if( $_SESSION['user'] != '' ){
                    $page_name = basename($_SERVER['PHP_SELF']);    
                ?>
            	<li><a <?php if( $page_name == 'index.php' ) echo 'class="active"'; ?> href= "index.php">Home</a></li>
            	<li><a <?php if( $page_name == 'TOU.php' || $page_name == 'TOU_edit.php' ) echo 'class="active"'; ?> href= "TOU.php">Time Of Use </a></li>
                <li><a href= "logout.php">Logout</a></li>
                <?php } ?>
              </ul>
            </nav>
            <div class="clear"></div>
        </div>