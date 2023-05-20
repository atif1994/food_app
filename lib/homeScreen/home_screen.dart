import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/homeScreen/profile_screen.dart';
import 'package:food_app/loginScreen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/AppColors.dart';
import 'Address_screen.dart';
import 'create_order_screen.dart';

class HomeScreen extends StatefulWidget {
  String? city;
  String? house;
  String? adminsistrativeArea;

  HomeScreen({Key? key, this.city, this.house, this.adminsistrativeArea})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? name='';
  removeValues() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
     name = pre.getString("userName");
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    removeValues();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: ColorApp.colorwhite,

        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            createDrawerHeader(),

            createDrawerBodyItem(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>AddressScreen ()));
                },
                icon: Icons.home, text: 'Address'),
            Divider(),
            createDrawerBodyItem(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                icon: Icons.account_circle,
                text: 'Profile'),
            Divider(),
            createDrawerBodyItem(
                icon: Icons.contact_phone, text: 'Contact Info'),
            Divider(),
            createDrawerBodyItem(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateOrder()));
                },
                icon: Icons.contact_phone, text: 'Order'),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorApp.primaryColor,
        title: Text(widget.city.toString() +" "+

            widget.house.toString(),style: TextStyle(
          fontSize: 15
        ),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
                onTap: () {
                  auth.signOut().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInScreen()));
                  });
                },
                child: Icon(Icons.logout)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorApp.primaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateOrder()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [],
      ),
    );
  }

  Widget createDrawerBodyItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget createDrawerHeader() {
    return Container(
      color: ColorApp.primaryColor,
      child: DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(),
          child: Stack(

              children: <Widget>[


            Positioned(
                bottom: 12.0,
                left: 16.0,
                child: Text(name.toString(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500))),
          ])),
    );
  }
}
