import 'package:flutter/cupertino.dart';

import '../constant/AppColors.dart';

class TextWidget extends StatelessWidget {
  String ?text;
   TextWidget({Key? key,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,style: TextStyle(
        color:ColorApp.colorgreen,
      fontSize: 22,
      fontWeight: FontWeight.bold,

    ),);
  }
}
