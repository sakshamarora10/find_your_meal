import 'package:flutter/material.dart';
import '../screens/meals_screen.dart';

class DisplayCategories extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  void selectCategory(context){
    Navigator.of(context).pushNamed(Meals.routename,arguments: {
      'title':this.title,
      'id':this.id,
    });
  }
  DisplayCategories(this.title, this.color,this.id);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor:Colors.blue,
      borderRadius: BorderRadius.circular(15),
      onTap: ()=>selectCategory(context),
      child: Container(
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
