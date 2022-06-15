const Auth = require('../../model/auth_model');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const { default: mongoose } = require('mongoose');

module.exports = async (req, res) => {
    try {
        const user = await Auth.findOne({ email: req.body.email });
        const userFriend = await Auth.findOne({ email: req.body.friendEmail });
        var userFriendId = userFriend["_id"];
        var friend = {
            [userFriendId]: {
                "name": userFriend.name,
                "imageName": userFriend.imageName == undefined ? null : userFriend.imageName,
                "message": [],
            }
        };
        var userAsFriendId = user["_id"];
        var userAsFriend = {
            [userAsFriendId]: {
                "name": user.name,
                "imageName": user.imageName == undefined ? null : user.imageName,
                "message": [],
            }
        };
        user.friends = JSON.stringify(friend);
        userFriend.friends = JSON.stringify(userAsFriend);
        console.log(user);
        console.log(userFriend);
        res.json(user);

    } catch (e) {
        res.status(404);
        res.json({
            message: e.message,
            isSuccess: false,
        });

    }
}