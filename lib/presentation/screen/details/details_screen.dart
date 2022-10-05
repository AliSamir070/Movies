import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:movies_app/business_logic/cubit/app_cubit/app_states.dart';
import 'package:movies_app/components/constants/reusable_components.dart';
import 'package:movies_app/data/models/Movie.dart';

import '../../../components/constants/constants.dart';
import '../../../style/theme/theme_app.dart';

class DetailsScreen extends StatelessWidget {
  static String route = "DetailsScreen";

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Duration? duration;
    DateFormat? format;
    DateTime? time;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${movie.title}'
        ),
      ),
      body: BlocProvider(
          create: (context)=>AppCubit()..getDetailedMovie(movie.id!)..getTheSimilarMovies(movie.id!),
          child: BlocConsumer<AppCubit , AppStates>(
            builder: (context , state){
              AppCubit appCubit = AppCubit.get(context);
              if(appCubit.detailedMovie!=null){
                duration = Duration(minutes: appCubit.detailedMovie!.runtime!);
                format = DateFormat.y();
                time = DateTime.parse(appCubit.detailedMovie!.releaseDate!);
              }
              return appCubit.isConnected?appCubit.detailedMovie==null && appCubit.similarMovies.isEmpty?Center(child: CircularProgressIndicator(color: AppStyle.bottomNavSelectedColor,),)
                  : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: "${Constants.imageUrl}${appCubit.detailedMovie!.posterPath}",
                          height: height*0.27,
                          imageBuilder: (context,provider){
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: provider,fit: BoxFit.cover),
                              ),
                            );
                          },
                          placeholder: (context,url){
                            return Center(child: CircularProgressIndicator( color: AppStyle.bottomNavSelectedColor,),);
                          },
                          errorWidget: (context , url,error){
                            return Center(child: Icon(Icons.broken_image_outlined,color: AppStyle.bottomNavSelectedColor,),);
                          },
                        ),
                        appCubit.detailedMovie!.video!?IconButton(
                          onPressed: (){},
                          icon: Image(
                              image: AssetImage('assets/images/play_button.png')
                          ),
                          iconSize: 50,
                        )
                            :Text(
                          "No Video",
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontSize: 15
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        appCubit.detailedMovie!.title!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            format!.format(time!),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'PG-13',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            '${duration!.inHours}h ${duration!.inMinutes.remainder(60)}m',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NewMovieItem(movie: appCubit.detailedMovie!.posterPath==null?movie:appCubit.detailedMovie!,isDetailed: true,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 1/0.5,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index)=>Container(
                                    padding: EdgeInsetsDirectional.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: AppStyle.genreColor
                                        ),
                                        borderRadius: BorderRadiusDirectional.circular(8)
                                    ),
                                    child: Text(
                                      appCubit.detailedMovie!.genres![index].name!,
                                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                          color: AppStyle.genreColor
                                      ),
                                    ),
                                  ),
                                  itemCount: appCubit.detailedMovie!.genres!.length,

                                ),
                                SizedBox(height: height*0.02,),
                                Text(
                                  appCubit.detailedMovie!.overview!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: height*0.02,),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage('assets/images/star.png'),
                                      fit: BoxFit.cover,
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      appCubit.detailedMovie!.voteAverage!.toStringAsFixed(1),
                                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                          fontSize: 18
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height*0.02,),

                    Container(
                      color: AppStyle.containerBack,
                      height: height*0.32,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'More like this',
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 15
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            height: height*0.26,

                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index)=>MovieItem(movie: appCubit.similarMovies[index])
                              , separatorBuilder: (BuildContext context, int index)=>SizedBox(width: 20,),
                              itemCount: appCubit.similarMovies.length,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
                  :GestureDetector(
                onTap: (){
                  appCubit.getDetailedMovie(movie.id!);
                  appCubit.getTheSimilarMovies(movie.id!);
                },
                    child: Container(
                width: double.infinity,
                color: Colors.deepOrange,
                child: Center(
                    child: Text(
                      "No connection, open network and refresh",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                ),
              ),
                  );
            },
            listener: (context,state){
              if(state is AppDetailedMovieSuccess){
                print("Success Detailed");
              }
              if(state is AppDetailedMovieError){
                print("Error Detailed");
              }
              if(state is AppSimilarMoviesError){
                print("Error Similar");
              }
              if(state is AppSimilarMoviesSuccess){
                print("Success Similar");
              }
            },
          ),
      ),
    );
  }
}
