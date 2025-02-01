import 'package:flutter/material.dart';
import 'package:test_newsapp_project/widget/search_icon.dart';

class IconWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     height: 50,
     width: 50,
     alignment: AlignmentDirectional.center,
     decoration: BoxDecoration(
       color: Colors.black,
       borderRadius: BorderRadius.circular(10),
     ),
     child: IconButton(
       icon: Icon(Icons.search,color: Colors.white,),
       onPressed: () {
         // Action when the search icon is pressed
         showSearch(
           context: context,
           delegate: CustomSearchDelegate(),
         );
       },
     ),
   );
  }

}