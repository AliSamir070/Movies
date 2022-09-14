import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:movies_app/business_logic/cubit/app_cubit/app_states.dart';
import 'package:movies_app/style/theme/theme_app.dart';

class AppLayout extends StatelessWidget {
  static String route = "HomeLayout";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>AppCubit(),
        child: BlocConsumer<AppCubit,AppStates>(
          builder: (context , state){
            AppCubit cubit = AppCubit.get(context);
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(),
                extendBodyBehindAppBar: true,
                bottomNavigationBar: BottomNavigationBar(
                    onTap: (index){
                      cubit.setBottomNavItem(index);
                    },
                    currentIndex: cubit.currentIndex,
                    items: [
                      const BottomNavigationBarItem(
                          label: "Home",
                          icon: Icon(Icons.home)
                      ),
                      const BottomNavigationBarItem(
                          label: "Search",
                          icon: Icon(Icons.search)
                      ),
                      BottomNavigationBarItem(
                          label: "Browse",
                          icon: Image(image: const AssetImage("assets/images/browse.png"),
                            color: cubit.currentIndex==2?AppStyle.bottomNavSelectedColor
                                :Theme.of(context).primaryColor,
                          )
                      ),
                      BottomNavigationBarItem(
                          label: "Watchlist",
                          icon: Image(image: AssetImage("assets/images/watchlist.png"),
                            color: cubit.currentIndex==3?AppStyle.bottomNavSelectedColor
                                :Theme.of(context).primaryColor,
                          )
                      ),
                    ]
                ),
                body: cubit.screens[cubit.currentIndex],
              ),
            );
          },
          listener: (context , state){

          },
        ),
    );
  }
}
