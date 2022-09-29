import 'package:flutter/material.dart';
import 'package:movies_app/components/constants/constants.dart';
import 'package:movies_app/presentation/screen/browseMovies/browseMovies.dart';

import '../../business_logic/cubit/app_cubit/app_cubit.dart';
import '../../style/theme/theme_app.dart';

class CategoryItem extends StatelessWidget {
  int index;
  CategoryItem({required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, BrowseMoviesScreen.routeName,arguments: ArgIndex(NameCat:AppCubit.get(context).Catogerys[index]['name'],
            IndexCat: AppCubit.get(context).Catogerys[index]['id']));
        print(AppCubit.get(context).Catogerys[index]['id']);
      },
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height*0.15,
              decoration: BoxDecoration(
                color: Colors.amber,
                  image: DecorationImage(image: AssetImage("assets/images/${AppCubit.get(context).Catogerys[index]['name']}.jpg"),fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          Expanded(
              flex: 1,
              child: Text(AppCubit.get(context).Catogerys[index]["name"],style: AppStyle.lightTheme.textTheme.titleMedium,)
          )
        ],
      ),
    );
  }
}
class ArgIndex {
  String NameCat ;
  int IndexCat;
  ArgIndex({required this.NameCat, required this.IndexCat});

}
