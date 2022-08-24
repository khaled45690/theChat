const fs = require('fs');
const jpeg = require('jpeg-js');
module.exports = {

    SaveImage: (req, res) => {
        console.log("req.bodyParser");
        console.log(req.body);
        console.log(Buffer(req.body.imageBytes));
        var rawImageData = {
            data: Buffer.from(req.body.imageBytes),
            width: req.body.width,
            height: req.body.height,
        };
        var jpegImageData = jpeg.encode(rawImageData, 100);
        fs.writeFile('./testfile.jpeg', Buffer.from(req.body.imageBytes), 'binary', (err) => {
            if (err) {
                console.log("There was an error writing the image")
            }
            else {
                console.log("Written File :" + './testfile.jpeg')
            }
        });
    },

}