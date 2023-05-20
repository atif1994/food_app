import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  String? name;
  IconData? icon;
  final String? hintText;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? actionKeyboard;
  final String? Function(String?)? onValidate;
  final String? Function(String?)? onChange;

  final TextEditingController controller;
   TextFormWidget({Key? key,this.name,this.icon,this.actionKeyboard,required this.controller,this.hintText,this.autovalidateMode,this.onChange,this.onValidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      validator:onValidate ,
      decoration: InputDecoration(

        labelText: name,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35)
        )
      ),
    );
  }
}
