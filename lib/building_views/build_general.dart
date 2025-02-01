import 'package:flutter/material.dart';

import '../models/servies_obj.dart';
import '../widget/general_widget.dart';

class  buildListViewGeneral extends StatelessWidget{
  final List<ServiesObj> serviesObj;

  const buildListViewGeneral({super.key, required this.serviesObj,});

  @override
  Widget build(BuildContext context) {
   return Center(
     child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 20,),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: serviesObj.length,
          itemBuilder:(context, index) {
            return Center(child: GeneralWidget(serviesObj:serviesObj[index],));
          }
          ),
   );
  }
}