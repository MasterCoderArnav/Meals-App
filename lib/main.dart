import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/screens/tab_screen.dart';
import 'package:meals/screens/tab_screen_optional.dart';
import 'package:meals/widgets/category_meals.dart';
import 'package:meals/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        tabRoute: (context) => TabScreenOptional(),
        homeRoute: (context) => const HomePage(),
        categoryMealRoute: (context) => const CategoryMeals(),
        mealDetailRoute: (context) => const MealDetail(),
        filterRoute: (context) => const FilterScreen(),
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
