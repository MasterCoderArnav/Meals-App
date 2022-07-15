import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../utils/dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final argValues =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String categoryID = argValues['id'] ?? "NA";
    String categoryTitle = argValues['title'] ?? "Meals";
    final filtered = dummyMeals
        .where((meal) => meal.categories.contains(categoryID))
        .toList();
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
            child: MealItem(meal: filtered[index]),
          );
        },
        itemCount: filtered.length,
      ),
    );
  }
}
