

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kdk_slots/Apiservices/services.dart';
import 'package:kdk_slots/model/gamelist.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class Kids extends StatelessWidget {
  const Kids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: "KDK Slots2".text.xl5.bold.make().shimmer(primaryColor: Colors.deepPurple,),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Gamebloc().expand(),
        ],
      ),
    );
  }
}

class Gamebloc extends StatelessWidget {
  // const Gamebloc({Key? key}) : super(key: key);
  Api api =Api();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<Gaminglist>(
        future:api.gameslist() ,
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data != null){
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 0,

                  ),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data?.length,
                  itemBuilder: (context,index){
                    return GridTile(
                      footer:Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          "${snapshot.data!.data![index].title}".text.bold.ellipsis.purple400.shadow(1, 1, 1, Color(0xFF5D5F6E)).make().expand(),
                          // IconButton(onPressed: () {  }, icon: Icon(CupertinoIcons.play_arrow_solid,color:Colors.deepPurple,),)
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
                                onPressed: () {  },
                                child: "Play".text.make(),),
                            ),
                          )
                        ],
                      ),
                      child:  Image.network("https://kdkslots.com/frontend/Default/ico/${snapshot.data!.data![index].name}.jpg").box.make().wh32(context),);

                  });
            }else{
              return Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade100,
                        child: ListTile(
                          leading:CircleAvatar(radius: 30, backgroundColor: Colors.white,) ,
                          title: Container(
                            color:Colors.grey,
                            height: 10,
                            width: 100.h,
                          ),
                          subtitle:Container(color:Colors.grey, height: 10, width: 100.h,),
                        )
                    );
                  },
                ),
              );
            }
          }else{
            return Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey.shade100,
                      child: ListTile(
                        leading:CircleAvatar(radius: 30, backgroundColor: Colors.white,) ,
                        title: Container(color:Colors.grey, height: 10, width: 100.h,),
                        subtitle:Container(color:Colors.grey, height: 10, width: 100.h,),),
                  );
                },
              ),
            );
          }

        },
      ),
    );
  }
}
