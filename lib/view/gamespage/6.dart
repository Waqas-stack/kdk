

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Faimlygame extends StatelessWidget {
  const Faimlygame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: "Family Game".text.xl5.bold.make().shimmer(primaryColor: Colors.deepPurple,),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
