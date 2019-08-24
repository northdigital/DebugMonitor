var http = require('http');
var url = require('url');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  var q = url.parse(req.url, true).query;
  res.end();

  /** @namespace q.msg **/
  if(q.msg)
    if(q.msg.toUpperCase() === '@CLEAR@')
      console.clear();
    else
      console.log(q.msg);
}).listen(4321);
