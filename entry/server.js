const http = require("http");
var fs = require('fs');

const server = http.createServer((req, res) => {
    const urlPath = req.url;
    if (urlPath === "/") {
        fs.readFile('index.html', function(err, data) {
            res.writeHead(200, {'Content-Type': 'text/html'});
            res.write(data);
            return res.end();
        });
    } else if (urlPath === "/apache") {
        // const options = {
        //     hostname: 'example.com',
        //     port: 443,
        //     method: 'GET'
        // }
        // const req = https.request(options, res => {
        //     console.log(`statusCode: ${res.statusCode}`)
        
        //     res.on('data', d => {
        //     process.stdout.write(d)
        //     })
        // })
        
    } else if ((urlPath === "/spark")) {

    } else if (urlPath === "/jupyter") {
        const options = {
            hostname: 'jupyter-notebook-service',
            port: 8888,
            method: 'GET'
        }
        const req = https.request(options, res1 => {
            console.log(`statusCode: ${res1.statusCode}`)
            open( 'http://urltodirect.to', function (err) {
                if ( err ) throw err;    
            });
        })
        req.on('error', error => {
            console.error(error)
        })
        req.end()
        res1.on('data', d => {
            res.writeHead(res1.statusCode, {'Content-Type': 'text/html'});
            res.write(data);
        })
        return res;
    }
    else if (urlPath === '/sonar') {

    }
    else {
        res.end("Successfully started a server");
    }
});

server.listen(80, "localhost", () => {
  console.log("Listening for request");
});