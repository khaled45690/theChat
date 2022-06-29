const Auth = require('../model/auth_model');
module.exports = async (msg, clients) => {
    let Receiver = msg.Receiver;
    if (clients[Receiver])
        clients[Receiver].emit("message", msg);
    const sender = await Auth.findOne({ _id: msg.Sender });
    const receiver = await Auth.findOne({ _id: msg.Receiver });
    updateUser(sender, receiver._id, true, msg);
    updateUser(receiver, sender._id, false, msg);
}



updateUser = (user, userFriendId, isSender, msgData) => {
    var userFriends = JSON.parse(user.friends);
    userFriends["isSender"] = isSender;
    userFriends[userFriendId].message.push(msgData);
    user["friends"] = JSON.stringify(userFriends);
    console.log(userFriendId);
    user["chatOrder"] = user["chatOrder"].filter((value) => {
        if (userFriendId != value)
            return value
    });
    user["chatOrder"].push(userFriendId);
    Auth.findOneAndUpdate({ _id: user._id }, user, (err, result) => {

    });
}
