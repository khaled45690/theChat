const express = require('express');
const router = express.Router();
const { SaveImage } = require('../logic/SaveImageLogic');



router.post('/', SaveImage);
module.exports = router;
