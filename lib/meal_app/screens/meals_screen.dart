import 'package:app_one/meal_app/models/meal.dart';
import 'package:app_one/meal_app/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  String complexityText(Meal meal) {
    switch (meal.complexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.hard:
        return "Hard";
      case Complexity.challenging:
        return "Challenging";
      default:
        return "Unknown";
    }
  }

  String affordabilityText(Meal meal) {
    switch (meal.affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.luxurious:
        return "Luxurious";
      case Affordability.pricey:
        return "Pricey";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: title,
          child: Text(title),
        ),
      ),
      body: ListView(
        children: meals
            .map((e) => Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.all(15),
                  child: InkWell(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Stack(children: [
                            Hero(
                              tag: e.id,
                              child: FadeInImage(
                                  placeholder: MemoryImage(kTransparentImage),
                                  image: NetworkImage(e.imageUrl)),
                            ),
                            Image.network(e.imageUrl),
                            Positioned(
                              bottom: 15,
                              right: 0,
                              left: 60,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                color: Colors.black.withOpacity(.5),
                                child: Hero(
                                  tag: e.title,
                                  child: Text(
                                    e.title,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton.icon(
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {},
                                label: Text("${e.duration} min"),
                                icon: const Icon(Icons.schedule),
                              ),
                              TextButton.icon(
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {},
                                label: Text(complexityText(e)),
                                icon: const Icon(Icons.work),
                              ),
                              Expanded(
                                child: TextButton.icon(
                                  style: TextButton.styleFrom(
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {},
                                  label: Text(affordabilityText(e)),
                                  icon: const Icon(Icons.attach_money),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MealDetails(
                                    meal: e,
                                  )));
                    },
                  ),
                ))
            .toList(),
      ),
    );
  }
}
