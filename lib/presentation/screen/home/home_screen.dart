import 'package:flutter/material.dart';
import 'package:movies_app/components/constants/reusable_components.dart';
import 'package:movies_app/data/models/Movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(child: MovieItem(movie: Movie(
        posterPath: "/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg"
      ))),
    );
  }
}
