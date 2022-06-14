const signin = require('./authFunctions/signin');
const signup = require('./authFunctions/signup');
const addFriend = require('./authFunctions/addFriend');


module.exports = {
    signup: (req, res) => signup(req, res),
    login: (req, res) => signin(req, res),
    addfriend: (req, res) => addFriend(req, res),
}