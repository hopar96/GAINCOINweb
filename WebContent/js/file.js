http = require( "http" )
sys = require( "util" )
tojson = require( "./xml2json.js" )
fs = require( "fs" )

apikey = "kv9MaXAb3iMgHFjFjxxQ", "jWYki6GKHh";
query = "검색어";

var options = {
host: 'openapi.naver.com',
port: 80,
path: '/search?key='+apikey+'&query='+query+'&display=10&start=1&target=webkr'
};

http.get(options, function(response){
var body = "";
response.addListener('data', function(chunk)
{
sys.debug("response...");
body += chunk;
});
response.addListener('end', function()
{
sys.debug("end...");

jsonObj = xml2json.parser( body );

for( itemName in jsonObj.rss.channel )
{
console.log( jsonObj.rss.channel[itemName] );
}

fs.writeFileSync( 'result.txt', JSON.stringify(jsonObj) );

});
}).on('error', function(e) {
console.log("Got error: " + e.message);
});