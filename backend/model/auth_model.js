const mongoose = require('mongoose');

const auth = mongoose.Schema({
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
    friends: [{
        type: String,
    }],
    imageName: {
        type: String,
    }
});


module.exports = mongoose.model("AUTH", auth);