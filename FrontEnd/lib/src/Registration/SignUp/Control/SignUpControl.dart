import 'dart:ffi';

import 'package:chat/src/Registration/SignIn/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../DependentPlugins.dart';

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

   signup(){
     if(_check()) return ;
     if(_gmailCheck()) return ;
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
 }

