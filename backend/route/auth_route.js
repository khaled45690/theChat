const express = require('express');
const router = express.Router();
const {signup, login,getUsers,addfriend}=require('../logic/auth_logic');


router.post('/signup',signup);
router.post('/login',login);

router.get('/getusers',getUsers);
router.post('/addfried/:did',addfriend);






module.exports =router;