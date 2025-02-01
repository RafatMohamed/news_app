import 'package:flutter/material.dart';
import 'package:test_newsapp_project/models/category_obj.dart';
import 'package:test_newsapp_project/widget/view_category.dart';


class CategoryList extends StatelessWidget {
  final CategoryObj category;
  const CategoryList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ( context) {
              return ViewCategory(category: category,);
            },
          ),
        );
      },
      child: Container(
        height: 100,
        width: 180,
        alignment: AlignmentDirectional.centerStart,
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  category.imageAsset,
                  fit: BoxFit
                      .fill, // Ensures the image covers the container proportionally
                  width: double.infinity,
                  height: double.infinity,
                )),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withValues(alpha: 0.2),
              ),
            ),
            Text(category.categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
