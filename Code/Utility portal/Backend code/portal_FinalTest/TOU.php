<?php include_once("inc/header.php"); 
if( $_SESSION['user'] == '' ){
   header('LOCATION:Loginpage.php');
   exit; 
}
?>
    
    <h3 class="page_breadcrumb">Time of Use</h3>
            
    <div class="container">
        
        <h3 class="content_title">Add Time of Use</h3>
        
        <form id="TOU"  method="post" enctype="multipart/form-data">
                
                <table class="my_table">
                    <tr><td></td><td><label id="tou_msg" class="err_msg"></label></td></tr> 
                    <tr><td>TOU Effective From: </td><td> <input type="text" placeholder="YYYY-MM-DD" name="from" size="30" required/></td></tr>
                      
                    <tr><td></td><td><label id="todate_msg" class="err_msg"></label></td></tr> 
                    <tr><td>To: </td><td> <input type="text" placeholder="YYYY-MM-DD" name="to" size="30" required/></td></tr>
                </table>
                 
               <table class="my_table">      
                    <tr><td></td><td><label id="fromtime_msg" class="err_msg"></label></td></tr> 
                    <tr><td>Time of Day From :</td>
                      
                       <td> 
                        <input type="number" placeholder="HH"  min = "0" max = "23" name="timeofdayfromH1" required/>
                        <input type="number" placeholder="MM" max = "60" min = "0" step="15" name="timeofdayfromM1" required/>
                        <input type="number" placeholder="SS" max = "60" min = "0" name="timeofdayfromS1" required/>
                      </td>
                  </tr>  
                     
                    <tr><td></td><td><label id="totime_msg" class="err_msg"></label></td></tr> 
                    <tr><td>To :</td>
                     <td> 
                      <input type="number" placeholder="HH" max = "23" min = "0" name="timeofdayToH1" required/>
                       <input type="number" placeholder="MM" max = "60" min = "0" step="15" name="timeofdayToM1" required/>
                       <input type="number" placeholder="SS" max = "60" min = "0" name="timeofdayToS1" required/>
                       </td>
                  </tr>  
                      
                    <tr><td></td><td><label id="touperiod_msg" class="err_msg"></label></td></tr> 
                    <tr>
                        <td>TOU Period:</td> 
                        <td>
                            <select name="touperiod1">
                                <option value="ON-Peak">ON-Peak</option>
                                <option value="OFF-Peak">OFF-Peak</option>
                                <option value="MID-Peak">MID-Peak</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td>TOU Price:</td><td> <input type="number" min="0" step ="0.01" placeholder="$" name="touprice1" size="30" required/></td></tr>
                    <tr><td colspan="2" class="padd_special"><a class="button_small addfield">Add new record</a></td><td></td></tr>
                </table>
                
                <div class="form_wrapper"></div>
          
                <br /><br />
                
                <input type="hidden" name="total_rows" id="total_rows" value="1"/>
                <p><input class="button_prim" type="submit" value="submit" name="tou_submit" />
         
            </form>
        
        </div>
        
<script src="js/min.js"></script>
<script>
    $(function(){
        var scntDiv = jQuery('.form_wrapper');
        var i = 2;
        
        jQuery(document.body).on('click', '.publish_it', function() {
            jQuery('#publish').click();
        })
        
        jQuery(document.body).on('click', '.addfield', function() {
                jQuery('<table  class="form_wrapper my_table">'+
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