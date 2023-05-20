import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constant/AppColors.dart';

class Utils {
  static void fieldFocus(
      BuildContext context, FocusNode currentNode, FocusNode nextfocus) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message,
        backgroundColor: ColorApp.primaryColor,
        textColor: ColorApp.colorwhite,
        fontSize: 16

    );
  }
}