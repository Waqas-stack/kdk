import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kdk_slots/Apiservices/services.dart';
import 'package:kdk_slots/model/profilemodel.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class Girlsgame extends StatelessWidget {
  //const Girlsgame({Key? key}) : super(key: key);
  Api api =Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // title: "P r o f i l e".text.xl5.bold.make().shimmer(primaryColor: Colors.deepPurple,),
        backgroundColor: Colors.transparent,
      ),
      body:FutureBuilder<ProfileModels>(
        future: api.Profile(),
        builder: (BuildContext context,  snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!=null){
              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://kdkslots.com/frontend/Default/ico/Royal40FruitsNG.jpg"),
                    radius: 50,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      "${snapshot.data!.username.toString()}".text.bold.xl.make(),
                      SizedBox(
                        height: 10,
                      ),
                      "WaqasYosaf@gmail.com".text.bold.make(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: [
                          "${snapshot.data!.totalIn.toString()}".text.bold.make(),
                          Container(
                            height: 25,
                            child: VerticalDivider(
                              color:Colors.black,

                            ),
                          ),
                          "${snapshot.data!.totalOut.toString()}".text.bold.make(),
                          Container(
                            height: 25,
                            child: VerticalDivider(
                              color:Colors.black,

                            ),
                          ),
                          "${snapshot.data!.currency.toString()}".text.bold.make(),

                        ],
                      ),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: [
                          "Total_in".text.bold.make(),
                          "Total_out".text.bold.make(),
                          "Currency".text.bold.make(),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      "About".text.bold.xl.make().box.make().centered().pOnly(right: 35.h),
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porta velit odio, id hendrerit ipsum bibendum non. Nunc dictum orci quis nisi fringilla, id dapibus odio vehicula. Aenean vitae pellentesque sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed sagittis, magna eu dictum interdum, elit erat lacinia quam, ".text.xl.make().p16(),
                      // "waqas waqas waqas".text.make(),
                    ],
                  )

                ],
              );
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

        },
      ),
    );
  }
}



