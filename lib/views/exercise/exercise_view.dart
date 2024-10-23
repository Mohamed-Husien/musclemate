import 'package:musclemate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/exercise/dummy_data_exercise.dart';
import 'package:musclemate/views/exercise/exercise_view_details.dart';
import 'package:musclemate/views/home_view.dart';
import 'package:musclemate/views/meal_plan/meal_plan_view.dart';
import 'package:musclemate/views/running/running_view.dart';
import 'package:musclemate/views/weight/weight_view.dart';

class ExersizeView extends StatefulWidget {
  const ExersizeView({super.key});

  @override
  State<ExersizeView> createState() => _ExersizeViewState();
}

class _ExersizeViewState extends State<ExersizeView> {
  void _navigateToExercisePage(
      BuildContext context, List<Map<String, String>> exercises, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ExerciseDetailView(exercises: exercises, appBarTitle: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).exercisecat),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          _buildExerciseCategory(S.of(context).push, () {
            _navigateToExercisePage(context, chestExercises, "Push");
          }),
          _buildExerciseCategory(S.of(context).pull, () {
            _navigateToExercisePage(context, backExercises, "Pull");
          }),
          _buildExerciseCategory(S.of(context).shoulder, () {
            _navigateToExercisePage(context, shoulderExercises, "Shoulder");
          }),
          _buildExerciseCategory(S.of(context).arm, () {
            _navigateToExercisePage(context, armExercises, "Arm");
          }),
          _buildExerciseCategory(S.of(context).leg, () {
            _navigateToExercisePage(context, legExercises, "Leg");
          }),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: TColor.kPrimaryColor,
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
                child: Image.asset(
                  "assets/img/menu_running.png",
                  width: 25,
                  height: 25,
                  color: Colors.white,
                ),
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
                child: Image.asset(
                  "assets/img/menu_meal_plan.png",
                  width: 25,
                  height: 25,
                  color: Colors.white,
                ),
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
                child: Image.asset(
                  "assets/img/menu_home.png",
                  width: 25,
                  height: 25,
                  color: Colors.white,
                ),
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
                child: Image.asset(
                  "assets/img/menu_weight.png",
                  width: 25,
                  height: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCategory(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: TColor.kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
