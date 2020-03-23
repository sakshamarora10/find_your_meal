import '../models/meals.dart';
import 'package:flutter/material.dart';

class DisplayMeals extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  DisplayMeals({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  });
 String get complexitytext{
   switch (complexity) {
     case Complexity.Challenging: return'Challenging';
     case Complexity.Hard: return'Hard';
     case Complexity.Simple: return'Simple';
   }
 }
  String get affordabilitytext{
   switch (affordability) {
     case Affordability.Pricey: return'Pricey';
     case Affordability.Luxurious: return'Luxurious';
     case Affordability.Affordable: return'Affordable';
   }
 }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black45,
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.timer),
                    SizedBox(width: 4,),
                    Text("$duration min"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 4,),
                    Text(affordabilitytext),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(width: 4,),
                    Text(complexitytext),
                  ],
                )
              ],
            ),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}
