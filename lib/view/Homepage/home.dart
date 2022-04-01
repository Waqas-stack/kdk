


import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kdk_slots/model/gamelist.dart';
import 'package:kdk_slots/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../Apiservices/services.dart';

class Home extends StatefulWidget {
  const  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List page=[
  //   Kids(),
  //   Eighteenplus(),
  //   Adultgame(),
  //   Boysgame(),
  //   Girlsgame(),
  //   Faimlygame(),
  //   // HOmepage(),
  //   // Itempage(),
  //   // Message(),
  //   // Searchpage(),
  // ];
  // // bool loading=false;
  // int currentIndex=0;
  // void ontap(int index){
  //   setState(() {
  //     currentIndex=index;
  //   });
  //
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: "KDK Slots".text.xl5.bold.make().shimmer(primaryColor: Colors.deepPurple,),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.deepPurple),
          elevation: 0,
        ),
        body: Container(
          padding: Vx.m8,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              Gamelist().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class Gamelist extends StatelessWidget {
  // const Gamelist({Key? key}) : super(key: key);
  gotti(){}
Api api =Api();
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<Gaminglist>(
      future: api.gameslist(),
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
                              onPressed: () async{
                                SharedPreferences sahredppre=await SharedPreferences.getInstance();
                                var tttokeeen=sahredppre.getString("token");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => YourWebView(
                                          "https://kdkslots.com/game/${snapshot.data!.data![index].name}/${tttokeeen}"
                                         // "https://kdkslots.com/game/AdmiralNelsonAM/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2tka3Nsb3RzLmNvbS9hcGkvbG9naW4iLCJpYXQiOjE2NDgxMzUzNDIsImV4cCI6MTY0ODEzODk0MiwibmJmIjoxNjQ4MTM1MzQyLCJqdGkiOiJJT3N6Y1p1a1dCU2xzOEw2WlYxVnBZaWhhdkl1Vm5Ed2d6MEtVQ2E2Iiwic3ViIjoxNDYsInBydiI6IjNlZjZjZjg5ZjU1OWE5MmIzZWI3Yjc3YjhjNzJkYjM5ZDQ3ZWRiNjAifQ.PeY0JC21-wS6w_M_rOi_1VJujP1EqIUX-_LjbWicQxA"
                                          //"https://kdkslots.com/game/${snapshot.data!.data![index].name}/$_SESSION['token']"
                                         // snapshot.data!.response![index].gameUrl.toString(),
                                        )));
                              },
                            child: "Play".text.make(),),
                          ),
                        )
                      ],
                    ),
                    child:  Image.network("https://kdkslots.com/frontend/Default/ico/${snapshot.data!.data![index].name}.jpg").box.make().wh32(context),);

                });
          }else{
            return  Expanded(
              child: ListView.builder(
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
            ),
          );
        }

      }
    );
  }
}

class YourWebView extends StatelessWidget {
  String url;
  YourWebView(this.url);

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Builder(builder: (BuildContext context) {
            return WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  print('blocking navigation to $request}');
                  return NavigationDecision.prevent;
                }
                print('allowing navigation to $request');
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
              },
              gestureNavigationEnabled: true,
            );
          })),
    );
  }
}