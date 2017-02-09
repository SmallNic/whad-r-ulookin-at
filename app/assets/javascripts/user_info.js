var ipAddress;
var url;
var dateTime;
var browser;
var newVisit;
var dfr = $.Deferred();


//Get a user's IP address
function getIP(){
  $.getJSON("//api.ipify.org?format=json", function (data) {
    ipAddress =  data.ip;
  })
}

//Get URL
function getURL(){
  return window.location.href;
}

//Get Data and Time
function getDateTime(){
  return Date().toLocaleString();
}

// Get Browser info
// http://stackoverflow.com/questions/2400935/browser-detection-in-javascript
// Other options include UAParser
function getBrowser(){
  navigator.sayswho= (function(){
    var ua= navigator.userAgent, tem,
    M= ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
    if(/trident/i.test(M[1])){
      tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
      return 'IE '+(tem[1] || '');
    }
    if(M[1]=== 'Chrome'){
      tem= ua.match(/\b(OPR|Edge)\/(\d+)/);
      if(tem!= null) return tem.slice(1).join(' ').replace('OPR', 'Opera');
    }
    M= M[2]? [M[1], M[2]]: [navigator.appName, navigator.appVersion, '-?'];
    if((tem= ua.match(/version\/(\d+)/i))!= null) M.splice(1, 1, tem[1]);
    return M.join(' ');
  })();
  return navigator.sayswho
}

//Determine if user is new or unique
function checkIfUserExists(){
}


function sendData(){
  //Send data via Ajax to Rails API
  console.log("ipAddress", ipAddress)
  console.log("url", url)
  console.log("dateTime", dateTime)
  console.log("browser", browser)
}




$(document).on("turbolinks:load", function(){

  //Get User IP
  //Check if User already exists using IP
  //If User already exists
    //Set newVisit to false
  //else
    //Set newVisit to true
  //Get URL visited
  //Get date & time of visit
  //Get browser used for visit
  //Send User data via ajax to Rails API

})
