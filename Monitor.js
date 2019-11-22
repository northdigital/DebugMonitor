var http = require('http');
var url = require('url');
var moment = require('moment');
var fs = require('fs');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  var q = url.parse(req.url, true).query;

  var strDate = moment(new Date()).format('MM/DD/YYYY H:mm:ss');
  res.statusCode = 200;
  res.end(`<html><html><h1>${strDate}</h1></body></html>`);

  if(q.msg) {
    let msg = decodeURI(q.msg)

    if(msg.toUpperCase() === '@CLEAR@') {      
      console.clear();
      return;
    }

   if(q.file) {
    fs.appendFile(q.file, `${msg}\n`, (err) => { if(err) { console.log(err); }})
   } else {
    console.log(msg);
   }      
  }
}).listen(4321);
