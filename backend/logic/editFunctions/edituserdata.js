const Auth = require('../../model/auth_model');


module.exports = async (req, res) => {
    Auth.findById(req.body.userId, function (er, docs) {
        if (er) {
            console.log(er)
            console.log("err:", er);

            res.json({
                message: "userId is not valid"
            })
        } else {
            console.log("Results: ", docs);
            var client = {};
            client = docs
            console.log("client: ", client['name']);
            Auth.findOneAndUpdate({ _id: req.body.userId },
                { $set: { name: req.body.name, imageName: req.body.imageName } }, { new: true }, function (err, docss) {
                    if (err) {
                        res.json({
                            message: "useriddd is not valied",
                        })
                    } else {
                        console.log("new Doccc : ", docss);
                        res.json({
                            message: "congrateulation you have changed ur data",
                            issucess: true

                        })
                    }
                })



        }
    })
}