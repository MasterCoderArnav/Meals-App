import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetail extends StatelessWidget {
  final Function addFavourite;
  final Function isFavourite;
  const MealDetail(
      {Key? key, required this.addFavourite, required this.isFavourite})
      : super(key: key);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget buildContainer(Widget child, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Meal>;
    final meal = args['meal'];
    return Scaffold(
      appBar: AppBar(
        title: Text(meal!.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        meal.ingredients[index],
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
              context,
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(
                          meal.steps[index],
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: meal.steps.length,
              ),
              context,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFavourite(meal.id);
        },
        child: Icon(
          isFavourite(meal.id) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
