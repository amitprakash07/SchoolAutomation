function setfocus(field)
{
	document.getElementById(field).focus();
}



function isnull(field)
{
var val=document.getElementById(field).value;
	if(val.length==0)	
	{
	alert(field+" can't be null");
	//setfocus(field);
	return false;
	}
return true;
}

function validateid(field)
{
var val=document.getElementById(field).value;
var flag=true;
var splchar=('\",~,!@#$%^&*( )+=\"');
var i=0;
if(val.length!=0)
{
do
{
if (((val.charCodeAt(i)>=65) && (val.charCodeAt(i)<=90)) || (val.charCodeAt(i)==32) || ((val.charCodeAt(i)>=97) && (val.charCodeAt(i)<=123)) || (val.charCodeAt(i)==45) || (val.charCodeAt(i)==95) || ((val.charCodeAt(i)>=48) && (val.charCodeAt(i)<=57)))
{
flag=true;
}
else
{
alert("special characters "+splchar+" not allowed in "+field);
setfocus(field);
flag= false;
break;
}
i = i+1;
} while(i<val.length)
//setfocus(field);
}
return flag;
}


function issplchar(field)
{
	var val=document.getElementById(field).value;
	var s=val.toUpperCase();
	var flag=true;
	var splchar=('\"1,2,3...9,~,!@#$%^&*( )_-+=\"');
	//alert(s);
	//alert(val);
	//alert(s.charCodeAt(0));
	var i=0;
	//alert(val.length);
	do
	{
		//alert(s.charCodeAt(i));
		//alert(((val.charCodeAt(i)>'65') && (val.charCodeAt(i)<'90')));
		if (((val.charCodeAt(i)>=65) && (val.charCodeAt(i)<=90)) || (val.charCodeAt(i)==32) || ((val.charCodeAt(i)>=97) && (val.charCodeAt(i)<=123)))
		{		
			
		flag=true;
		}
		else
		{
			
			alert("special characters "+splchar+" not allowed in "+field);
			//setfocus(field);
			flag= false;
			
		break;
		}
	i = i+1;
	//alert(i);
	//alert(val.length);
	//alert(i<(val.length));
	} while(i<val.length)
	//alert(i);
	return flag;
}

	
function valid_f_m_l_name(field)
{
	var val=document.getElementById(field).value;
	var flag=true;
	//flag=isnull(field);
	//if(!flag){setfocus(field);}
	if(val.length!=0) 
	{
		//flag=isnumber(field);
		
		flag=issplchar(field);
		if(!flag) {setfocus(field);}
		
		else{
		for(i=0;i<val.length;i++)
		{	if(val.charCodeAt(i)==32)
			{
			alert("Spaces not allowed");
			flag=false;
			setfocus(field);
			break;
			}
		}   }
	
	}
			
		
		
return flag;
}



function validatetextfield(field)
{
var val=document.getElementById(field).value;
var flag=true;
if(val.length!=0)
{
flag=issplchar(field);
if(!flag){setfocus(field);}
}
return flag;
}



function validatenotnulltextfield(field)
{
var val=document.getElementById(field).value;
var flag=true;
flag=isnull(field);
if(!flag){setfocus(field);}
else{flag=validatetextfield(field);}
return flag;
}




function validatenumberfield(field)
{
	//var val=document.getElementById(field).value;
	var flag=isNaN(document.getElementById(field).value);
	if(flag==true)
	{
	alert(field+" can contain only no.");
	setfocus(field);
	return false;
	}
return true;
}


function validatenotnullnumberfield(field)
{
var val=document.getElementById(field).value;
var flag=true;
flag=isnull(field);
if(!flag){setfocus(field);}
else {flag=validatenumberfield(field);}
//if(flag){setfocus(field);}
return flag;
}



function validatephone(field)
{
var val=document.getElementById(field).value;
var flag=true;
if(val.length!=0)
{
flag=validatenumberfield(field);
if(flag)
{
if(val.length!=10)
{
alert("phone must contain only 10 numbers");
setfocus(field);
flag= false;
}
}
}
return flag;
}

function validatenotnullphone(field)
{
var val=document.getElementById(field).value;
var flag=true;
flag=isnull(field);
if(!flag){setfocus(field);}
else
{
flag=validatephone(field);
}
return flag;
}



/*function validate()
{
var i=0;
for (i=0;i<arguments.length;i++)
{
var flag;
valid_f_m_l_name(argument[0]);
valid_f_m_l_name(argument[1]);
validatenotnulltextfield(argument[2]);
validatenotnullphone(argument[3]);
}
}*/


function validateprice(field)
{
var val=document.getElementById(field).value;
var flag=true;
var splchar=('a,b,c,...,z,A,B,...,Z \",~,!@#$%^&*( )_-+=\"');
var i=0;
if(val.length!=0)
{
for(i=0;i<val.length;i++)
{
if(!(((val.charCodeAt(i)>=48) && (val.charCodeAt(i)<=57)) || (val.charCodeAt(i)==46)))
{
alert(splchar+" not allowed");
setfocus(field);
flag=false;
break;
}
}
if((val.indexOf("."))!=(val.lastIndexOf(".")))
{
alert(field+" can contain only one decimal point ");
setfocus(field);
flag=false;
}
}
return flag;
}


function validatemarks(field)
{
var val=document.getElementById(field).value;
var flag=true;
if(val.length!=0)
{
flag=isNaN(val);
if(flag)
{
alert("marks can only be number");
setfocus(field);
flag=false;
}
else
{
if(!(val>=0 && val <=100))
{
alert("marks must lie between 0 and 100");
setfocus(field);
flag=false;
}
}
}
return flag;
}




function validate()
{
var flag=false;
for (i=0;i<arguments.length;i++)
{
flag=isnull(validate.arguments[i]);
if(!flag)
{
setfocus(validate.arguments[i]);
break;
}
}

return flag;
}
var months = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var days = new Array("S", "M", "T", "W", "T", "F", "S");
today = new getToday();	
var element_id;
function getDays(month, year) 
{
	// Test for leap year when February is selected.
	if (1 == month)
		return ((0 == year % 4) && (0 != (year % 100))) ||
			(0 == year % 400) ? 29 : 28;
	else
		return daysInMonth[month];
}
function getToday()
{
	// Generate today's date.
	this.now = new Date();
	this.year = this.now.getFullYear() ; // Returned year XXXX
	this.month = this.now.getMonth();
	this.day = this.now.getDate();
}
function newCalendar() 
{
	var parseYear = parseInt(document.all.year  [document.all.year.selectedIndex].text);
	var newCal = new Date(parseYear , document.all.month.selectedIndex, 1);
	var day = -1;
	var startDay = newCal.getDay();
	var daily = 0; 
	today = new getToday(); // 1st call
	if ((today.year == newCal.getFullYear() ) &&   (today.month == newCal.getMonth()))
	   day = today.day;
	// Cache the calendar table's tBody section, dayList.
	var tableCal = document.all.calendar.tBodies.dayList;
	var intDaysInMonth =
	   getDays(newCal.getMonth(), newCal.getFullYear() );

	for (var intWeek = 0; intWeek < tableCal.rows.length;  intWeek++)
		   for (var intDay = 0;
			 intDay < tableCal.rows[intWeek].cells.length;
			 intDay++)
	 {
		  var cell = tableCal.rows[intWeek].cells[intDay];

		  // Start counting days.
		  if ((intDay == startDay) && (0 == daily))
			 daily = 1;

		  // Highlight the current day.
		  cell.style.color = (day == daily) ? "red" : "";
		  if(day == daily)
		  {
				document.all.todayday.innerText= "Today: " +  day + "/" + 
					(newCal.getMonth()+1) + "/" + newCal.getFullYear() ;
		  }
		  // Output the day number into the cell.
		  if ((daily > 0) && (daily <= intDaysInMonth))
			 cell.innerText = daily++;
		  else
			 cell.innerText = "";
	   }

}
	  
	 function getTodayDay()
	 {
			    document.all[element_id].value = today.day + "/" + (today.month+1) + 
					"/" + today.year; 
		        //document.all.calendar.style.visibility="hidden";
				document.all.calendar.style.display="none";
				document.all.year.selectedIndex =100;   
	            document.all.month.selectedIndex = today.month; 
	 }
 
        function getDate() 
		 {
            // This code executes when the user clicks on a day
            // in the calendar.
            if ("TD" == event.srcElement.tagName)
               // Test whether day is valid.
               if ("" != event.srcElement.innerText)
			   { 
				 var mn = document.all.month.selectedIndex+1;
    			 var Year = document.all.year [document.all.year.selectedIndex].text;
				 document.all[element_id].value=event.srcElement.innerText+"/"+mn +"/"  +Year;
		         //document.all.calendar.style.visibility="hidden";
				 document.all.calendar.style.display="none";
			 }
		 }
 
function GetBodyOffsetX(el_name, shift)
{
	var x;
	var y;
	x = 0;
	y = 0;

	var elem = document.all[el_name];
	do 
	{
		x += elem.offsetLeft;
		y += elem.offsetTop;
		if (elem.tagName == "BODY")
			break;
		elem = elem.offsetParent; 
	} while  (1 > 0);

	shift[0] = x;
	shift[1] = y;
	return  x;
}	

function SetCalendarOnElement(el_name)
{
	if (el_name=="") 
	el_name = element_id;
	var shift = new Array(2);
	GetBodyOffsetX(el_name, shift);
	document.all.calendar.style.pixelLeft  = shift[0]; //  - document.all.calendar.offsetLeft;
	document.all.calendar.style.pixelTop = shift[1] + 25 ;
}
function ShowCalendar(elem_name)
{
		if (elem_name=="")
		elem_name = element_id;

		element_id	= elem_name; // element_id is global variable
		newCalendar();
		SetCalendarOnElement(element_id);
		//document.all.calendar.style.visibility = "visible";
		document.all.calendar.style.display="inline";
}

function HideCalendar()
{
	//document.all.calendar.style.visibility="hidden";
	document.all.calendar.style.display="none";
}

function toggleCalendar(elem_name)
{
	//if (document.all.calendar.style.visibility == "hidden")
	if(document.all.calendar.style.display=="none")
		ShowCalendar(elem_name);
	else 
		HideCalendar();
}