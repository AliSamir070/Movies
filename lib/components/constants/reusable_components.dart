import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/components/constants/constants.dart';
import 'package:movies_app/presentation/screen/details/details_screen.dart';
import 'package:movies_app/style/theme/theme_app.dart';

import '../../data/models/Movie.dart';

class NewMovieItem extends StatelessWidget {
  Movie movie;
  bool isDetailed;
  NewMovieItem({required this.movie , this.isDetailed = false});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        CachedNetworkImage(
            imageUrl: "${Constants.imageUrl}${movie.posterPath}",
            height: isDetailed?height*0.25:height*0.15,
            width: isDetailed?width*0.33:width*0.25,

            imageBuilder: (context,provider){
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: provider,fit: BoxFit.cover),
                    borderRadius: BorderRadiusDirectional.circular(5),
                ),
              );
            },
            placeholder: (context,url){
              return Center(child: CircularProgressIndicator( color: AppStyle.bottomNavSelectedColor,),);
            },
            errorWidget: (context , url,error){
              return Center(child: Icon(
                Icons.broken_image_outlined,
                color: AppStyle.bottomNavSelectedColor,
                size: 50,
              ),);
            },
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              //TODO put the add to watchlist function
            },
            child: Image(image: AssetImage('assets/images/add_to_watchlist.png'),
              ),
          ),
        )
      ],
    );
  }
}
class MovieItem extends StatelessWidget {
  Movie movie;
  MovieItem({required this.movie});
  
  @override
  Widget build(BuildContext context) {
    //Duration duration = Duration(minutes: movie.runtime!);
    DateFormat format = DateFormat.y();
    DateTime time = DateTime.parse(movie.releaseDate!);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.route , arguments: movie);
      },
      child: Container(
        width: width*0.25,
        height: height*0.23,
        decoration: BoxDecoration(
          color: AppStyle.itemBackColor,
          borderRadius: BorderRadiusDirectional.circular(5)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                CachedNetworkImage(
            imageUrl: "${Constants.imageUrl}${movie.posterPath}",
              height: height*0.15,
              width: width*0.25,

              imageBuilder: (context,provider){
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: provider,fit: BoxFit.cover),
                    borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(5),topEnd: Radius.circular(5))
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
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){print("Add");},
                    child: Image(image: AssetImage('assets/images/add_to_watchlist.png'),
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
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/star.png'),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          movie.voteAverage!.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.displayLarge,
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'DeadPool 2',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text(
                          format.format(time),
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          'R',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          '1h 13m',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(width: 10,),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
