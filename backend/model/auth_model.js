const mongoose = require('mongoose');

var auth = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    name: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
        maxlength: [25, "must be less than 25 length"],
        minlength: [10, "must be more than 10 lenghth"],
    },
    password: {
        type: String,
        required: true,
        minlength: [6, "passworld must be at least 6 charater"],
    },
    type: {
        type: Number,
        required: true
    },
    friends: {
        type: String,
    },
    chatOrder: {
        type: Array,
    },
    imageName: {
        type: String,
    }
}, {

    versionKey: false // no key __v will be set by default
});




module.exports = mongoose.model("AUTH", auth);