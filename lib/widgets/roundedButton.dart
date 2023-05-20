import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPress;
  final String? text;
  final bool loading;


  RoundedButton({Key? key, required this.onPress, this.text,this.loading=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s=MediaQuery.of(context).size;

    return Material(
      color: Colors.green,
      borderRadius: BorderRadius.circular(32),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        minWidth: double.infinity,
        height:s.height*0.07 ,
        onPressed: onPress,
        child:loading==false? Text(
          text!,
          style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),
        ):CircularProgressIndicator(),
      ),
    );
  }
}