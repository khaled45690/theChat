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

   signup(){
     if(_check()) return ;
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


   bool _check() {
     bool check  = false;
     state.signUpData.keys.forEach((key) => {
       print(key) ,
       if(state.signUpData[key] == null){
         state.setState(() {
           check = true ;
           state.signUpDataError[key] = "this field is required";
         })
       }
     });
     return check;
   }
 }

