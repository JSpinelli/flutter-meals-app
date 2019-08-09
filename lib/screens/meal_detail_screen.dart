import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Function _toggleFavorite;
  Function _isFavorite;

  MealDetailScreen(this._toggleFavorite, this._isFavorite);

  Widget buildSectionTitle(String text, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildItemTile(String text, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        text,
      ),
    );
  }

  Widget buildContainer(Widget wdg, BuildContext ctx) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        height: 200,
        width: 300,
        child: wdg);
  }

  @override
  Widget build(BuildContext context) {
    final Meal mealItem = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == ModalRoute.of(context).settings.arguments as String;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(mealItem.title),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                        color: Theme.of(context).accentColor,
                        child:
                            buildItemTile(mealItem.ingredients[index], context));
                  },
                  itemCount: mealItem.ingredients.length,
                ),
                context),
            buildSectionTitle('Steps', context),
            buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                                          children: [ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}'),),
                        title: Text(mealItem.steps[index]),
                      ),
                      Divider()]
                    );
                  },
                  itemCount: mealItem.steps.length,
                ),
                context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isFavorite(mealItem.id)? Icons.star: Icons.star_border),
        onPressed: () {
          _toggleFavorite(mealItem.id);
          },
      ),
    );
  }
}
