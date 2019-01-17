// function to validate username and password in Login page (Login form)
function LoginForm(event){
 var elements = event.currentTarget;

  //declare variables for username and password  
    var uname = elements[0].value;
    var pswd = elements[1].value;
     
  var result = true;  
    //declare variables for valid input in regular expression for username and password
    var uname_v = /^[a-zA-Z0-9_-]+$/;
    var pswd_v = /((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,})/;
  
  // initialize uname_msg and password_msg 
    document.getElementById("uname_msg").innerHTML ="";
    document.getElementById("pswd_msg").innerHTML ="";
  
  // user name canot be empty or worng format, error message displays above email field in red color
    if (uname==null || uname==""||!uname_v.test(uname))
     
     {	   
	   document.getElementById("uname_msg").innerHTML="No spaces or other non-word characters ";
          result = false;
        }
  
  
   // code here to validate password
    if (pswd==null || pswd==""||!pswd_v.test(pswd)|| pswd.length <8 )
        {	   
	   document.getElementById("pswd_msg").innerHTML="Password should be 8 characters or longer, at least one non-letter character,atleast one capital letter one small and one digit";
           result = false;
        }
  
  //prevent form to be submitted if one of above field is invalid		
  if(result == false )
       {    
           event.preventDefault();
        }

  
}
function ResetForm(event)
{
    document.getElementById("uname_msg").innerHTML ="";
    document.getElementById("pswd_msg").innerHTML ="";
   alert("hello");
}

//..........................................
function TOUForm(event){
 
    var elements  = event.currentTarget;
    var effectivedate = elements[0].value;
   // var effective_date_to  = elements[1].value;
   // var time_of_day_from  = elements[2].value;
   // var time_of_day_to = elements[3].value;
   // var tou_period = elements[4].value;
   // var tou_price = elements[5].value;
  
     var result = true; 
   
   
    var effectivedate_v =/^[0-9]{4}([- /.])(((0[13578]|(10|12))\1(0[1-9]|[1-2][0-9]|3[0-1]))|(02\1(0[1-9]|[1-2][0-9]))|((0[469]|11)\1(0[1-9]|[1-2][0-9]|30)))$/ ;
   
  // initialize uname_msg, password_msg , pswdr_msg,name,email_msg,and bday,
    document.getElementById("tou_msg").innerHTML ="";
    
   
  // user name canot be empty or worng format, error message displays above email field in red color
  if (effectivedate==null || effectivedate==""||!effectivedate_v.test(effectivedate))
     
     {	   
	   document.getElementById("tou_msg").innerHTML="No spaces or other non-word characters ";
           result = false;
        }
  
 
   
        
    if(result == false ){    
        event.preventDefault();
    }
}
//.................................
function removeTag(elem){
    var noTag = elem.value.replace(/<[^>]+>/ig, '')
    elem.value = noTag;
}


//...................................
function commentForm(elem){
   var commentElem = document.getElementById("comment");
   if( elem.value == 'Disable' ){
       elem.value = 'Active';
       commentElem.value = 'Please login first';
       commentElem.readOnly = true;
   }else{
       elem.value = 'Disable';
       commentElem.value = '';
       commentElem.readOnly = false;
   }
}

function countChars(){
    var limit = 250;
    var commentElem = document.getElementById("comment");
    var countElem   = document.getElementById('char_count');
  var count = commentElem.value.length; 
    if( limit >= count ){
        countElem.innerHTML = (limit-count)+' character(s) left';    
    }else{
        countElem.innerHTML = '250 characters limit exceeded';
    }
    
    var curseWords = ["crap", "ugly", "brat", "basterddouch", "fuck", "asshole"];
    var filtered   = curseWordFilter(commentElem.value, curseWords);
    commentElem.value = filtered;
}

function curseWordFilter(string, filters) {
    var regex = new RegExp(filters.join("|"), "gi");
    return string.replace(regex, function (match) {
        var stars = '';
        for (var i = 1; i < (match.length)-1; i++) {
            stars += '*';
        }
        return match[0]+''+stars+''+match[(match.length)-1];
    });
}
//...........................

