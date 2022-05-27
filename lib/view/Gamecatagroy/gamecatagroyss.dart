import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kdk_slots/Apiservices/services.dart';
import 'package:kdk_slots/model/catgroygame.dart';
import 'package:kdk_slots/view/Gamecatagroy/gamedatacat.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class GameCatogeris extends StatelessWidget {
  const GameCatogeris({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "KDK Categories".text.xl5.bold.make().shimmer(primaryColor: Colors.deepPurple,),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        elevation: 0,
      ),
      body: Container(
        padding: Vx.m8,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            // "Enjoy".text.xl2.make(),
            // Text("KDK Games",
            //   textScaleFactor: 3.5,
            //   style: TextStyle(
            //   fontWeight: FontWeight.bold,
            // ),),
            // Text("KDK Game",style: TextStyle(
            //     fontWeight: FontWeight.bold
            // ),),
            Gamelist().expand(),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ListView.builder(
            //       itemCount: 15,
            //         itemBuilder: (context,index){
            //         return Card(
            //           child: ListTile(
            //             leading: Image.asset("assets/undraw_Authentication_re_svpt.png"),
            //             title: "waqas".text.xl2.make(),
            //             subtitle:Text("waqas") ,
            //             trailing: Text("waqas",
            //               textScaleFactor: 1.2,
            //               style: TextStyle(
            //               color: Colors.deepPurple,
            //               fontWeight: FontWeight.bold
            //             ),),
            //
            //           ),
            //         );
            //
            //     }),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class Gamelist extends StatelessWidget {
  // const Gamelist({Key? key}) : super(key: key);
  Api api =Api();
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<GameCatgroy>(
        future: api.gamecatagroy(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!=null){
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing:0,

                  ),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data?.length,
                  itemBuilder: (context,index){
                    return GridTile(
                      footer:Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          "${snapshot.data!.data![index].title}".text.bold.ellipsis.purple400.shadow(1, 1, 1, Color(0xFF5D5F6E)).make().expand(),
                           //IconButton(onPressed: () {  }, icon: Icon(CupertinoIcons.play_arrow_solid,color:Colors.deepPurple,),),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              // width: 60,
                              height: 4.h,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                                  // shape:MaterialStateProperty.all(StadiumBorder()),
                                ),
                                onPressed: () {
                                  Get.to(GameDatata(snapshot.data!.data![index].id));
                                },
                                child: "Play".text.make(),),
                            ),
                          )
                        ],
                      ),
                      child:  Image.network("https://kdkslots.com/frontend/Default/ico/Royal40FruitsNG.jpg").box.make().wh32(context),);

                  });
            }else{
              return  ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey.shade100,
                      child: ListTile(
                        leading:CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                        ) ,
                        title: Container(
                          color:Colors.grey,
                          height: 10,
                          width: 100.h,
                        ),
                        subtitle:Container(
                          color:Colors.grey,
                          height: 10,
                          width: 100.h,
                        ),
                      )
                  );
                },
              );
            }
          }else{
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey.shade100,
                    child: ListTile(
                      leading:CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                      ) ,
                      title: Container(
                        color:Colors.grey,
                        height: 10,
                        width: 100.h,
                      ),
                      subtitle:Container(
                        color:Colors.grey,
                        height: 10,
                        width: 100.h,
                      ),
                    )
                );
              },
            );
          }

        }
    );
  }
}