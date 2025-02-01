import 'package:flutter/material.dart';

import '../models/category_obj.dart';
import '../widget/category_widget.dart';

SingleChildScrollView buildSingleChildScrollView() {
   const List <CategoryObj>  categories = [
    CategoryObj(imageAsset: "assets/business.avif", categoryName: "business"),
    CategoryObj(imageAsset: "assets/entertaiment.avif", categoryName: "entertainment"),
    CategoryObj(imageAsset: "assets/health.avif", categoryName: "health"),
    CategoryObj(imageAsset: "assets/science.avif", categoryName: "science"),
    CategoryObj(imageAsset: "assets/sports.avif", categoryName: "sports"),
    CategoryObj(imageAsset: "assets/technology.jpeg", categoryName: "technology"),
  ];

  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics:ClampingScrollPhysics(),
      child:
      Row(
        children: [
          ...categories.map((e)=>CategoryList(category:e),),
        ],
      )
  );
}