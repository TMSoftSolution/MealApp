import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static String routeName = 'category_meals';

  @override
  Widget build(BuildContext context) {
    final routeAugment =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeAugment['id'];
    final categoryTitle = routeAugment['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
