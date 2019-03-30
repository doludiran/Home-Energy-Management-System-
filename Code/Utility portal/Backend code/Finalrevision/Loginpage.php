<?php require_once("inc/header.php"); ?> 
   <div class="container">
     <article>
       <h3 class="page_breadcrumb">Login</h3> 
       <div class="clear">
           <?php
               if( $_SESSION['err_mess'] != '' ){
                    echo '<span class="err_mess">'.$_SESSION['err_mess'].'</span>';
                    $_SESSION['err_mess'] = '';
               }
           ?>
       
           <?php
               if( $_SESSION['succ_mess'] != '' ){
                    echo $_SESSION['succ_mess'];
                    echo '<span class="succ_msg">'.$_SESSION['succ_mess'].'</span>';
                    $_SESSION['succ_mess'] = '';
               }
           ?>
       </div>  
       <br />  
       <form id="SignUp" method="post"> 
           <table class="my_table">
                 <tr><td></td><td><label id="uname_msg" class="err_msg"></label></td></tr> 
                 <tr><td>Username: </td><td> <input type="text" name="uname" size="30" /></td></tr>
                 <tr><td></td><td><label id="pswd_msg" class="err_msg"></label></td></tr> 
                 <tr><td>Password: </td><td> <input type="password" name="pswd" size="30" /></td></tr>      
             </table>
             <p><input class="button_prim" type="submit" name="login_submit"  value="Login" />
              <input class="button_prim" type="reset"  value="Reset" /></p>
         </form>  
        </article>
    </div>
<?php require_once("inc/footer.php"); ?>