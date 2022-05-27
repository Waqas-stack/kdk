
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Apiservices/services.dart';
import '../../utils/routes.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // const Login({Key? key}) : super(key: key);
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password_cofirmation = TextEditingController();
  Api api=Api();
  bool cahngebutton=false;
  final _formkey=GlobalKey<FormState>();
  moveTohHome(BuildContext context) async{
    if(_formkey.currentState!.validate()) {
      setState(() {
        cahngebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));

      api.Regiter(username.text, password.text, password_cofirmation.text);
      setState(() {
        cahngebutton = false;
      });
    }
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
                Image.asset("assets/undraw_Authentication_re_svpt.png",fit: BoxFit.cover,
                  height: 33.h,
                  width: 50.w,
                ),
                SizedBox(
                  height: 2.h,
                ),
                // "Welcome".text.xl5.bold.make().shimmer(primaryColor: Colors.deepPurple,),
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
                          hintText: "Enter Your name",
                          labelText: "Name",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "User Name Cannot be empty";
                          }
                          return null;
                        },
                        controller: username,
                      ),
                      // TextFormField(
                      //   decoration:const InputDecoration(
                      //     hintText: "Enter Email",
                      //     labelText: "Email",
                      //   ),
                      //   validator: (value){
                      //     if(value!.isEmpty){
                      //       return "Email Name Cannot be empty";
                      //     }
                      //     return null;
                      //   },
                      // ),
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
                      TextFormField(
                        obscureText: true,
                        decoration:const InputDecoration(
                          hintText: "Enter Re_Password",
                          labelText: "Confirm Password",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Confirm Password  Cannot be empty";
                          }
                          else if(value.length<6){
                            return "Confirm Password Length Should be at least 6";
                          }
                          return null;
                        },
                        controller: password_cofirmation,
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
                              "Sign up",
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
