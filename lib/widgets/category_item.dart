import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.title, this.color,this.id);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id':id,
        'title':title
      });
      // Navigator.of(ctx).push(MaterialPageRoute(
      //   builder: (_) {return CategoryMealsScreen(id,title);},
      //   fullscreenDialog: false,
      // ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {selectCategory(context)},
      borderRadius:BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
