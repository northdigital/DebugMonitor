var http = require('http');
var url = require('url');
var moment = require('moment');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  var q = url.parse(req.url, true).query;
  res.statusCode = 200;

  var strDate = moment(new Date()).format('MM/DD/YYYY H:mm:ss');

  res.end(`<html><html><h1>${strDate}</h1></body></html>`);

  /** @namespace q.msg **/
  if(q.msg)
    if(q.msg.toUpperCase() === '@CLEAR@')
      console.clear();
    else
      console.log(q.msg);
}).listen(4321);
