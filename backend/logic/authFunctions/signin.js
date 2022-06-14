const Auth = require('../../model/auth_model');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');


module.exports = async (req, res) => {
    const user = await Auth.find({ email: req.body.email });
    if (user.length < 1) {
        res.status(404);
        return res.json({ message: "this email not exist", isSuccess: false, });
    }
    bcrypt.compare(req.body.password, user[0].password, async (erorr, result) => {
        if (erorr) {
            res.status(404);
            return res.json({ message: "password not exist" });
        }
        if (result) {
            if (user[0].type == 0) {
                const token = jwt.sign({ email: user[0].email, name: user[0].name, }, "USER");
                user[0]["token"] = token;
                return res.json({
                    message: "user logged in",
                    isSuccess: true,
                    userData: user[0]
                });

            } else {
                const token = jwt.sign({ email: user[0].email, name: user[0].name, }, "ADMIN");
                user[0]["token"] = token;
                return res.json({
                    message: "user logged in",
                    isSuccess: true,
                    userData: user[0]
                });
            }
        }
    })
}