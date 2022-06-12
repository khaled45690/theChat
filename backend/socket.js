var clients = {};

module.exports = (io) => {
    io.on("connection", (socket) => {
        console.log("connected");
        console.log(socket.id, "has join");
        socket.on("/test", (msg) => {
            console.log(msg);

        });

        socket.on("message", (msg) => {
            console.log(msg);
            let Receiver = msg.Receiver;
            // if (clients[Receiver])
            //     clients[Receiver].emit("message", msg);
        });
    });
}