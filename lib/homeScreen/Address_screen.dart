import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constant/AppColors.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    final s=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.primaryColor,
        title: Text("Address"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Icon(


                    Icons.location_on_outlined,color: ColorApp.primaryColor,
                size:s.width*0.3,
                ),
                SizedBox(height: 10,),
                Text("Get Started",style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){
                    
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Add Address",style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
