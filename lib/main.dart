import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/screens/tab_screen_optional.dart';
import 'package:meals/utils/dummy_data.dart';
import 'package:meals/widgets/category_meals.dart';
import 'package:meals/utils/routes.dart';

import 'models/meal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeal = dummyMeals;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeal = dummyMeals.where((meal) {
        if (_filters['gluten'] != null &&
            _filters['gluten'] as bool &&
            !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] != null &&
            _filters['lactose'] as bool &&
            !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] != null &&
            _filters['vegan'] as bool &&
            !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] != null &&
            _filters['vegetarian'] as bool &&
            !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final index = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index >= 0) {
      setState(() {
        _favouriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favouriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavourite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        accentColor: Colors.yellowAccent,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(21, 51, 51, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(21, 51, 51, 1),
                fontWeight: FontWeight.bold,
              ),
              headline1: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        tabRoute: (context) =>
            TabScreenOptional(favouriteMeals: _favouriteMeals),
        homeRoute: (context) => const HomePage(),
        categoryMealRoute: (context) =>
            CategoryMeals(availableMeals: _availableMeal),
        mealDetailRoute: (context) => MealDetail(
            addFavourite: _toggleFavourite, isFavourite: isMealFavourite),
        filterRoute: (context) =>
            FiltersScreen(currentFilters: _filters, saveFilters: _setFilters),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: CategoryScreen(),
      ),
    );
  }
}
