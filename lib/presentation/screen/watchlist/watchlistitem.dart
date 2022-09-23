
import 'package:flutter/material.dart';

class WatchItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Stack(
              children: const[
                Image(image:AssetImage("assets/images/watch_image.png"),),
                Image(image:AssetImage("assets/images/in_watchlist.png") ,),
                Positioned(
                  bottom: 5,
                    left: 18,
                    child: Image(image:AssetImage("assets/images/logo.png") ,)
                ),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Alite Batle Ange!",style: TextStyle(color: Colors.white,fontSize: 15),),
                SizedBox(height: 5,),
                Text("2019",style: TextStyle(color: Colors.white.withOpacity(.7),fontSize: 12)),
                SizedBox(height: 5,),
                Text("Rosa Salaazar,jhsdfhh",style: TextStyle(color: Colors.white.withOpacity(.7),fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
