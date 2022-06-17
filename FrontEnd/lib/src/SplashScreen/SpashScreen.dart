import 'dart:async';

import 'package:chat/src/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CommonStyle.dart';
import '../../DependentPlugins.dart';
import '../../businesslogic/UserData/UserDataModel.dart';
import '../../businesslogic/UserData/UserCubit.dart';
import '../Registration/Registration.dart';
import '../Registration/SignIn/SignIn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double width = 0, height = 0;
  @override
  initState() {
    super.initState();
    context.read<UserCubit>().setPrefs();
    Timer(Duration(seconds: 1), () {
      setState(() {
        width = 300;
        height = 300;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: scaffoldDecoration,
      child: Center(
        child: AnimatedContainer(
          onEnd: onEnd,
          width: width,
          height: height,
          duration: Duration(seconds: 2),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset("assets/ChatLogo.png").image),
          ),
        ),
      ),
    );
  }

  onEnd(){
    if(width == 0 && height == 0){
      UserData? userData = context.read<UserCubit>().getUserDataFromPref();
      Widget destination = userData == null ? const Registration(true) : const Home();
      navigateTo(context , destination);
    }
    Timer(Duration(seconds: 1), () {
      setState(() {
        width = 0;
        height = 0;
      });
    });


  }
}
