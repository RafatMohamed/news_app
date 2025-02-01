import 'package:flutter/material.dart';

import '../models/category_obj.dart';
import 'future_widget.dart';
import 'icon_widget.dart';

class ViewCategory extends StatelessWidget{
  const ViewCategory({super.key, required this.category});
  final CategoryObj category;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            FutureListView(category: category.categoryName,),
            Container(
                padding: EdgeInsetsDirectional.only(bottom:20 ,end:20 ),
                alignment: AlignmentDirectional.bottomEnd,
                child: IconWidget()),
          ],
        ),
      ),
    );
  }

}