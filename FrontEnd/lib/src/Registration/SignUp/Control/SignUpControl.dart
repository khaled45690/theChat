// ignore_for_file: file_names, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:convert';
import 'package:chat/src/Registration/SignIn/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../CommonStyle.dart';
import '../../../../DependentPlugins.dart';
import '../../../../businesslogic/UserData/UserDataModel.dart';
import '../../../../businesslogic/UserData/UserBloc.dart';
import '../../../../constants/Constants.dart';
import '../../../Home/Home.dart';

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
     final ImagePicker picker = ImagePicker();
     try {
       final XFile? pickedFile = await picker.pickImage(
           source: ImageSource.gallery,
           imageQuality: 60
       );
       state.setState(() {
         state.signUpData["imageName"] = pickedFile?.path;
         state.signUpDataError["imageName"] = null;
       });
     }catch(e){
       snackBar(state.context , e.toString());
     }
   }


   navigateToSignIn(){
      Navigator.of(state.context).pop();
      navigateTo(state.context , const SignIn());
   }

   signup(BuildContext context) async {
     _removeUnwantedWhiteSpaces();
     if(_nullCheck()) return ;
     if(_gmailCheck()) return ;
     if(_unMatchPassword()) return ;
     state.signUpData["type"] =  user;
     String confirmPassword = state.signUpData["confirmPassword"];
     state.signUpData.remove("confirmPassword");
     Response response = await HttpPost("auth/signup",state.signUpData);
     Map responseData = jsonDecode(response.body);
     if(response.statusCode == statusSuccess){
       state.signUpData["confirmPassword"] = confirmPassword;
       UserData userData = UserData();
       userData.fromMap(responseData["userData"]);
       context.read<UserBloc>().setUserData(userData);
       navigateTo(state.context , const Home());
     }else{
       state.signUpData["confirmPassword"] = confirmPassword;
       snackBar(responseData["message"] , context);
     }

   }

   bool _nullCheck() {
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

