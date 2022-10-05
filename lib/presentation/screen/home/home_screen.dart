import 'package:flutter/material.dart';
import 'package:movies_app/components/constants/reusable_components.dart';
import 'package:movies_app/data/models/Movie.dart';

import '../../../data/models/Genres.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(child: MovieItem(movie: Movie(
        id: 1027509,
        posterPath: "/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg",
        title: "Dorra searching gold box",
        releaseDate: "1980-03-15",
        runtime: 130,
        voteAverage: 7.5,
        genres: [
          Genres(id: 1,name: "Action"),
          Genres(id: 1,name: "Action"),
          Genres(id: 1,name: "Action"),
          Genres(id: 1,name: "Action"),
          Genres(id: 1,name: "Action"),
        ],
        overview: "Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. "
      ))),
    );
  }
}
