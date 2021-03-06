require('newrelic');
var express = require('express');
var fs = require('fs');
var request = require('request');
var cheerio = require('cheerio');
var app     = express();

var httpsync = require('httpsync');
var Traceroute = require('traceroute-lite');
var traceroute = require('traceroute');
var exec = require('child_process').exec;
var bodyParser = require('body-parser')
app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());
app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});


app.get('/', function(req,res) {
     res.sendfile('./public/index.html');
    
});
    

var traceroute;

app.get('/route2/:endPoint', function(req, res){
    
    console.log(req.params.endPoint);
    
   traceroute = new Traceroute(req.params.endPoint);

    
     var data =  {};
     var  apiKey = "1801720c83c41434c7c038029a88e120283d70cd1b90d451070ff195cafeadfc";
    
traceroute.on('hop', function(hop) {
  
    console.log(hop); // { counter: 1, ip: '1.2.3.4', ms: 12 }
    if (hop.ip!=null) {
        var i = hop.counter;
                      data[i] = {};
                       
                     //  console.log(Object.getOwnPropertyNames(hop[i]));
                   
                       data[i].ip = hop.ip;
                       data[i].time = hop.ms;
                      
                      
                       var url = 'http://api.ipinfodb.com/v3/ip-city/?key=' + apiKey + "&ip=" + hop.ip;
                    
                var re = httpsync.get({ url : url});
                    var re = re.end();
                    console.log("shiiiit");
                    // console.log(re.data.toString().split(";"));
                       var returned = re.data.toString().split(";");
                    data[i].country = returned[4];
                    data[i].state = returned[5];
                    data[i].city = returned[6];
                    data[i].zip = returned[7];
                    data[i].lat = returned[8];
                    data[i].lon = returned[9];
                        console.log(data[i]);
                   }
    

});

    
    
    traceroute.on('done', function(err, hops) {
  console.log(hops);
        console.log(err);
        if (hops[0]==null && hops[1]==null) {
         res.send("error");   
        } else {
        res.send(data);
        }
        });

    
    
traceroute.start();
    
    
    
});


//USER /1300/33434 as the packet length and the port number


app.get('/route3/:endPoint/:packetLength/:portNum', function(req, res){
    var endPoint = req.params.endPoint;
    var packetLength = req.params.packetLength;
    var portNum = req.params.portNum;
    var counter = 0;
    
    var allTheData = "";
    var ress = res;

    
    exec('tracepath -n -l ' + packetLength + " -p " + portNum + " " + endPoint, function(error, stdout, stderr) {
    console.log('stdout: ' + stdout);
    console.log('stderr: ' + stderr);
   
    if (error !== null) {
        console.log('exec error: ' + error);
        ress.send("error");
    } else {
         ress.send(stdout);     
        
    }
});

});


app.get('/route4/:endPoint', function(req, res){
    var endPoint = req.params.endPoint;
    exec('traceroute ' + endPoint, function (error, stdout, stderr) {
  // output is in stdout
        
        console.log(error);
        console.log(stdout);
        res.send(stdout);
        
});

});


app.get('/route/:endPoint', function(req, res){
    console.log("haha!");
    
	var endPoint = req.params.endPoint;
    
    
         traceroute.trace(endPoint, function (err,hops) {
             console.log(err);
             console.log(hops);
  if (!err) {
      console.log(hops);
        
      
//      var data =  {};
//      
//       var  apiKey = "1801720c83c41434c7c038029a88e120283d70cd1b90d451070ff195cafeadfc";
//                   for (var i = 0; i<hops.length; i++) {
//                       console.log(hops[i]);
//                       //console.log(Object.getOwnPropertyNames(hops));
//                    if (hops[i]!=false) {
//                      data[i] = {};
//                       
//                     //  console.log(Object.getOwnPropertyNames(hops[i]));
//                    var ip = Object.getOwnPropertyNames(hops[i])[0];
//                       data[i].ip = ip;
//                       data[i].time = hops[i][ip][0];
//                       console.log("sdf " + hops[i][0]);
//                      
//                       var url = 'http://api.ipinfodb.com/v3/ip-city/?key=' + apiKey + "&ip=" + ip;
//                    
//                var re = httpsync.get({ url : url});
//                    var re = re.end();
//                    console.log("shiiiit");
//                    // console.log(re.data.toString().split(";"));
//                       var returned = re.data.toString().split(";");
//                    data[i].country = returned[4];
//                    data[i].state = returned[5];
//                    data[i].city = returned[6];
//                    data[i].zip = returned[7];
//                    data[i].lat = returned[8];
//                    data[i].lon = returned[9];
//                        console.log(data[i]);
//                   }
//                   }
      
      res.send(hops);
      
  } else {
   console.log(err);   
  }
             
             // res.json(data);
  });
   
        
	})

app.post('/toGeolocation', function(req, res){
    
    var data =  {};
    
    console.log(req.body);
    
    var hops = req.body;
    //hops = JSON.parse(hops);
    console.log(hops["0"]);
    console.log(hops[0]);
    var ress = res;
      
       var  apiKey = "1801720c83c41434c7c038029a88e120283d70cd1b90d451070ff195cafeadfc";
    
                for (var i = 0; i<Object.keys(hops).length; i++) {
                       console.log(hops[i]);
                       //console.log(Object.getOwnPropertyNames(hops));
                    if (hops[i]!=false) {
                      data[i] = {};
                       
                     //  console.log(Object.getOwnPropertyNames(hops[i]));
                    var ip = hops[i].ip;
                       data[i].ip = ip;
                       data[i].time = hops[i].time;
                       console.log("sdf " + hops[i]);
                      
                       var url = 'http://api.ipinfodb.com/v3/ip-city/?key=' + apiKey + "&ip=" + ip;
                    
                var re = httpsync.get({ url : url});
                    var re = re.end();
                    console.log("shiiiit");
                    // console.log(re.data.toString().split(";"));
                       var returned = re.data.toString().split(";");
                    data[i].country = returned[4];
                    data[i].state = returned[5];
                    data[i].city = returned[6];
                    data[i].zip = returned[7];
                    data[i].lat = returned[8];
                    data[i].lon = returned[9];
                        console.log(data[i]);
                   
                        
                    }
                    
                   
                    
                   }

    console.log(data);
    res.send(data);
    
});


var port = process.env.PORT || 8081;
app.listen(port)

console.log('Magic happens on port 8081');
exports = module.exports = app; 	