import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../homeScreen/get_google_location.dart';
import '../homeScreen/home_screen.dart';
import '../sessionservices/session_services.dart';
import '../utils/utils.dart';

class SignUpController extends ChangeNotifier {
  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference reference = FirebaseDatabase.instance.ref().child("shopUser");

  void SignUp(BuildContext context, String name, String phonNumber,
      String email, String password,String cnic) async {
    loading = true;
    notifyListeners();

    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionServices().uid = value.user!.uid.toString();
        reference.child(value.user!.uid.toString()).set({
          "uid": value.user!.uid.toString(),
          "email": value.user!.email.toString(),
          "cnic": cnic,
          "phon": phonNumber,
          "userName": name,
        }).then((value) {
          Utils.toastMessage("successful login");
          loading = false;
          notifyListeners();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GeoLocation()));
        }).onError((error, stackTrace) {
          loading = false;
          notifyListeners();
          print(error.toString());
          Utils.toastMessage("Enter Valid Email & Password");
        });
      }).onError((error, stackTrace) {
        loading = false;
        notifyListeners();
        print(error.toString());
        Utils.toastMessage("Enter Valid Email & Password");
      });
    } catch (e) {
      loading = false;
      notifyListeners();

      Utils.toastMessage(e.toString());
    }
  }
}
