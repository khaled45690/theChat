const express = require('express');
const router = express.Router();
const {signup, login,getUsers}=require('../logic/auth_logic');


router.post('/signup',signup);
router.post('/login',login);

router.get('/getusers',getUsers);




module.exports =router;