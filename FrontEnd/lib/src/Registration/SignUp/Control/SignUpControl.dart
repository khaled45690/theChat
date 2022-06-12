import 'dart:ffi';

import 'package:chat/src/Registration/SignIn/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../DependentPlugins.dart';
import '../../../../constants/Constants.dart';

 class SignUpControl{
   var state;
   SignUpControl(this.state);

   visibiltyChange(variableName){
     state.setState(() {
       state.isHidden[variableName] = !state.isHidden[variableName];
     });
   }


   onChange(String variableName , String value){
     state.setState(() {
       state.signUpData[variableName] = value;
       state.signUpDataError[variableName] = null;
     });
   }


   pickImage()async {
     final ImagePicker _picker = ImagePicker();
     try {
       final XFile? pickedFile = await _picker.pickImage(
           source: ImageSource.gallery,
           imageQuality: 60
       );
       state.setState(() {
         state.signUpData["imageName"] = pickedFile?.path;
         state.signUpDataError["imageName"] = null;
       });
     }catch(e){
       print(e);
     }
   }


   navigateToSignIn(){
      Navigator.of(state.context).pop();
      navigateTo(state.context , const SignIn());
   }

   signup() async {
     _removeUnwantedWhiteSpaces();
     if(_check()) return ;
     if(_gmailCheck()) return ;
     if(_unMatchPassword()) return ;
     state.signUpData["type"] =  user;
     Map finalData = state.signUpData;
     finalData.remove("confirmPassword");
     Response response = await HttpPost("auth/signup",finalData);
     if(response.statusCode == Status_success){

     }

   }

   bool _check() {
     bool check  = false;
     state.signUpData.keys.forEach((key) => {
       if(state.signUpData[key] == null){
         state.setState(() {
           check = true ;
           state.signUpDataError[key] = "this field is required";
         })
       }
     });
     return check;
   }

   bool _gmailCheck(){
    // ^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$
     bool gmailCheck;

     RegExp alphanumeric = RegExp(r'^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$');
     gmailCheck = alphanumeric.hasMatch(state.signUpData["email"]);
     print(!gmailCheck) ;
     if(!gmailCheck){
       state.setState(() {
         state.signUpDataError["email"] = "please enter gmail account";
       });
     }

     return !gmailCheck;
   }


   bool _unMatchPassword(){
     bool unMatchPassword;
     unMatchPassword = state.signUpData["password"] == state.signUpData["confirmPassword"];
     print(!unMatchPassword) ;
     if(!unMatchPassword){
       state.setState(() {
         state.signUpDataError["password"] = "please make sure password match confirm password";
         state.signUpDataError["confirmPassword"] = "please make sure password match confirm password";
       });
     }

     return !unMatchPassword;
   }


   _removeUnwantedWhiteSpaces(){
     state.signUpData["email"] = state.signUpData["email"].replaceAll(' ', '');
     state.signUpData["password"] = state.signUpData["password"].replaceAll(' ', '');
   }
 }

