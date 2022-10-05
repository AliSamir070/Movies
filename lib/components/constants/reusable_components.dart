import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/business_logic/cubit/app_cubit/app_states.dart';
import 'package:movies_app/components/constants/constants.dart';
import 'package:movies_app/style/theme/theme_app.dart';
import '../../business_logic/cubit/app_cubit/app_cubit.dart';
import '../../data/models/Movie.dart';
import '../../presentation/screen/details/details_screen.dart';

//for movie recommended
Widget movieRecommendedList(BuildContext context,
    {required String nameCategory}) {
  double sizeWidth = MediaQuery.of(context).size.width;
  double sizeHeight = MediaQuery.of(context).size.height;
  Movie movie = Movie();
  var cubit = AppCubit.get(context);
  return Padding(
    padding: const EdgeInsets.all(6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          nameCategory,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: sizeWidth * 1,
          height: sizeHeight * 0.30,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: cubit.recommendedMovie.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsScreen()));
                },
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                      color: AppStyle.itemBackColor,
                      borderRadius: BorderRadiusDirectional.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "${Constants.imageUrl}${cubit.recommendedMovie[index]["poster_path"]}",
                            height: sizeHeight * 0.20,
                            imageBuilder: (context, provider) {
                              return Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: provider, fit: BoxFit.cover),
                                    borderRadius:
                                        const BorderRadiusDirectional.only(
                                            topStart: Radius.circular(5),
                                            topEnd: Radius.circular(5))),
                              );
                            },
                            placeholder: (context, url) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                "assets/images/movie image default.jpg",
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                //todo: function to add movie to watch list
                              },
                              child: cubit.addedToWatchlist
                                  ? const Image(
                                      image: AssetImage(
                                          'assets/images/in_watchlist.png'),
                                    )
                                  : const Image(
                                      image: AssetImage(
                                          'assets/images/add_to_watchlist.png'),
                                    ),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Image(
                                      image:
                                          AssetImage('assets/images/star.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${cubit.recommendedMovie[index]["vote_average"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                    "${cubit.recommendedMovie[index]["original_title"]}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Text(
                                      cubit.recommendedMovie[index]
                                          ["release_date"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 7);
            },
          ),
        )
      ],
    ),
  );
}

//to main movie in home screen
Widget mainMovie(BuildContext context) {
  double sizeHeight = MediaQuery.of(context).size.height;
  double sizeWidth = MediaQuery.of(context).size.width;
  var cubit = AppCubit.get(context);
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailsScreen()));
    },
    child: Container(
      color: AppStyle.secondaryColor,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "${Constants.imageUrl}${cubit.latestMovie["poster_path"]}",
            height: sizeHeight * 0.25,
            width: double.infinity,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            errorWidget: (context, url, error) {
              return Image.asset(
                "assets/images/posterBg.jpg",
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            height: sizeHeight * 0.20,
            left: sizeWidth * 0.02,
            bottom: sizeHeight * 0.01,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "${Constants.imageUrl}${cubit.latestMovie["poster_path"]}",
                      fit: BoxFit.cover,
                      height: sizeHeight * 0.18,
                      width: 100,
                      filterQuality: FilterQuality.high,
                      placeholder: (context, url) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Image.asset(
                          "assets/images/posterDefault.jpg",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Positioned(
                        child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          //todo: function to add movie to watch list
                        },
                        child: const Image(
                          image:
                              AssetImage('assets/images/add_to_watchlist.png'),
                        ),
                      ),
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        cubit.latestMovie["original_title"],
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        cubit.latestMovie["release_date"],
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

//for list view movie newReleases
Widget movieNewReleasesList(BuildContext context,
    {required String nameCategory}) {
  double sizeHeight = MediaQuery.of(context).size.height;
  double sizeWidth = MediaQuery.of(context).size.width;
  Movie movie = Movie();
  var cubit = AppCubit.get(context);
  return BlocConsumer<AppCubit, AppStates>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Container(
        color: AppStyle.canvasColor,
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              nameCategory,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: sizeWidth * 1,
              height: sizeHeight * 0.20,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.popularMovie.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()));
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                              color: AppStyle.itemBackColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${Constants.imageUrl}${cubit.popularMovie[index]["poster_path"]}",
                            height: sizeHeight * 0.20,
                            imageBuilder: (context, provider) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: provider, fit: BoxFit.cover),
                                ),
                              );
                            },
                            placeholder: (context, url) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                "assets/images/movie image default.jpg",
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        Positioned(
                            child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              //todo: function to add movie to watch list
                            },
                            child: cubit.addedToWatchlist
                                ? const Image(
                                    image: AssetImage(
                                        'assets/images/in_watchlist.png'),
                                  )
                                : const Image(
                                    image: AssetImage(
                                        'assets/images/add_to_watchlist.png'),
                                  ),
                          ),
                        )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 7);
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
