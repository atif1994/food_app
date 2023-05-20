

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../utils/routes.dart';
import '../../utils/utils.dart';
import '../homeScreen/get_google_location.dart';
import '../homeScreen/home_screen.dart';
import '../sessionservices/session_services.dart';

class LoginController extends ChangeNotifier{
  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;


  void Login(BuildContext context, String email, String password) async {
    loading = true;
    notifyListeners();

    try {
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionServices().uid=value.user!.uid.toString();
        loading = false;
        notifyListeners();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>GeoLocation()));
      }).onError((error, stackTrace) {
        loading = false;
        notifyListeners();
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      loading = false;
      notifyListeners();

      Utils.toastMessage(e.toString());
    }
  }

}