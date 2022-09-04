const fs = require('fs');
const jpeg = require('jpeg-js');
var jpg = require('@julusian/jpeg-turbo')
module.exports = {

    SaveImage: (req, res) => {
        res.end();
        console.log("req.bodyParser");
        console.log(req.body);
        console.log(Buffer(req.body.imageBytes));
        // var rawImageData = {
        //     data: Buffer.from(req.body.imageBytes),
        //     width: req.body.width,
        //     height: req.body.height,
        // };
        // var jpegImageData = jpeg.encode(rawImageData, 100);
        var options = {
            format: jpg.FORMAT_RGB,
            width: req.body.width,
            height: req.body.height,

            quality: 100,
        }

        var preallocated = Buffer(jpg.bufferSize(options))

        var encoded = jpg.compressSync(Buffer.from(req.body.imageBytes), preallocated, options)

        fs.writeFile('./testfile.jpeg', encoded, (err) => {
            if (err) {
                console.log("There was an error writing the image")
            }
            else {
                console.log("Written File :" + './testfile.jpeg')
            }
        });

    },

}