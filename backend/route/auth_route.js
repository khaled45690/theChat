const express = require('express');
const router = express.Router();
const { signup, login, addfriend } = require('../logic/auth_logic');


router.post('/signup', signup);
router.post('/login', login);

router.post('/addFriend', addfriend);






module.exports = router;