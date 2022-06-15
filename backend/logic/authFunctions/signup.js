const { User } = require('../../constants');
const checkEmail = require('./checkEmail');
const Auth = require('../../model/auth_model');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const { default: mongoose } = require('mongoose');

// this is a way more clean code than the previous version
module.exports = async (req, res) => {
    const user = Auth.findOne({ email: req.body.email }, function (err, adventure) {
        if (err) {
            res.status(404);
            return
        }
        checkEmail(adventure, res)
        bcrypt.hash(req.body.password, 10, async function (error, hash) {
            if (error) {
                res.status(404);
                return res.json({ message: error.message });
            }
            if (req.body.type == User) {

                const token = jwt.sign({ email: req.body.email, name: req.body.name, }, "USER");
                // i used this function to reduce the reapeated code as it same as the Admin saving method
                saveUserData(req, res, hash, token);
            }
            else {
                const token = jwt.sign({ email: req.body.email, name: req.body.name, }, "ADMIN");
                // i used this function to reduce the reapeated code as it same as the User saving method
                saveUserData(req, res, hash, token);
            }
        }
        )

    }


    );

}



saveUserData = async (req, res, hash, token) => {
    try {
        req.body["_id"] = mongoose.Types.ObjectId();
        req.body["password"] = hash;
        req.body["friends"] = JSON.stringify({});
        req.body["chatOrder"] = [];
        req.body["imageName"] = null;
        const auth = await new Auth(req.body).save();
        auth.token = token
        res.status(200);
        res.json({
            message: "create user successfully",
            isSuccess: true,
            userData: auth
        });
    }
    catch (e) {
        res.status(404);
        res.json({
            message: e.message,
            isSuccess: false,
        })
    }
}