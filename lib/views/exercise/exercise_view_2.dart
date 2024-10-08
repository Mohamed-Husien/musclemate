import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:musclemate/views/workout/workout_detail_view.dart';
import 'package:musclemate/widgets/tab_button.dart';
import 'dart:math';

class ExerciseView2 extends StatefulWidget {
  const ExerciseView2({super.key});

  @override
  State<ExerciseView2> createState() => _ExerciseView2State();
}

class _ExerciseView2State extends State<ExerciseView2> {
  int isActiveTab = 0;
  List exercises = [];
  List<String> images = [
    "assets/img/1.png",
    "assets/img/2.png",
    "assets/img/3.png",
    "assets/img/4.jpg",
    "assets/img/5.png",
    "assets/img/6.jpg",
    "assets/img/7.png",
    "assets/img/8.jpg",
    "assets/img/9.jpg",
    "assets/img/10.jpg",
    "assets/img/11.jpg",
    "assets/img/12.jpg",
    "assets/img/13.jpg",
    "assets/img/14.jpg",
    "assets/img/15.jpg",
    "assets/img/16.jpg",
    "assets/img/17.jpg",
    "assets/img/18.jpg",
    "assets/img/19.jpg",
    "assets/img/20.jpg"
  ];

  @override
  void initState() {
    super.initState();
    fetchExercises(8);
  }

  Future<void> fetchExercises(int categoryId) async {
    final String apiUrl =
        'https://wger.de/api/v2/exercise/?category=$categoryId&language=2';
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        exercises = data['results'];
        _assignImagesToExercises();
      });
    } else {
      print("Failed to fetch exercises");
    }
  }

  void _assignImagesToExercises() {
    final random = Random();
    for (var exercise in exercises) {
      exercise['image'] = images[random.nextInt(images.length)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Exercise"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TabButton2(
                  title: "Full Body",
                  isActive: isActiveTab == 0,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 0;
                    });
                    fetchExercises(8);
                  },
                ),
                TabButton2(
                  title: "Chest",
                  isActive: isActiveTab == 1,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 1;
                    });
                    fetchExercises(10);
                  },
                ),
                TabButton2(
                  title: "Back",
                  isActive: isActiveTab == 2,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 2;
                    });
                    fetchExercises(12);
                  },
                ),
                TabButton2(
                  title: "Shoulder",
                  isActive: isActiveTab == 3,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 3;
                    });
                    fetchExercises(13);
                  },
                ),
                TabButton2(
                  title: "Foot",
                  isActive: isActiveTab == 4,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 4;
                    });
                    fetchExercises(14);
                  },
                ),
                TabButton2(
                  title: "Arm",
                  isActive: isActiveTab == 5,
                  onPressed: () {
                    setState(() {
                      isActiveTab = 5;
                    });
                    fetchExercises(11);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: exercises.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      var exercise = exercises[index];
                      String imageUrl = exercise['image'] ?? '';
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WorkoutDetailView(
                                    exercise: exercise,
                                    imageUrl: imageUrl,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: exercise['id'],
                                    child: imageUrl.isNotEmpty
                                        ? Image.asset(
                                            imageUrl,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                color: Colors.grey,
                                                child: Center(
                                                  child: Text(
                                                    'No Image',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        : Image.asset(
                                            imageUrl,
                                            width: double.infinity,
                                          ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      exercise['name'] ?? 'Unnamed Exercise',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
