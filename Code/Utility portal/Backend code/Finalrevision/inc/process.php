<?php
session_start();

$uname_v = "/^[a-zA-Z0-9_-]+$/";
$pswd_v  = "/((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,})/";
$pswdr_v = "/((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,})/";
$name_v  = "/\b[A-Z][a-z]* [A-Z][a-z]*$\b/";
// handle TOU submit
if( isset( $_POST['tou_submit'] ) ){
    
    $total_rows = $_POST['total_rows'];
    $arr[]= array('TOU Effective From'.$i => $_POST['from'],
                  'TOU Effective To'.$i   => $_POST['to']);
    
    for( $i = 1; $i <= $total_rows; $i++ ){
        $arr[] = array( 'TOU From'   => $_POST['timeofdayfromH'.$i].':'.$_POST['timeofdayfromM'.$i].':'.$_POST['timeofdayfromS'.$i],
                        'TOU To'     => $_POST['timeofdayToH'.$i].':'.$_POST['timeofdayToM'.$i].':'.$_POST['timeofdayToS'.$i],
                        'TOU Period' => $_POST['touperiod'.$i],
                        'TOU Price'  => $_POST['touprice'.$i],
                      );
    }
    
    $err_msg = '';
        
    if( $err_msg == '' ){               
        $array = $arr;
        $array_json = json_encode( $array );
        
        $file_name = 'tou_json/tou_json.json';
        $array_json = '[' . $array_json . ']';
        
        $json_file = fopen( $file_name, 'w' );
        fwrite( $json_file, $array_json );
        fclose( $json_file );
        
        $_SESSION['succ_mess'] = "Time of Use added succssfully!";
        header('LOCATION:index.php');
        exit;
    }else{
        $_SESSION['err_mess'] = $err_msg;
        header('LOCATION:TOU.php');
        exit;    
    }
}

// handle login
if( isset( $_POST['login_submit'] ) ){
    $uname = $_POST['uname'];
    $pswd  = $_POST['pswd'];

    if( $uname == 'admin' && $pswd == 'Admin123!' ){
        $_SESSION['user']    = 'admin';
        $_SESSION['user_id'] = 1;
        
        header('LOCATION:index.php');
        exit;
           
    }else{
        $_SESSION['err_mess'] = 'Username/Password is incorrect';
    }
}


function upload_image( $tmp_name, $name, $path ){
    if( $tmp_name != '' ){
        $target_file = $path.basename($name);
        move_uploaded_file($tmp_name, $target_file);
        return $target_file;
    }else{
        return '';
    }
}