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
	   document.getElementById("pswd_msg").innerHTML="No Script,Password should be 8 characters or longer, at least one non-letter character,atleast one capital letter one small and one digit";
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
  
}

//..........................................
function TOUForm(event){
 
    var elements  = event.currentTarget;
    var effectivedate_from = elements[0].value;
    var effective_date_to  = elements[1].value;
    var timeofday_from  = elements[2].value;
    var timeofday_to = elements[3].value;
   // var tou_period = elements[4].value;
   // var tou_price = elements[5].value;
  
     var result = true; 
   
   
  var effectivedate_v =/^[0-9]{4}([- /.])(((0[13578]|(10|12))\1(0[1-9]|[1-2][0-9]|3[0-1]))|(02\1(0[1-9]|[1-2][0-9]))|((0[469]|11)\1(0[1-9]|[1-2][0-9]|30)))$/ ;
  var effective_date_to_v=/^[0-9]{4}([- /.])(((0[13578]|(10|12))\1(0[1-9]|[1-2][0-9]|3[0-1]))|(02\1(0[1-9]|[1-2][0-9]))|((0[469]|11)\1(0[1-9]|[1-2][0-9]|30)))$/ ;
  var timeofday_from_v=/^(1[0-2]|0?[1-9]):([0-5]?[0-9])(●?[AP]M)?$/;
  var timeofday_to_v=/^(1[0-2]|0?[1-9]):([0-5]?[0-9])(●?[AP]M)?$/;
  // initialize tou_msg, todate_msg , fromtime_msg,totime_msg,
    document.getElementById("tou_msg").innerHTML ="";
    document.getElementById("todate_msg").innerHTML ="";
    document.getElementById("fromtime_msg").innerHTML ="";
    document.getElementById("totime_msg").innerHTML ="";
     document.getElementById("touperiod_msg").innerHTML ="";
   
  // user name canot be empty or worng format, error message displays above email field in red color
  if (effectivedate_from==null || effectivedate_from==""||!effectivedate_v.test(effectivedate_from))
     
     {	   
	   document.getElementById("tou_msg").innerHTML="field is empty or not in correct format";
           result = false;
        }
  
 if (effective_date_to==null || effective_date_to==""||!effective_date_to_v.test(effective_date_to))
     
     {	   
	   document.getElementById("todate_msg").innerHTML="To date field is empty or not in correct format";
           result = false;
        }
 if (timeofday_from==null || timeofday_from==""||!timeofday_from_v.test(timeofday_from))
     
     {	   
	   document.getElementById("fromtime_msg").innerHTML="From time field is empty or not in correct format";
           result = false;
        }  
 if (timeofday_to==null || timeofday_to==""||!timeofday_to_v.test(timeofday_to))
     
     {	   
	   document.getElementById("totime_msg").innerHTML="to time field is empty or not in correct format";
           result = false;
        }         
   
  
 if(document.getElementById("touperiod").selectedIndex ==-1);
   {
     document.getElementById("touperiod_msg").innerHTML="select one option";
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

