
  var express = require('express'),
    app = express(),
    morgan = require('morgan'),             // log requests to the console (express4)
    cookieParser = require('cookie-parser'),
    csrf = require('csurf'),
    bodyParser = require('body-parser'),
    methodOverride = require('method-override'), // simulate DELETE and PUT (express4)
    cors = require('cors'),
    path = require('path'),
    routes = require('./src/routes'),
    port = process.env.PORT || 8080,
    csrfProtection;
    
// setup route middlewares
csrfProtection = csrf({ cookie: true });
app.use(morgan('dev'));                                         // log every request to the console
app.use(bodyParser.urlencoded({ extended: false }));            // parse application/x-www-form-urlencoded
app.use(bodyParser.json());                                     // parse application/json
app.use(methodOverride());
app.use(cors());

// we need this because "cookie" is true in csrfProtection
app.use(cookieParser());
app.use(function(req, res, next) {
   res.header("Access-Control-Allow-Origin", "*");
   res.header('Access-Control-Allow-Methods', 'DELETE, PUT');
   res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
   next();
});

// set the static files location /public/ will be /img for users
app.use(express.static(path.join(__dirname, '/app/public')));

// shoutout to the user
app.listen(port);
console.log('Running front end on port: ' + port + '');
