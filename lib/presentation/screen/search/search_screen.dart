import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30,left: 20,right: 20),
          height: 45,
          child: TextField(
            onChanged: (text) {
              print(text);
              //searchProvider.changeCurrentsearchText(text);
              // print(text);
            },
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(

                prefixIcon: Icon(Icons.search,color: Colors.white,),
                focusedBorder: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(40),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(.4)),
                  borderRadius: BorderRadius.circular(40),
                ),
                hintText: 'Search',
                fillColor: Color(0xFF514F4F),
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                )
            ),
          ),
        ),
        //SizedBox(height: 150,),
        Spacer(),
        Column(
          children: [
            Image(image: AssetImage("assets/images/no_movies.png")),
            SizedBox(height: 5,),
            Text("No movies found",style: TextStyle(color: Colors.white,fontSize: 13),)

          ],
        ),
        Spacer(),
      ],
    );
  }
}
