const express = require('express');
const router = express.Router();
const { edituser } = require('../logic/edit_logic');



router.post('/edituser', edituser);
module.exports = router;
