
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/homeScreen/home_screen.dart';
import 'package:geocoding/geocoding.dart';




import 'package:geolocator/geolocator.dart';

import '../constant/AppColors.dart';

class GeoLocation extends StatefulWidget {
  const GeoLocation({Key? key}) : super(key: key);

  @override
  State<GeoLocation> createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  dynamic administrativeArea='';
  dynamic subAdministrativeArea='';
  dynamic subLocality='';
  TextEditingController textController =TextEditingController();
  bool buttonshow=false;

  void getCurrentpossition() async {
    LocationPermission location = await Geolocator.checkPermission();
    if (location == LocationPermission.denied ||
        location == LocationPermission.deniedForever) {
      print("location denieed");
      LocationPermission asked =await Geolocator.requestPermission();
    } else {
      Position currentPosition=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print("altitude show"+currentPosition.altitude.toString());
      print( "latitude"+currentPosition.latitude.toString());
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);
      Placemark placeMark = placemarks[0];
      setState(() {
        administrativeArea = placeMark.administrativeArea.toString();
        administrativeArea = placeMark.subAdministrativeArea.toString();
        subLocality = placeMark.subLocality.toString();


      });
    }
  }

  // Future<void> _checkPermissions() async {
  //   final PermissionStatus permissionGrantedResult =
  //   await location.hasPermission();
  //   setState(() {
  //     _permissionGranted = permissionGrantedResult;
  //   });
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationPermission()));
  // }
  // LocationPermission locationPermission=LocationPermission();
  //  Future<void> _requestPermission() async {
  //    if (_permissionGranted != PermissionStatus.granted) {
  //      final PermissionStatus permissionRequestedResult =
  //      await location.requestPermission();
  //      setState(() {
  //        _permissionGranted = permissionRequestedResult;
  //      });
  //    }
  //    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationPermission()));
  //
  //  }
  // final QuillController _controller = QuillController.basic();
  @override
  void initState() {
    getCurrentpossition();
    // _checkPermissions();
    // _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    final s=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      getCurrentpossition();
                      setState(() {
                        buttonshow=!buttonshow;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorApp.primaryColor,
                        borderRadius: BorderRadius.circular(4)
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Get Location",style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Visibility(
                    visible:buttonshow ,
                    child: InkWell(
                      onTap: (){
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen(city:administrativeArea.toString() ,
                       house: subLocality.toString(),
                         adminsistrativeArea: administrativeArea.toString(),

                       )));
                      },
                      child: Container(
                        width: s.width*0.28,
                        decoration: BoxDecoration(
                            color: ColorApp.primaryColor,
                          borderRadius: BorderRadius.circular(4)
                        ),

                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Next",style: TextStyle(
                              color: ColorApp.colorwhite
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
