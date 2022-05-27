





import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kdk_slots/view/Homepage/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Apiservices/services.dart';
import '../../utils/routes.dart';
String? finalEmail;
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  // const Login({Key? key}) : super(key: key);
  Api api=Api();
  bool cahngebutton=false;
  final _formkey=GlobalKey<FormState>();
  moveTohHome(BuildContext context) async{
    if(_formkey.currentState!.validate()) {
      final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.setString("email", username.text);
      api.Loginr(username.text, password.text);

      setState(() {
        cahngebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      // await Get.toNamed(MyRoutes.signupRoute);
      setState(() {
        cahngebutton = false;
      });
    }
  }
  @override
  // void initState() {
  //   getvalidation().whenComplete(()async{
  //     Timer(Duration(seconds: 3),()=>Get.to(finalEmail==null?Login():Home()));
  //   });
  //   super.initState();
  // }
  Future getvalidation()async{
    final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var obtainemail=sharedPreferences.get("email");
    setState(() {
      finalEmail=obtainemail as String?;
    });

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child:SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset("assets/login.png",fit: BoxFit.cover,),
                SizedBox(
                  height: 2.h,
                ),
                // "Welcome".text.make(),
                "Welcome".text.xl5.bold.make().shimmer(primaryColor: Colors.deepPurple,),
                // Text("Welcome",style: TextStyle(
                //   fontSize: 24.sp,
                //   fontWeight: FontWeight.bold,
                // ),),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.w,horizontal: 5.w),
                  child: Column(
                    children: [
                      TextFormField(

                        decoration:const InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "User Name Cannot be empty";
                          }
                          return null;
                        },
                        controller: username,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration:const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Password  Cannot be empty";
                          }
                          else if(value.length<6){
                            return "Password Length Should be at least 6";
                          }
                          return null;
                        },
                        controller: password,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius:BorderRadius.circular(cahngebutton?7.h:1.h),
                        child: InkWell(
                          onTap: ()=>moveTohHome(context),
                          child: AnimatedContainer(
                            height: 6.h,
                            width:cahngebutton?7.h: 15.h,

                            alignment:Alignment.center,
                            child:cahngebutton?Icon(Icons.done,
                              color:Colors.white,
                            ) :Text(
                              "Login",
                              style:TextStyle(
                                color:Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp
                              ),

                            ),

                            duration: Duration(seconds: 1),
                          ),
                        ),
                      )
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

