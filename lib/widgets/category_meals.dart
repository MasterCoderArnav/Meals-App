import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMeals extends StatefulWidget {
  final List<Meal> availableMeals;
  const CategoryMeals({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  late String categoryTitle;
  late List<Meal> filtered;
  late String categoryID;

  void _removeMeal(Meal meal) {
    setState(() {
      filtered.removeWhere((element) => meal == element);
    });
  }

  @override
  void initState() {
//Modal Route does not work here
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final argValues =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    categoryID = argValues['id'] ?? "NA";
    categoryTitle = argValues['title'] ?? "Meals";
    filtered = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryID))
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MealItem(
              meal: filtered[index],
            ),
          );
        },
        itemCount: filtered.length,
      ),
    );
  }
}
