import 'package:flutter/material.dart';
import 'package:test_newsapp_project/models/servies_obj.dart';

class GeneralWidget extends StatelessWidget {
  final ServiesObj serviesObj;
  const GeneralWidget({super.key, required this.serviesObj});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: serviesObj.imageUrl != null && serviesObj.imageUrl is String
                ? Image.network(
                    serviesObj.imageUrl as String,
                    fit: BoxFit.fill,
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    height: 250,
                  )
                : Image.asset(
                    "assets/technology.jpeg",
                    fit: BoxFit.fill,
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    height: 250,
                  ),
          ),
          Text(
            serviesObj.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
            ),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(serviesObj.description ?? "",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
