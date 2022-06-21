// ignore_for_file: file_names, unused_import, prefer_const_constructors

import 'dart:async';

import 'package:chat/src/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CommonStyle.dart';
import '../../DependentPlugins.dart';
import '../../businesslogic/UserData/UserDataModel.dart';
import '../../businesslogic/UserData/UserBloc.dart';
import '../Registration/Registration.dart';

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
    context.read<UserBloc>().setPrefs();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              onEnd: onEnd,
              width: width,
              height: height,
              duration: Duration(seconds: 3),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset("assets/ChatLogo.png").image),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onEnd(){
    UserData? userData = context.read<UserBloc>().getUserDataFromPref();
    Widget destination = userData == null ? const Registration(true) : const Home();
    navigateTo(context , destination);
  }
}
