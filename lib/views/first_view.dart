import 'package:flutter/material.dart';

import 'package:stack/views/germany_views.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
          title: const Text(
              'Tout le monde',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          )),
      body: SafeArea(
        child: Center(child: Column(
          children: [const SizedBox(height: 100,),
            const SizedBox(height: 40,),
            Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
              children:  [InkWell(onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GermanyView()),
              );},
                child: const CircleAvatar(radius:50,
                  backgroundImage: AssetImage('assets/images/germany.png'),),
              ),

              ],)


          ],),),
      ),);
  }
}
