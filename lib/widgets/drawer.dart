
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kdk_slots/view/Gamecatagroy/gamecatagroyss.dart';
// import 'package:kdk_slots/view/gamespage/1.dart';
// import 'package:kdk_slots/view/gamespage/2.dart';
// import 'package:kdk_slots/view/gamespage/3.dart';
// import 'package:kdk_slots/view/gamespage/4.dart';
// import 'package:kdk_slots/view/gamespage/5.dart';
// import 'package:kdk_slots/view/gamespage/6.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color:Colors.deepPurple,
        child: ListView(
          children: [
            // DrawerHeader(
            //   padding: EdgeInsets.zero,
            //   child:UserAccountsDrawerHeader(
            //     margin: EdgeInsets.zero,
            //     accountName:  Text("Waqas ahmad"),
            //     accountEmail: Text("waqas3084@gmail.com"),
            //
            //   )
            // ),
            ListTile(
              onTap:(){
                Get.to(GameCatogeris());
              },
              leading: Icon(CupertinoIcons.home,color:Colors.white,),
              title: "Games Categories".text.white.make(),
              // subtitle: "1".text.white.make(),
            ),
            ListTile(
              onTap:(){
                // Get.to(Eighteenplus());
              },
              leading: Icon(Icons.logout_outlined,color:Colors.white,),
              title: "Logout".text.white.make(),
              // subtitle: "2".text.white.make(),
            ),
            // ListTile(
            //   onTap:(){
            //     Get.to(Adultgame());
            //   },
            //   leading: Icon(CupertinoIcons.game_controller,color:Colors.white,),
            //   title: "Adult Games".text.white.make(),
            //   subtitle: "3".text.white.make(),
            // ),
            // ListTile(
            //   onTap:(){
            //     Get.to(Boysgame());
            //   },
            //   leading: Icon(CupertinoIcons.gamecontroller_alt_fill,color:Colors.white,),
            //   title: "Boys Games".text.white.make(),
            //   subtitle: "4".text.white.make(),
            // ),
            // ListTile(
            //   onTap:(){
            //     Get.to(Girlsgame());
            //   },
            //   leading: Icon(CupertinoIcons.play,color:Colors.white,),
            //   title: "Girls Games".text.white.make(),
            //   subtitle: "5".text.white.make(),
            // ),
            // ListTile(
            //   onTap:(){
            //     Get.to(Faimlygame());
            //   },
            //   leading: Icon(CupertinoIcons.rocket,color:Colors.white,),
            //   title: "Family Games".text.white.make(),
            //   subtitle: "6".text.white.make(),
            // ),
          ],
        ),
      ),
    );
  }
}
