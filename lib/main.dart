
import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/meals_screen.dart';

void main(){ 
  runApp(MaterialApp(
    routes: {
      '/':(context)=> Categories(),
      Meals.routename:(context)=> Meals(),
    },
    title: "meal app" ,
    theme: ThemeData(
      fontFamily: 'Raleway',
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      textTheme: ThemeData.light().textTheme.copyWith(
        body1: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        title: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
        )
      )
    ),
    onGenerateRoute: (settings){
      return MaterialPageRoute(builder: (context)=> Categories());
    },
  ));
}

