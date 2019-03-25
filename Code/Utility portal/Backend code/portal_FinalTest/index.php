<?php include_once("inc/header.php"); 
if( $_SESSION['user'] == '' ){
   header('LOCATION:Loginpage.php');
   exit; 
}
?>
        
        <h3 class="page_breadcrumb">Home</h3>
            
        <div class="container"> 
            <?php
                if( $_SESSION['succ_mess'] != '' ){
                    echo '<span class="succ_msg">'.$_SESSION['succ_mess'].'</span>';
                    $_SESSION['succ_mess'] = '';
                }
            ?>
            
            <h3 class="content_title">Time of Use</h3>
            
            <a href="TOU_edit.php"><button class="button_prim">Edit</button></a><br /><br />
            <?php
                $file_name = 'tou_json/tou_json.json';
                if( file_exists($file_name) && filesize( $file_name ) > 0 ){
                    $file = fopen( $file_name, "r" );
                    $content = fread( $file, filesize($file_name) );
                    $content_arr = json_decode($content);
                    $cnt = 0; 
                    $nm = 0; 
                    foreach( $content_arr[0] as $arr => $obj ){
                        $arr = get_object_vars($obj );
                        if( $cnt == 0 ){
                          $eff_from = $arr['TOU Effective From'];
                          $eff_to   = $arr['TOU Effective To'];
                          echo '<table class="my_table">
                                   <tr><td></td><td><label id="tou_msg" class="err_msg"></label></td></tr> 
                                   <tr><td>TOU Effective From: </td><td> <input type="text" disabled value="'.$eff_from.'"/></td></tr> 
                                   <tr><td>To: </td><td> <input type="text" disabled value="'.$eff_to.'"/></td></tr>
                                </table>';
                        }else{
                        
                            $get_data   = get_object_vars($content_arr[0][$cnt]);
                            $tou_from   = $get_data['TOU From'];
                            $tou_to     = $get_data['TOU To'];
                            $tou_period = $get_data['TOU Period'];
                            $tou_price  = $get_data['TOU Price'];
                              
                            if( $tou_from != '' && strstr( $tou_from, ':' ) != '' ){
                                $tou_from_arr = explode( ':', $tou_from );
                            }
                              
                            if( $tou_to != '' && strstr( $tou_to, ':' ) != '' ){
                                $tou_to_arr = explode( ':', $tou_to );
                            }
                              
                            echo '<table class="my_table">
                                      <tr><td></td><td><label id="fromtime_msg" class="err_msg"></label></td></tr> 
                                      <tr><td>Time of Day From :</td>
                                        
                                         <td> 
                                          <input disabled type="text" value = "'.$tou_from_arr[0].' : '.$tou_from_arr[1].' : '.$tou_from_arr[2].'"/>
                                        </td>
                                      </tr>  
                                          
                                      <tr><td>To :</td>
                                         <td> 
                                           <input disabled type="text" value = "'.$tou_to_arr[0].' : '.$tou_to_arr[1].' : '.$tou_to_arr[2].'"/>
                                           </td>
                                        </tr>  
     
                                      <tr>
                                            <td>TOU Period:</td> 
                                            <td><input type="text" disabled value="'.$tou_period.'"/></td>
                                      </tr>
                                      <tr><td>TOU Price:</td><td> <input disabled value ="$'.$tou_price.'" type="text"/></td></tr>
                                  </table>';
                          }
                                $cnt++;
                                $nm++;
                      }
                }
            ?>
            <a href="TOU_edit.php"><button class="button_prim">Edit</button></a>
        </div>
        <footer class="footer"></footer>
    </body>
</html>