import 'package:flutter/material.dart';
import 'package:meals/widgets/category_item.dart';
import '../utils/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategory
          .map((data) =>
              CategorItem(id: data.id, color: data.color, title: data.title))
          .toList(),
    );
  }
}
