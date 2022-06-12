const Auth = require('../model/auth_model');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { User } = require('../constants');
const checkEmail = require('./authFunctions/checkEmail');
const { default: mongoose } = require('mongoose');


module.exports = {
    signup: async (req, res) => {
        const user = Auth.findOne({ email: req.body.email }, function (err, adventure) {
            if (err) {
                res.status(404);
                console.log("erorrrrror", err)
                return
            }
            console.log("Resultoooo: ", adventure);
            checkEmail(adventure, res)
            bcrypt.hash(req.body.password, 10, async function (error, hash) {
                if (error) {
                    res.status(404);
                    return res.json({ message: error.message });
                }
                if (req.body.type == User) {
                    try {
                        const token = jwt.sign({ email: req.body.email, name: req.body.name, }, "USER");
                        req.body["_id"] = mongoose.Types.ObjectId();
                        console.log(req.body);
                        req.body["password"] = hash;
                        console.log(hash);
                        console.log(req.body);
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
                        res.status(200);
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
        const user1 = await Auth.find();
        console.log(user);
        console.log(req.body);
        if (user.length < 1) {
            return res.json({ message: "this email not exist", isSuccess: false, });
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

            user: user

        })
    },
    addfriend: async (req, res, next) => {
        const did = req.params.did;

        try {
            const friend = await new Auth({
                _id: mongoose.Types.ObjectId(),
                email: req.body.email

            });
            const auth = await Auth.findById(did);
            auth.friends.push(friend)
            await auth.save();
            res.json({
                message: "inserted",
                isSuccess: true,
                auth: auth,


            });
        } catch (e) {
            res.json({
                message: e.message,
                isSuccess: false,


            })

        }
        //  console.log("Results: ", user[0]['stageId']);
    },



}