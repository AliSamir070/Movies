import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:movies_app/business_logic/cubit/app_cubit/app_states.dart';
import 'package:movies_app/components/constants/reusable_components.dart';
import '../../../style/theme/theme_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return cubit.latestMovie == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  color: AppStyle.secondaryColor,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                          height: sizeHeight * 0.35,
                          child: mainMovie(
                            context,
                          )),
                      SizedBox(height: sizeHeight * 0.02),
                      SizedBox(
                        height: sizeHeight * 0.25,
                        child: movieNewReleasesList(
                          context,
                          nameCategory: "New releases",
                        ),
                      ),
                      SizedBox(height: sizeHeight * 0.02),
                      SizedBox(
                        height: sizeHeight * 0.35,
                        child: Container(
                          color: AppStyle.canvasColor,
                          child: movieRecommendedList(context,
                              nameCategory: "Recommended"),
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
