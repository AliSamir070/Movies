import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/layout/categoryMoviesItem.dart';
import 'package:movies_app/style/theme/theme_app.dart';

import '../../../business_logic/cubit/app_cubit/app_cubit.dart';
import '../../../business_logic/cubit/app_cubit/app_states.dart';
import '../../../components/constants/constants.dart';
import '../../../data/netowrk/movie_api_helper.dart';
import '../../layout/categoryItem.dart';

class BrowseMoviesScreen extends StatelessWidget {
  static String routeName = "BrowseMoviesScreen";

  @override
  Widget build(BuildContext context) {
    ArgIndex arg = ModalRoute.of(context)!.settings.arguments as ArgIndex;
    print(arg.IndexCat);

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            if (state is GetDataBrowseMoviesSuccessState) print('done');
          }, builder: (context, state) {

        if (AppCubit.get(context).Movies.isEmpty) {
          AppCubit.get(context).GetDataBrowseMovies(arg.IndexCat);
        }
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child:AppCubit.get(context).Movies.isEmpty
              ? const Center(
            child:  CircularProgressIndicator(
              color: Colors.amber,
            ),
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
               Text(
                "${arg.NameCat} Movies",
                style: AppStyle.lightTheme.textTheme.titleLarge,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: AppCubit.get(context).Movies.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return CategoryMoviesItem(index: index,);
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
