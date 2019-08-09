import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals;

  void _setFilters(bool gf, bool vt, bool vn, bool lf) {
    setState(() {
      _glutenFree = gf;
      _vegetarian = vt;
      _vegan = vn;
      _lactoseFree = lf;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_glutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (_vegetarian && !meal.isVegetarian) {
          return false;
        }
        if (_vegan && !meal.isVegan) {
          return false;
        }
        if (_lactoseFree && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String id) {
    if (_favoriteMeals != null) {
      int indexMeal = _favoriteMeals.indexWhere((meal) {
        return meal.id == id;
      });
      if (indexMeal >= 0) {
        setState(() {
          _favoriteMeals.removeAt(indexMeal);
        });
      }
      return;
    }else{
      _favoriteMeals= [];
    }
    setState(() {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) {
        return meal.id == id;
      }));
    });
  }

  bool isFavorite(String id) {
    if (_favoriteMeals != null) {
      return _favoriteMeals.any((meal) {
        return meal.id == id;
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigoAccent,
        canvasColor: Colors.lightBlue,
        fontFamily: 'Railway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed')),
      ),
      routes: {
        '/': (ctx) =>
            TabsScreen(_favoriteMeals), //Same as home: CategoriesScreen()
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFavorite, isFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
            _setFilters, _glutenFree, _vegetarian, _vegan, _lactoseFree),
      },

      //Catch wrong redirections
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },

      //Failed to build
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
