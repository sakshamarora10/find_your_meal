import 'package:find_your_meal/models/meals.dart';
import 'package:flutter/material.dart';
import '../dummydata.dart';
import '../widgets/disp_categories.dart';
class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 320,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3/2
        ),
        children: DUMMY_CATEGORIES.map((category)=>DisplayCategories(category.title, category.color,category.id)).toList(),
    ),
      ),
    );
    
  }
}
