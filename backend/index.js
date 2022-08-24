const express = require('express');
const app = express();
const mongoose = require('mongoose');
var bodyParser = require('body-parser');
const cors = require('cors');
const port = 3050;
const AuthRouter = require('./route/auth_route');
const EditRouter = require('./route/edit_route');
const SaveImageRouter = require('./route/SaveImage');

const socket = require('./socket');

var http = require("http");
var server = http.createServer(app);
var io = require("socket.io")(server);





mongoose.connect("mongodb+srv://omar:omar@cluster0.xbwwnyt.mongodb.net/?retryWrites=true&w=majority",

    {
        useNewUrlParser: true,
        useUnifiedTopology: true
    }
);
app.use(cors());

var jsonParser = bodyParser.json({ limit: 6000 * 1024 * 20, type: 'application/json' });
var urlencodedParser = bodyParser.urlencoded({ extended: true, limit: 6000 * 1024 * 20, type: 'application/x-www-form-urlencoding' })

app.use(jsonParser);
app.use(urlencodedParser);
const connection = mongoose.connection;
connection.on('connected', () => { console.log("connect with cloud " + port) });
connection.on('error', () => { console.log("error with database") });

app.use('/auth', AuthRouter);
app.use('/edit', EditRouter);
app.use('/saveimage', SaveImageRouter);

socket(io);

// server listin to the port or the local server of the machine
server.listen(port, "0.0.0.0", () => {
    console.log("server is working");
})
