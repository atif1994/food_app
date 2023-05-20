
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/loginScreen/login_screen.dart';
import 'package:food_app/sessionservices/session_services.dart';

import '../homeScreen/get_google_location.dart';
import '../homeScreen/home_screen.dart';

class SplashServices{

  void login(BuildContext context){
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user!=null){
      SessionServices().uid=user.uid.toString();
      Timer(Duration(seconds: 2),()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=>GeoLocation())));
    }else{
      Timer(Duration(seconds: 2),()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen())));
    }


  }
}