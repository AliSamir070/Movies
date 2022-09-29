import 'package:flutter/material.dart';
import 'package:movies_app/components/constants/constants.dart';
import 'package:movies_app/presentation/screen/browseMovies/browseMovies.dart';
import 'package:movies_app/style/theme/theme_app.dart';
import '../../business_logic/cubit/app_cubit/app_cubit.dart';

class CategoryMoviesItem extends StatelessWidget {
  int index;
  CategoryMoviesItem({required this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.15,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("${Constants.imageUrl}${AppCubit.get(context).Movies[index]['poster_path']}"),fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
        Expanded(
          flex: 1,
            child: Text(AppCubit.get(context).Movies[index]["title"],style: AppStyle.lightTheme.textTheme.titleMedium,)
        )
      ],
    );
  }
}
