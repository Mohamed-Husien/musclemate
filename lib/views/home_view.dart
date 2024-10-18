import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/1/day1_ex1.dart';
import 'package:musclemate/1/day1_ex2.dart';
import 'package:musclemate/1/day1_ex3.dart';
import 'package:musclemate/generated/l10n.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/meal_plan/meal_plan_view.dart';
import 'package:musclemate/views/weight/weight_view.dart';
import 'package:musclemate/views/workout/workout_view_2.dart';
import 'package:musclemate/views/running/running_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? _selectedExerciseIndex;

  @override
  Widget build(BuildContext context) {
    List dataArr = [
      {
        "name": S.of(context).running,
        "image": "assets/img/2.png",
      },
      {
        "name": S.of(context).push,
        "image": "assets/img/3.png",
      },
      {
        "name": S.of(context).leg,
        "image": "assets/img/5.png",
      }
    ];

    List trainingDayArr = [
      {
        "name": S.of(context).day1,
      },
      {
        "name": S.of(context).day2,
      },
      {
        "name": S.of(context).day3,
      }
    ];
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.kPrimaryColor,
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/black_white.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          S.of(context).fitness,
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                width: media.width,
                height: media.width * 0.4,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 0.5,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.65,
                      enlargeFactor: 0.4,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                  itemCount: dataArr.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int index) {
                    var dObj = dataArr[index] as Map? ?? {};
                    return GestureDetector(
                      onTap: () {
                        if (dObj["name"] == "Running") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RunningView()),
                          );
                        } else if (dObj["image"] == "assets/img/3.png") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutView2()),
                          );
                        } else if (dObj["image"] == "assets/img/5.png") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutView2()),
                          );
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2)),
                            ]),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(dObj["image"].toString(),
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                dObj["name"].toString(),
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: media.width,
                height: media.width * 1.1,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 0.6,
                      enlargeCenterPage: true,
                      viewportFraction: 0.85,
                      enableInfiniteScroll: false,
                      enlargeFactor: 0.4,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                  itemCount: trainingDayArr.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int index) {
                    var tObj = trainingDayArr[index] as Map? ?? {};
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          color: TColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2)),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            tObj["name"].toString(),
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            S.of(context).week1,
                            style: TextStyle(
                                color: TColor.secondaryText.withOpacity(0.8),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          ExercisesRow(
                            number: "1",
                            title: S.of(context).ex1,
                            time: "7 min",
                            isActive: _selectedExerciseIndex == 1,
                            onPressed: () {
                              setState(() {
                                _selectedExerciseIndex = 1;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Day1Ex1View()),
                              );
                            },
                            iconColor: _selectedExerciseIndex == 1
                                ? TColor.kPrimaryColor
                                : Colors.grey,
                          ),
                          ExercisesRow(
                            number: "2",
                            title: S.of(context).ex2,
                            time: "15 min",
                            isActive: _selectedExerciseIndex == 2,
                            onPressed: () {
                              setState(() {
                                _selectedExerciseIndex = 2;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Day1Ex2View()),
                              );
                            },
                            iconColor: _selectedExerciseIndex == 2
                                ? Colors.brown
                                : Colors.grey,
                          ),
                          ExercisesRow(
                            number: "3",
                            title: S.of(context).ex3,
                            time: "5 min",
                            isLast: true,
                            isActive: _selectedExerciseIndex == 3,
                            onPressed: () {
                              setState(() {
                                _selectedExerciseIndex = 3;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Day1Ex3View()),
                              );
                            },
                            iconColor: _selectedExerciseIndex == 3
                                ? Colors.yellow
                                : Colors.grey,
                          ),
                          const Spacer(),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RunningView(),
                    ),
                  );
                },
                child: Image.asset("assets/img/menu_running.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MealPlanView2(),
                    ),
                  );
                },
                child: Image.asset("assets/img/menu_meal_plan.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
                child: Image.asset("assets/img/menu_home.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeightView(),
                    ),
                  );
                },
                child: Image.asset("assets/img/menu_weight.png",
                    width: 25, height: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExercisesRow extends StatelessWidget {
  final String number;
  final String title;
  final String time;
  final bool isActive;
  final bool isLast;
  final VoidCallback onPressed;
  final Color iconColor;

  const ExercisesRow({
    super.key,
    required this.number,
    required this.title,
    required this.time,
    required this.onPressed,
    this.isActive = false,
    this.isLast = false,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isActive ? iconColor : Colors.grey,
        child: Text(
          number,
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(title),
      subtitle: Text(time),
      trailing: isLast ? Icon(Icons.star, color: iconColor) : null,
      onTap: onPressed,
    );
  }
}
