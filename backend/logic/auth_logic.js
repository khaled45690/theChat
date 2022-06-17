const signin = require('./authFunctions/signin');
const signup = require('./authFunctions/signup');

module.exports = {
    signup: (req, res) => signup(req, res),
    login: (req, res) => signin(req, res),
}