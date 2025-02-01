import 'package:flutter/material.dart';

import '../building_views/build_category.dart';
import '../widget/future_widget.dart';
import '../widget/icon_widget.dart';
import '../widget/search_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('News'),
            const Text(
              'App',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Center(
          child: ListView(
            children: [
              buildSingleChildScrollView(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: FutureListView(
                  category: "general",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconWidget()
    );
  }
}
