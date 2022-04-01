
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:kdk_slots/model/catgroygame.dart';
import 'package:kdk_slots/model/gamedatat.dart';
import 'package:kdk_slots/model/gamelist.dart';
import 'package:kdk_slots/model/profilemodel.dart';
import 'package:kdk_slots/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Api{





  Regiter(String email,String password,var confirmation)async{
    if(email.isNotEmpty && password.isNotEmpty){
      http.Response rresponse;
      rresponse=await http.post(
          Uri.parse("https://kdkslots.com/api/register?username=${email}&password=${password}&shop_id=1&key=8gk15MTMxywV2fWAITtvMnF3V&password_confirmation=${confirmation}&cashier_id=5"),
          body: {
            "username":email,
            "password":password,
            "shop_id":1.toString(),
            "password_confirmation":confirmation,
            "key":"7793JQAGadnwkyhWDLdBdltjO"
          });
      var data=jsonDecode(rresponse.body.toString());
      if(rresponse.statusCode==201){
        print(data);
        print("done");
        await Get.toNamed(MyRoutes.homeRoute);
        // print(data["token"]);
        // Get.to(Signup());

      }else{
        await Get.toNamed(MyRoutes.signupRoute);
        print(data);
        Get.snackbar(
          "Invalid  Credentials",
          "SignUp Properly",
          snackPosition: SnackPosition.BOTTOM,
          colorText:Colors.red,
          // backgroundColor: Appcolor.innn,
          duration: Duration(seconds: 3),
        );
        print("Login Nothing do");
      }
    }else{
      Get.snackbar(
        "Blank Fields",
        "Enter Email and password",
        snackPosition: SnackPosition.BOTTOM,
        colorText:Colors.red,
        // backgroundColor: Appcolor.innn,
        duration: Duration(seconds: 3),
      );
    }




  }





















  Loginr(String email,String password)async{
    if(email.isNotEmpty && password.isNotEmpty){
      http.Response rresponse;
      rresponse=await http.post(
            Uri.parse("https://kdkslots.com/api/login?username=${email}&password=${password}&shop_id=1&key=7793JQAGadnwkyhWDLdBdltjO"),
          body: {
            "username":email,
            "password":password,
            "shop_id":1.toString(),
            "key":"7793JQAGadnwkyhWDLdBdltjO"
          });
      var data=jsonDecode(rresponse.body.toString());
      if(rresponse.statusCode==200){
        var token=data["token"];
        final SharedPreferences sahredpre=await SharedPreferences.getInstance();
        sahredpre.setString("token",token);
        print(token);
        // print(data["token"]);
        await Get.toNamed(MyRoutes.homeRoute);

      }else{
        print(data);
        await Get.toNamed(MyRoutes.signupRoute);
        Get.snackbar(
          "Invalid  Credentials",
          "Login Properly",
          snackPosition: SnackPosition.BOTTOM,
          colorText:Colors.red,
          // backgroundColor: Appcolor.innn,
          duration: Duration(seconds: 3),
        );
        print("Login Nothing do");
      }
    }else{
      Get.snackbar(
        "Blank Fields",
        "Enter Email and password",
        snackPosition: SnackPosition.BOTTOM,
        colorText:Colors.red,
        // backgroundColor: Appcolor.innn,
        duration: Duration(seconds: 3),
      );
    }




  }

  // Register (String name,String email,String password,String password_con)async{
  //   if(name.isNotEmpty && email.isNotEmpty){
  //     http.Response response;
  //     response=await http.post(Uri.parse("http://mobile.playgirl.studio/api/register"),
  //         // headers: <String, String>{
  //         //   // 'Content-Type': 'application/json; charset=UTF-8',
  //         //   "Content-Type": "application/form-data"
  //         // },
  //         body: {
  //           "name":name,
  //           "email":email,
  //           "password":password,
  //           "password_confirmation":password_con,
  //         });
  //     if(response.statusCode==200){
  //       Get.to(Login());
  //       print(response.body);
  //       print("waqas");
  //     }
  //     else{
  //       Get.snackbar(
  //         "Invalid  Credentials",
  //         "Signup Properly",
  //         snackPosition: SnackPosition.BOTTOM,
  //         colorText:Colors.red,
  //         backgroundColor: Appcolor.innn,
  //         duration: Duration(seconds: 3),
  //       );
  //       print("Nothing do");
  //     }
  //   }else{
  //     Get.snackbar(
  //       "Blank Fields",
  //       "Enter All Fields",
  //       snackPosition: SnackPosition.BOTTOM,
  //       colorText:Colors.red,
  //       backgroundColor: Appcolor.innn,
  //       duration: Duration(seconds: 3),
  //     );
  //   }
  //
  //
  //
  //
  // }



  Future<Gaminglist> gameslist()async{
    SharedPreferences sahredppre=await SharedPreferences.getInstance();
    var tttokeeen=sahredppre.getString("token");
    final response=await http.get(Uri.parse("https://kdkslots.com/api/games?&key=7793JQAGadnwkyhWDLdBdltjO&shop_id=1&cashier_id=5&page={1}"),
      headers: {
        'Authorization': 'Bearer $tttokeeen',
      }
    );
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      print(tttokeeen);
      print(data);
      return Gaminglist.fromJson(data);
    }else{
      print(tttokeeen);
      print(data);
      return Gaminglist.fromJson(data);
    }
  }







  Future<ProfileModels> Profile()async{
    SharedPreferences sahredppre=await SharedPreferences.getInstance();
    var tttokeeen=sahredppre.getString("token");
    final response=await http.get(Uri.parse("https://kdkslots.com/api/me?key=7793JQAGadnwkyhWDLdBdltjO"),
        headers: {
          'Authorization': 'Bearer $tttokeeen',
        }
    );
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      print(tttokeeen);
      print(data);
      return ProfileModels.fromJson(data);
    }else{
      print(tttokeeen);
      print(data);
      return ProfileModels.fromJson(data);
    }
  }







  Future<GameCatgroy> gamecatagroy()async{
    SharedPreferences sahredppre=await SharedPreferences.getInstance();
    var tttokeeen=sahredppre.getString("token");
    final response=await http.get(Uri.parse("https://kdkslots.com/api/category?key=7793JQAGadnwkyhWDLdBdltjO"),
        headers: {
          'Authorization': 'Bearer $tttokeeen',
        }
    );
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      print(tttokeeen);
      print(data);
      return GameCatgroy.fromJson(data);
    }else{
      print(tttokeeen);
      print(data);
      return GameCatgroy.fromJson(data);
    }
  }



  Future<GameDataa> gamedataa(int id)async{
    SharedPreferences sahredppre=await SharedPreferences.getInstance();
    var tttokeeen=sahredppre.getString("token");
    final response=await http.get(Uri.parse("https://kdkslots.com/api/games?category_id=${id}&key=7793JQAGadnwkyhWDLdBdltjO"),
        headers: {
          'Authorization': 'Bearer $tttokeeen',
        }
    );
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      print(tttokeeen);
      print(data);
      return GameDataa.fromJson(data);
    }else{
      print(tttokeeen);
      print(data);
      return GameDataa.fromJson(data);
    }
  }





}