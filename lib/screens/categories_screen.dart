import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

//Controls the categories displayed
class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/';
  
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(catData.title, catData.color, catData.id);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //Depends on device size
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
    );
  }
}
