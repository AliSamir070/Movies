
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screen/watchlist/watchlistitem.dart';

import '../../../style/theme/theme_app.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0,left: 17),

          child: Text("Watchlist", style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white,),),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => WatchItem(),
            itemCount: 5,
            separatorBuilder: (context, index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Divider(
                    thickness: 1,

                    color: AppStyle.divider,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
