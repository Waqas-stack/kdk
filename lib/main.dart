

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kdk_slots/thems/them.dart';
import 'package:kdk_slots/thems/themes_services.dart';
import 'package:kdk_slots/utils/routes.dart';
import 'package:kdk_slots/view/Homepage/home.dart';
import 'package:kdk_slots/view/Registarion/login.dart';
import 'package:kdk_slots/view/Registarion/signup.dart';
import 'package:kdk_slots/view/mainpage/maainpage.dart';
import 'package:sizer/sizer.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
       return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'KDK Slots',
          theme: Themes().lightThem,
          darkTheme: Themes().darkThem,
          themeMode: ThemesServices().getthemeMode(),

          initialRoute: "/login",
          // routes: {
          //   MyRoutes.loginRoute:(context)=>Login(),
          //   "/signup":(context)=>Signup(),
          //   MyRoutes.homeRoute:(context)=>Home(),
          // },
         getPages: [
           GetPage( name: MyRoutes.loginRoute,page: ()=>Login(),transition:Transition.cupertino ),
           GetPage( name: MyRoutes.signupRoute,page: ()=>Signup(),transition:Transition.cupertino),
           GetPage( name: MyRoutes.homeRoute,page: ()=>Mainpagee(),transition:Transition.cupertino)
         ],
        );
      },
    );
  }
}

