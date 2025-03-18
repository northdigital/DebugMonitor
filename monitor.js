var http = require('http');
var url = require('url');
var moment = require('moment');
var fs = require('fs');

const port = 4321;

function showNetworkInterfaces() {
  var interfaces = require('os').networkInterfaces();
  for (var devName in interfaces) {
    var iface = interfaces[devName];

    for (var i = 0; i < iface.length; i++) {
      var alias = iface[i];

      if (alias.family === 'IPv4' && alias.address !== '127.0.0.1' && !alias.internal)
        console.log(`${devName}->${alias.address}`);
    }
  }
}

showNetworkInterfaces();
console.log(`port=${port}`);

http.createServer(function (req, res) {
  try {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    let q = url.parse(req.url, true).query;

    let strDate = moment(new Date()).format('MM/DD/YYYY H:mm:ss');
    res.statusCode = 200;
    res.end(`<html><html><h1>${strDate}</h1></body></html>`);

    if (q.msg) {

      if (q.msg.toUpperCase() === '@CLEAR@') {
        console.clear();
        return;
      }

      q.msg = (new Date).toLocaleString() + " " + q.msg;

      if (q.file) {
        let line = q.msg;
        fs.appendFile(q.file, `${q.msg}\n`, (err) => { if (err) { console.log(err); } })
      } else {
        console.log(q.msg);
      }
    }
  } catch(error) {
    console.log(`EXCEPTION:${error}`);
  }
}).listen(port);
