
module.exports = (adventure, res) => {
    if (adventure != undefined) {
        console.log("this email exsisit")
        return res.json({ message: "this email already exist", isSuccess: false });
    }

}