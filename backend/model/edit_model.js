const mongoose = require('mongoose');

var edit = mongoose.Schema({
   // _id: mongoose.Schema.Types.ObjectId,
    userId:{
        type :String,
        required: true,
    },
    name: {
        type: String,
        required: true,
    },
    // email: {
    //     type: String,
    //     required: true,
    //     maxlength: [25, "must be less than 25 length"],
    //     minlength: [10, "must be more than 10 lenghth"],
    // },
   
}, {

    versionKey: false // no key __v will be set by default
});




module.exports = mongoose.model("EDIT", edit);

