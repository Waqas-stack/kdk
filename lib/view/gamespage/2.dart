import 'package:flutter/material.dart';
import 'package:kdk_slots/Apiservices/services.dart';
import 'package:kdk_slots/model/catgroygame.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class Eighteenplus extends StatelessWidget {
  //const Eighteenplus({Key? key}) : super(key: key);
  Api api =Api();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<GameCatgroy>(
        future:api.gamecatagroy() ,
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
                          "${snapshot.data!.data![index].title}".text.shadow(1, 1, 1, Color(0xFF5D5F6E)).make(),
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
                      child:  Image.network("https://kdkslots.com/frontend/Default/ico/Royal40FruitsNG.jpg").box.make().wh32(context),);

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
