import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musclemate/helpers/color_extension.dart';

class MealPlanView2 extends StatefulWidget {
  const MealPlanView2({super.key});

  @override
  State<MealPlanView2> createState() => _MealPlanView2State();
}

class _MealPlanView2State extends State<MealPlanView2> {
  String selectedDiet = "bulking";
  String selectedDay = "Monday";
  List meals = [];

  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final List<String> dietTypes = ['bulking', 'drying'];

  bool isLoading = false;
  String apiKey = '06faa44a593a42f58cc7ca5de595a96d';

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    setState(() {
      isLoading = true;
    });

    final String dietQuery =
        selectedDiet == 'bulking' ? 'high-protein' : 'low-carb';
    final String apiUrl =
        "https://api.spoonacular.com/mealplanner/generate?timeFrame=day&diet=$dietQuery&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List mealsData = data["meals"];
        setState(() {
          meals = mealsData.map((meal) {
            return {
              "name": meal["title"],
              "image":
                  "https://spoonacular.com/recipeImages/${meal["id"]}-312x231.jpg",
              "title": meal["readyInMinutes"].toString() + " min",
              "type": selectedDiet,
              "meal": "meal",
              "day": selectedDay,
            };
          }).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load meals');
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var filteredMeals = meals.where((meal) {
      return meal["type"] == selectedDiet && meal["day"] == selectedDay;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.kPrimaryColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/img/black_white.png",
            width: 25,
            height: 25,
          ),
        ),
        title: const Text(
          "Meal Plan",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedDiet,
                          decoration: InputDecoration(
                            labelText: 'Select Diet Type',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          items: dietTypes.map((String diet) {
                            return DropdownMenuItem<String>(
                              value: diet,
                              child: Text(
                                diet[0].toUpperCase() + diet.substring(1),
                                style: const TextStyle(fontSize: 16),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedDiet = newValue!;
                              fetchMeals();
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedDay,
                          decoration: InputDecoration(
                            labelText: 'Select Day',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          items: days.map((String day) {
                            return DropdownMenuItem<String>(
                              value: day,
                              child: Text(
                                day,
                                style: const TextStyle(fontSize: 16),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedDay = newValue!;
                              fetchMeals();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    itemCount: filteredMeals.length,
                    itemBuilder: (context, index) {
                      var meal = filteredMeals[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                meal["image"].toString(),
                                width: media.width,
                                height: media.width * 0.55,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              meal["name"].toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              meal["title"].toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
