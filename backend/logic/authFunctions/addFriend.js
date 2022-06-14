const Auth = require('../../model/auth_model');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const { default: mongoose } = require('mongoose');

module.exports = async (req, res) => {
    try {
        const user = await Auth.find({ email: req.body.email });
        const userFriend = await Auth.find({ email: req.body.friendEmail });
        user.friends.add(userFriend._id);
        userFriend.friends.add(user._id);
        console.log(user);
        console.log(userFriend);
        res.end();

    } catch (e) {
        res.status(404);
        res.json({
            message: e.message,
            isSuccess: false,
        });

    }
}