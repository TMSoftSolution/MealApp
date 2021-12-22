import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = arg['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Detail'),
      ),
      body: Text('Meal Detail $id'),
    );
  }
}
