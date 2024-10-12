import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:musclemate/views/exercise/dummy_data_exercise.dart';
import 'package:musclemate/views/exercise/exercise_view_details.dart';

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
        builder: (context) => ExerciseDetailView(exercises: exercises, appBarTitle: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Exercise Categories"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          _buildExerciseCategory("Push", () {
            _navigateToExercisePage(context, chestExercises, "Push");
          }),
          _buildExerciseCategory("Pull", () {
            _navigateToExercisePage(context, backExercises, "Pull");
          }),
          _buildExerciseCategory("Shoulder", () {
            _navigateToExercisePage(context, shoulderExercises, "Shoulder");
          }),
          _buildExerciseCategory("Arm", () {
            _navigateToExercisePage(context, armExercises, "Arm");
          }),
          _buildExerciseCategory("Leg", () {
            _navigateToExercisePage(context, legExercises, "Leg");
          }),
        ],
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
