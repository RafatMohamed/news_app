import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_newsapp_project/servies/api_servies_dio.dart';
import '../building_views/build_general.dart';
import '../models/servies_obj.dart';

class FutureListView extends StatefulWidget {
  const FutureListView({super.key,required this.category});
  final String category ;

  @override
  State<FutureListView> createState() => _FutureListViewState();
}

class _FutureListViewState extends State<FutureListView> {
  dynamic future;
  @override
  void initState() {
    super.initState();
    future = CreateServies(Dio(),category: widget.category).getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: FutureBuilder<List<ServiesObj>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.green,
                  ),
                );
              }
              else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "An error occurred: ${snapshot.error}",
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              else if (snapshot.hasData) {
                final articles = snapshot.data!;
                if (articles.isEmpty) {
                  // Empty state
                  return Center(
                    child: Text(
                      "No articles available.",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }
                // Display the articles in a ListView
                return Center(child: buildListViewGeneral(serviesObj:articles, ));
              } else {
                // Fallback in case snapshot state is unknown
                return Center(
                  child: Text(
                    "Something unexpected happened.",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
            },
          ),
      );
  }
}
