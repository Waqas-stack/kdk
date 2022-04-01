import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kdk_slots/view/gamespage/1.dart';
import 'package:kdk_slots/view/gamespage/2.dart';
import 'package:kdk_slots/view/gamespage/3.dart';
import 'package:kdk_slots/view/gamespage/4.dart';
import 'package:kdk_slots/view/gamespage/5.dart';
import 'package:kdk_slots/view/gamespage/6.dart';

import '../Homepage/home.dart';
class Mainpagee extends StatefulWidget {
  const Mainpagee({Key? key}) : super(key: key);

  @override
  State<Mainpagee> createState() => _MainpageeState();
}

class _MainpageeState extends State<Mainpagee> {
  List page=[
    Home(),
    Kids(),
    // Eighteenplus(),
    Adultgame(),
    Boysgame(),
    Faimlygame(),
    Girlsgame(),
    // HOmepage(),
    // Itempage(),
    // Message(),
    // Searchpage(),
  ];
  // bool loading=false;
  int currentIndex=0;
  void ontap(int index){
    setState(() {
      currentIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        // backgroundColor:Appcolor.PRIMARY_COLOR,
        backgroundColor:Colors.deepPurple,
        onTap: ontap,
        currentIndex: currentIndex,
        selectedItemColor:Colors.yellowAccent,
        unselectedItemColor:Colors.yellowAccent,
        // grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon:Icon(CupertinoIcons.home,color:Colors.white,),label: "home"),
          BottomNavigationBarItem(icon:Icon(CupertinoIcons.game_controller,color:Colors.white,),label: "home"),
          BottomNavigationBarItem(icon:Icon(CupertinoIcons.play,color:Colors.white,),label: "home"),
          BottomNavigationBarItem(icon:Icon(CupertinoIcons.flag,color:Colors.white,),label: "home"),
          BottomNavigationBarItem(icon:Icon(CupertinoIcons.play_arrow_solid,color:Colors.white,),label: "home"),
          BottomNavigationBarItem(icon:Icon(CupertinoIcons.profile_circled,color:Colors.white,),label: "home"),

          // BottomNavigationBarItem(icon: Image.asset("assets/shola.png"),label: "home"),
          // BottomNavigationBarItem(icon: Image.asset("assets/teng.png"),label: "home"),
          // BottomNavigationBarItem(icon: Image.asset("assets/heera.png"),label: "home"),
        ],
      ),
    );
  }
}
