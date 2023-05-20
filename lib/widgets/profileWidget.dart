import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/AppColors.dart';

class ProfileWidget extends StatelessWidget {
  String title;
  IconData iconData;
  String value;

  ProfileWidget({Key? key,required this.title,required this.iconData,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListTile(
          leading: Icon(iconData,color: ColorApp.primaryColor,),
          title: Text(title,style: Theme.of(context).textTheme.subtitle2,),
          trailing: Text(value,style: Theme.of(context).textTheme.subtitle2),

        ),

      ],
    );
  }
}