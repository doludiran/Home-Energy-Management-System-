<?php
session_start();

$uname_v = "/^[a-zA-Z0-9_-]+$/";
$pswd_v  = "/((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,})/";
$pswdr_v = "/((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,})/";
$name_v  = "/\b[A-Z][a-z]* [A-Z][a-z]*$\b/";
$email_v = "/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/"; 
$bday_v  = "/([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/";
    
    
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

function get_posts(){
    global $con;
    $post_qry = "SELECT p.*, u.user_name FROM post p 
                   JOIN cms_user u 
                   ON p.user_id = u.user_id 
                   ORDER BY p.post_id DESC 
                   LIMIT 5";
    $rs = mysqli_query( $con, $post_qry );
    return $rs;
}

function get_post_comment( $pid){
    global $con;
    $post_qry = "SELECT c.comment, c.comment_date, u.user_id, u.user_name FROM comment c 
                   JOIN cms_user u 
                   ON c.user_id = u.user_id
                   WHERE c.post_id = $pid 
                   ORDER BY c.comment_id DESC";
    $rs = mysqli_query( $con, $post_qry );
    return $rs;
}

function get_user_posts( $uid ){
    global $con;
    $post_qry = "SELECT p.*, u.user_name FROM post p 
                   JOIN cms_user u 
                   ON p.user_id = u.user_id 
                   WHERE p.user_id = $uid
                   ORDER BY p.post_id DESC 
                   LIMIT 5";
    $rs = mysqli_query( $con, $post_qry );
    return $rs;
}

function get_post_detail(){
    global $con;
    $pid = $_GET['pid'];
    $post_qry = "SELECT * FROM post WHERE post_id = $pid";
    $rs = mysqli_query( $con, $post_qry );
    return $rs;
}

function get_user_detail(){
    global $con;
    $uid = $_GET['uid'];
    $user_qry = "SELECT * FROM cms_user WHERE user_id = $uid";
    $rs = mysqli_query( $con, $user_qry );
    return $rs;
}

function get_logged_username(){
    global $con;
    if( $_SESSION['user_id'] > 0 ){
        $user_qry = "SELECT user_name FROM cms_user WHERE user_id = ". $_SESSION['user_id'];
        $rs = mysqli_query( $con, $user_qry );
        $row = mysqli_fetch_array($rs);
        return $row['user_name'];
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