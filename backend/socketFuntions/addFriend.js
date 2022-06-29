const Auth = require('../model/auth_model');
module.exports = async (msg, clients) => {
    const user = await Auth.findOne({ _id: msg.userId });
    const userNewFriend = await Auth.findOne({ _id: msg.friendId });


    var userFriends = JSON.parse(user.friends);
    var newFriendFriends = JSON.parse(userNewFriend.friends);


    if (userFriends[msg.friendId] == undefined) {
        userFriends[msg.friendId] = {
            "friendId": msg.friendId,
            "name": userNewFriend.name,
            "imageName": userNewFriend.imageName,
            "message": [],
        }
        user.friends = JSON.stringify(userFriends);
        user.chatOrder.push(msg.friendId);
    }



    if (newFriendFriends[msg.userId] == undefined) {
        newFriendFriends[msg.userId] = {
            "friendId": msg.userId,
            "name": user.name,
            "imageName": user.imageName,
            "message": [],
        };
        userNewFriend.friends = JSON.stringify(newFriendFriends);
        userNewFriend.chatOrder.push(msg.userId);
    }



    Auth.findOneAndUpdate({ _id: user._id }, user, (err, result) => {
        if (result != null) {
            if (clients[user._id]) clients[user._id].emit("addFriend", user);
        }
    });
    Auth.findOneAndUpdate({ _id: userNewFriend._id }, userNewFriend, (err, result) => {
        if (result != null) {
            if (clients[userNewFriend._id]) clients[userNewFriend._id].emit("addFriend", userNewFriend);
        }
    });


    console.log(user);
    console.log(userNewFriend);

}
