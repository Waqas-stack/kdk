
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemesServices{
  final _box = GetStorage();
  final stoagekey="isDarkMode";


  ThemeMode getthemeMode(){
    return isSaveDarkMode()?ThemeMode.dark:ThemeMode.light;
  }

  bool isSaveDarkMode(){
    return _box.read(stoagekey)??false;
  }

  void saveThemeMode(bool isDarkMode){
    _box.write(stoagekey, isDarkMode);
  }



  void changeThemeMode(){
    Get.changeThemeMode(isSaveDarkMode()? ThemeMode.light: ThemeMode.dark);
    saveThemeMode(!isSaveDarkMode());
  }

}