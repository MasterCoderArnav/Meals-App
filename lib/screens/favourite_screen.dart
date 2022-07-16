import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favourites;
  const FavouriteScreen({Key? key, required this.favourites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favourites.isEmpty
          ? const Center(
              child: Text('You dont have any favourites right now'),
            )
          : ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                return MealItem(meal: favourites[index]);
              }),
    );
  }
}
