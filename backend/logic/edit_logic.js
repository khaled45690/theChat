// const Auth = require('../model/auth_model');
// const Edit  = require('../model/edit_model');
const edituserdata = require('./editFunctions/edituserdata')
module.exports = {

    edituser:(req, res)=> edituserdata (req, res),

}