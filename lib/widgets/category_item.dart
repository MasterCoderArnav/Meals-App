import 'package:flutter/material.dart';
import 'package:meals/utils/routes.dart';

class CategorItem extends StatelessWidget {
  final String id;
  final Color color;
  final String title;
  const CategorItem(
      {Key? key, required this.color, required this.title, required this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(categoryMealRoute,
            arguments: {'id': id, 'title': title});
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
