<?php include_once("inc/header.php"); 
if( $_SESSION['user'] == '' ){
   header('LOCATION:Loginpage.php');
   exit; 
}
?>
    
    <h3 class="page_breadcrumb">Time of Use &nbsp;&nbsp; &gt;&gt; &nbsp;&nbsp; Edit Time of Use</h3>
            
    <div class="container">
        
        <h3 class="content_title">Edit Time of Use</h3>
        
        <form id="TOU"  method="post" enctype="multipart/form-data">
                
                <?php
                    $file_name = 'tou_json/tou_json.json';
                    if( file_exists($file_name) && filesize( $file_name ) > 0 ){
                        $file = fopen( $file_name, "r" );
                        $content = fread( $file, filesize($file_name) );
                        $content_arr = json_decode($content);
                          $cnt = 0; 
                          $nm = 0; 
                          foreach( $content_arr[0] as $arr => $obj ){
                              $on_peak_sel = $off_peak_sel = $mid_peak_sel = '';
                              $arr = get_object_vars($obj );
                              if( $cnt == 0 ){
                                $eff_from = $arr['TOU Effective From'];
                                $eff_to   = $arr['TOU Effective To'];
                                echo '<table class="my_table">
                                         <tr><td></td><td><label id="tou_msg" class="err_msg"></label></td></tr> 
                                         <tr><td>TOU Effective From: </td><td> <input type="text" placeholder="YYYY-MM-DD" name="from" size="30" value="'.$eff_from.'" required/></td></tr>
                                          
                                         <tr><td></td><td><label id="todate_msg" class="err_msg"></label></td></tr> 
                                         <tr><td>To: </td><td> <input type="text" placeholder="YYYY-MM-DD" name="to"  value="'.$eff_to.'" size="30" required/></td></tr>
                                      </table>';
                              }else{
                              
                                  $get_data   = get_object_vars($content_arr[0][$cnt]);
                                  $tou_from   = $get_data['TOU From'];
                                  $tou_to     = $get_data['TOU To'];
                                  $tou_period = $get_data['TOU Period'];
                                  $tou_price  = $get_data['TOU Price'];
                                  
                                  if( $tou_period == 'ON-Peak' )  $on_peak_sel = "selected='selected'";
                                  if( $tou_period == 'OFF-Peak' ) $off_peak_sel = "selected='selected'";
                                  if( $tou_period == 'MID-Peak' ) $mid_peak_sel = "selected='selected'";
                                  
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
                                                <input type="number" placeholder="HH"  min = "0" value = "'.$tou_from_arr[0].'" max = "23" name="timeofdayfromH'.$nm.'" required/>
                                                <input type="number" placeholder="MM" max = "60" value = "'.$tou_from_arr[1].'" min = "0" step="15" name="timeofdayfromM'.$nm.'" required/>
                                                <input type="number" placeholder="SS" max = "60" value = "'.$tou_from_arr[2].'" min = "0" name="timeofdayfromS'.$nm.'" required/>
                                              </td>
                                            </tr>  
                                             
                                            <tr><td></td><td><label id="totime_msg" class="err_msg"></label></td></tr> 
                                            <tr><td>To :</td>
                                             <td> 
                                              <input type="number" placeholder="HH" max = "23" value = "'.$tou_to_arr[0].'" min = "0" name="timeofdayToH'.$nm.'" required/>
                                               <input type="number" placeholder="MM" max = "60" value = "'.$tou_to_arr[1].'" min = "0" step="15" name="timeofdayToM'.$nm.'" required/>
                                               <input type="number" placeholder="SS" max = "60" value = "'.$tou_to_arr[2].'" min = "0" name="timeofdayToS'.$nm.'" required/>
                                               </td>
                                            </tr>  
                                              
                                            <tr><td></td><td><label id="touperiod_msg" class="err_msg"></label></td></tr> 
                                            <tr>
                                                <td>TOU Period:</td> 
                                                <td>
                                                    <select name="touperiod'.$nm.'">
                                                        <option '.$on_peak_sel.' value="ON-Peak">ON-Peak</option>
                                                        <option '.$off_peak_sel.' value="OFF-Peak">OFF-Peak</option>
                                                        <option '.$mid_peak_sel.' value="MID-Peak">MID-Peak</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr><td>TOU Price:</td><td> <input min="0" value ="'.$tou_price.'" type="number" step ="0.01" placeholder="$" name="touprice'.$nm.'" size="30" required/></td></tr>
                                        </table>';
                              }
                                    $cnt++;
                                    $nm++;
                          }
                          echo '<table><tr><td colspan="2" class="padd_special"><a class="button_small addfield">Add new record</a></td><td></td></tr></table><br />';
                    }
                ?>
                
                <div class="form_wrapper"></div>
          
                <br /><br />
                
                <input type="hidden" name="total_rows" id="total_rows" value="<?php echo $cnt-1; ?>"/>
                <p><input class="button_prim" type="submit" value="update" name="tou_submit" />
         
            </form>
        
        </div>
<script src="js/min.js"></script>
<script>
    $(function(){
        var scntDiv = jQuery('.form_wrapper');
        var i = <?php echo $cnt; ?>;
        
        jQuery(document.body).on('click', '.publish_it', function() {
            jQuery('#publish').click();
        })
        
        jQuery(document.body).on('click', '.addfield', function() {
                jQuery('<table  class="my_table my_tableform_wrapper">'+
                            '<tr><td></td><td><label id="fromtime_msg" class="err_msg"></label></td></tr> '+
                            '<tr><td>Time of Day From :</td>'+
                       '<td>'+ 
                       '<input type="number"placeholder="HH" max ="23" min ="0" name="timeofdayfromH'+i+'" size="30" required />'+
                       '<input type="number"placeholder="MM" max="60" min ="0" step ="15" name="timeofdayfromM'+i+'" size="30" required />'+
                       '<input type="number"placeholder="SS" max ="60" min ="0" name="timeofdayfromS'+i+'" size="30" required />'+
                       '</td></tr>'+  
                             
                            '<tr><td></td><td><label id="totime_msg" class="err_msg"></label></td></tr> '+
                            '<tr><td>To :</td>'+
                       '<td>'+
                       '<input type="number"placeholder="HH" max ="23" min ="0" name="timeofdayToH'+i+'" size="30" required />'+
                       '<input type="number"placeholder="MM" max ="60" min ="0" step ="15" name="timeofdayToM'+i+'" size="30" required />'+
                       '<input type="number"placeholder="SS" max = "60" min =0" name="timeofdayToS'+i+'" size="30" required />'+
                       '</td></tr>'+  
                              
                            '<tr><td></td><td><label id="touperiod_msg" class="err_msg"></label></td></tr>'+ 
                            '<tr>'+
                                '<td>TOU Period:</td>'+ 
                                '<td>'+
                                    '<select name="touperiod'+i+'">'+
                                        '<option value="ON-Peak">ON-Peak</option>'+
                                        '<option value="OFF-Peak">OFF-Peak</option>'+
                                        '<option value="MID-Peak">MID-Peak</option>'+
                                    '</select>'+
                                '</td>'+
                            '</tr>'+
                            '<tr><td>TOU Price:</td><td> <input min="0" step ="0.01" type="number"placeholder="$" name="touprice'+i+'" size="30" required/></td></tr>'+
                            '<tr>'+
                                '<td class="padd_special"><a class="button_small addfield">Add new record</a>&nbsp;&nbsp;&nbsp;</td>'+
                                '<td class="padd_special"><a class="button_red_small remfield">Remove</a>&nbsp;&nbsp;&nbsp;</td>'+
                            '</tr>'+
                        '</table>').appendTo(scntDiv);
                i++;
                jQuery('#total_rows').val(i-1);
                return false;
        });
        
        jQuery(document.body).on('click', '.remfield' ,function() {
                var cnfrm = confirm('Are you sure');
                if( cnfrm ){
                    jQuery(this).parent().parent().parent().parent('table').remove();
                    i--;
                    jQuery('#total_rows').val(i-1);
                }
                return false;
        });
    })
</script>
<script> document.getElementById("TOU").addEventListener("submit", TOUForm, false)</script>            
<?php include_once("inc/footer.php"); ?>        