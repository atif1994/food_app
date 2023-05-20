import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/loginScreen/createAccount.dart';
import 'package:provider/provider.dart';

import '../controller/logInController.dart';
import '../homeScreen/home_screen.dart';
import '../widgets/TextWidget.dart';
import '../widgets/Textformfield.dart';
import '../widgets/roundedButton.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController =TextEditingController();
  bool _obscureText = true;
  TextEditingController passwordController =TextEditingController();
  bool selectedMonth = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(

            padding: EdgeInsets.only(
                left: s.width * 0.05, right: s.width * 0.05, top: 12),
            child: Column(
              children: [
                SizedBox(
                  height: s.height * 0.06,
                ),
                Center(child: TextWidget(text: "Login Account")),
                SizedBox(
                  height: s.height * 0.04,
                ),
                TextFormWidget(
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email Address ';
                    }
                  },
                  controller: emailController,
                  icon: Icons.email_outlined,
                  name: "Email Address",
                ),
                SizedBox(
                  height: s.height * 0.04,
                ),
                TextFormField(
                  onChanged: (value) {},
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password ';
                    }

                    return null;
                  },
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Save Password",style: TextStyle(
                        fontSize: 14
                      ),),
                      InkWell(
                        onTap: (){},
                        child: Text("Forgot password",style: TextStyle(
                          color: Colors.green,
                          fontSize: 14
                        ),),
                      )
                    ],
                  ),
                  value: selectedMonth,
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = !selectedMonth;
                    });
                  },
                ),
                ChangeNotifierProvider(
                  create: (_) => LoginController(),
                  child: Consumer<LoginController>(
                    builder: (BuildContext context, value, Widget? child) {
                      return  RoundedButton(
                        loading: value.loading,
                        text: "Login Account",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                           value.Login(context, emailController.text, passwordController.text);
                          }
                        },
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: s.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(left: s.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Dont have an account?"),
                      SizedBox(width: 12,),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
                          },
                          child: Text("Sign Up"))
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
