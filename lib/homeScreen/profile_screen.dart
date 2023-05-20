import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp_shop/controller/profileController.dart';
import 'package:foodapp_shop/widgets/TextWidget.dart';
import 'package:foodapp_shop/widgets/roundedButton.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../constant/AppColors.dart';
import '../sessionservices/session_services.dart';
import '../widgets/Textformfield.dart';
import '../widgets/profileWidget.dart';
import '../widgets/roundedButton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseDatabase.instance.ref("profile");
  TextEditingController shopDescriptionController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController servicesCatageriousController = TextEditingController();
  TextEditingController phonNumberController = TextEditingController();
  TextEditingController operController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool selectedMonth = true;

  File? image;
  FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.primaryColor,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: ChangeNotifierProvider(
              create: (_) => ProfileController(),
              child: Consumer<ProfileController>(
                builder: (context, val, child) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: s.width * 0.05,
                        right: s.width * 0.05,
                        top: 12),
                    child: Column(
                      children: [

                        SizedBox(
                          height: s.height * 0.04,
                        ),
                        TextFormWidget(

                          onValidate: (val) =>
                          val!.isEmpty ? 'Enter Shop Name' : null,
                          controller: shopNameController,
                          icon: Icons.person_outline,
                          name: "Enter Shop Name",
                        ),
                        SizedBox(
                          height: s.height * 0.04,
                        ),
                        TextFormWidget(
                          onValidate: (val) =>
                          val!.isEmpty ? 'Shop Description' : null,
                          controller: shopDescriptionController,
                          icon: Icons.person_outline,
                          name: "Shop Description",
                        ),
                        SizedBox(
                          height: s.height * 0.04,
                        ),
                        TextFormWidget(
                          onChange: (val) {
                            if (mounted) {
                              //the email will trow to String that will give to firebaseAuth
                            }
                          },
                          onValidate: (val) =>
                          val!.isEmpty ? 'Enter Services Catagerious' : null,
                          controller: servicesCatageriousController,
                          icon: Icons.email_outlined,
                          name: "Services Catagerious",
                        ),
                        SizedBox(
                          height: s.height * 0.04,
                        ),
                        TextFormWidget(
                          onValidate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Phon Number ';
                            }
                          },
                          controller: phonNumberController,
                          icon: Icons.phone_outlined,
                          name: "Contact Number",
                        ),
                        SizedBox(
                          height: s.height * 0.04,
                        ),
                        TextFormWidget(
                          onValidate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Operatiog hours ';
                            }
                          },
                          controller:operController ,
                          icon: Icons.card_membership_outlined,
                          name: "Operatiog hours",
                        ),
                        SizedBox(
                          height: s.height * 0.04,
                        ),
                        RoundedButton(
                          loading: val.loading,
                          text: "Save personalInfo",
                          onPress: () async {


                            setState(() {

                            });
                            val.PerfileSave(context: context,shopName: shopNameController.text,operationHour: operController.text,servicCatagerious: servicesCatageriousController.text,shopDescription: shopDescriptionController.text);
                          },
                        ),
                        SizedBox(
                          height: s.height * 0.02,
                        ),
                      ],
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}


