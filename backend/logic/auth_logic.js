const Auth = require('../model/auth_model');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { default: mongoose } = require('mongoose');


module.exports = {
    signup: async (req, res) => {
        const user = Auth.findOne({ email: req.body.email }, function (err, adventure) {
            if (err) {
                console.log("erorrrrror", err)
                return
            }
            console.log("Resultoooo: ", adventure);
            if (adventure != undefined) {
                console.log("this email exsisit")
                return res.json({ message: "this email already  exist", isSuccess: false });
            }

            bcrypt.hash(req.body.password, 10, async function (error, hash) {
                if (error) {
                    return res.json({ message: error.message });
                }
                if (req.body.type == 0) {
                    console.log(req.body.type);
                    try {
                        const token = jwt.sign({ email: req.body.email, name: req.body.name, }, "USER");
                        const auth = await new Auth({
                            _id: mongoose.Types.ObjectId(),
                            name: req.body.name,
                            email: req.body.email,
                            password: hash,
                            type: req.body.type,


                        }).save();
                        res.json({
                            message: "create user successfully",
                            isSuccess: true,

                            id: auth.id,
                            name: auth.name,
                            email: auth.email,
                            password: hash,
                            type: auth.type,
                            friends: auth.friends,
                            token: token
                        })
                    }
                    catch (e) {
                        res.json({
                            message: e.message,
                            isSuccess: false,
                        })
                    }
                }
                else {
                    try {
                        console.log(req.body.type);

                        const token = jwt.sign({ email: req.body.email, name: req.body.name, }, "ADMIN");

                        const auth = await new Auth({
                            _id: mongoose.Types.ObjectId(),
                            name: req.body.name,
                            email: req.body.email,

                            password: hash,
                            type: req.body.type,

                        }).save();

                        res.json({
                            message: "create admin successfully",
                            isSuccess: true,
                            id: auth.id,
                            name: auth.name,
                            email: auth.email,
                            password: hash,
                            friends: auth.friends,
                            type: auth.type,
                            token: token
                        })
                    }
                    catch (e) {
                        res.json({
                            message: "email already exsisit",
                            isSuccess: false,
                        })
                    }
                }
            }
            )

        }


        );

    },
    login: async (req, res) => {
        const user = await Auth.find({ email: req.body.email });
        if (user.length < 1) {
            return res.json({ message: "this email not exist" });
        } else {
            bcrypt.compare(req.body.password, user[0].password, async (erorr, result) => {
                if (erorr) {
                    return res.json({ message: "password not exist" });
                }
                if (result) {
                    if (user[0].type == 0) {
                        const token = jwt.sign({ email: user[0].email, name: user[0].name, }, "USER");
                        return res.json({
                            message: "user logged in",
                            isSuccess: true,
                            id: user[0].id,
                            user: [
                                user[0]
                            ],
                            token: token,
                        });

                    } else {
                        const token = jwt.sign({ email: user[0].email, name: user[0].name, }, "ADMIN");
                        return res.json({
                            message: "admin logged in",
                            isSuccess: true,
                            id: user[0].id,
                            user: [
                                user[0]
                            ],
                            token: token,

                        })
                    }
                }
            })
        }
    },
    getUsers: async (req, res, next) => {
        const user = await Auth.find();
        console.log("Results: ", user[0]['stageId']);

        res.json({
            result: user.map(res => {
                return {
                    id: res.id,
                    name: res.name,
                    email: res.email,
                    user: user,
                }
            })
        })
    }

}