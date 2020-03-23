import 'package:find_your_meal/dummydata.dart';
import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/disp_meals.dart';
class Meals extends StatelessWidget {
  static const routename='/meals_screen';
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle=args['title'];
    final categoryId=args['id'];
    final List<Meal> selectedMeals= DUMMY_MEALS.where((item){
      return item.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.all(10),
            child: DisplayMeals(
              affordability: selectedMeals[index].affordability,
              title : selectedMeals[index].title,
              complexity : selectedMeals[index].complexity,
              duration : selectedMeals[index].duration,
              id : selectedMeals[index].id,
              imageUrl: selectedMeals[index].imageUrl,
            ),
          );
        },
        itemCount: selectedMeals.length,
      ),
      
    );
  }
}