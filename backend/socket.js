const addFriend = require('./socketFuntions/addFriend')

var clients = {};

module.exports = (io) => {
    io.on("connection", (socket) => {
        console.log("connected");
        console.log(socket.id, "has join");
        socket.on("/test", (msg) => {
            console.log(msg);

        });
        socket.on("firstTime", (id) => {
            console.log(id);
            clients[id] = socket;
        });

        socket.on("message", (msg) => {
            console.log(msg);
            let Receiver = msg.Receiver;
            // if (clients[Receiver])
            //     clients[Receiver].emit("message", msg);
        });

        socket.on("addFriend", (msg) => addFriend(msg, clients));


        // {
        //     console.log(msg);
        //     let Receiver = msg.Receiver;
        //     // if (clients[Receiver])
        //     //     clients[Receiver].emit("message", msg);
        // }

    });
}