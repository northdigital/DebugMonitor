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

  if(q.msg)
    if(q.msg.toUpperCase() === '@CLEAR@') {
      console.clear();
    } else {
      console.log(q.msg);
      if(q.file) {
        fs.appendFile(q.file, `${q.msg}\n`, function (err) { 
          if(err)         
            console.log(err);
        }); 
      }
    }
}).listen(4321);
