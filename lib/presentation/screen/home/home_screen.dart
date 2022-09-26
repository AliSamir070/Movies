import 'package:flutter/material.dart';
import 'package:movies_app/components/constants/reusable_components.dart';

import '../../../style/theme/theme_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        color: AppStyle.secondaryColor,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: sizeHeight * 0.35,
              child: mainMovie(context,
                  pathPosterBg: "assets/images/Image.png",
                  pathPosterMovie: "assets/images/poster.png",
                  movieName: "Dora and the lost city of gold",
                  movieDate: "2019  PG-13  2h 7m"),
            ),
            SizedBox(height: sizeHeight * 0.02),
            SizedBox(
              height: sizeHeight * 0.25,
              child: movieNewReleasesList(context,
                  numberOfMovie: 10,
                  nameCategory: "New releases",
                  imagePathMovie: "assets/images/narcos.png"),
            ),
            SizedBox(height: sizeHeight * 0.02),
            SizedBox(
              height: sizeHeight * 0.35,
              child: Container(
                color: AppStyle.canvasColor,
                child: movieRecommendedList(context,
                    nameCategory: "Recommended", numberOfMovie: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
