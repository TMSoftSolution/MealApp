import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeAugment =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeAugment['id'];
    final categoryTitle = routeAugment['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The Recipes For The Category'),
      ),
    );
  }
}
