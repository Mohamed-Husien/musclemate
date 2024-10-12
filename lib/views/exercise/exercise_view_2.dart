import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseView2 extends StatefulWidget {
  const ExerciseView2({super.key});

  @override
  State<ExerciseView2> createState() => _ExerciseView2State();
}

class _ExerciseView2State extends State<ExerciseView2> {
  List<Map<String, String>> currentExercises = [];

  final List<Map<String, String>> chestExercises = [
    {
      "title": "Kneeling Barbell Landmine Press exercise",
      "url": "https://youtu.be/WiqeCtJdWnw?si=P-ZRLAQ-7Ow60QSk",
    },
    {
      "title": "Incline Barbell Bench Press exercise",
      "url": "https://youtu.be/qeHr4_tZjqc?si=FvoDnwxbVXvTEL7r",
    },
    {
      "title": "Barbell Landmine Single Arm Low exercise",
      "url": "https://youtu.be/u2eCSS2OXq0?si=pUJqWM1qvl6HwNoV",
    },
    {
      "title": "Barbell Bench Press exercise",
      "url": "https://youtu.be/70kFVv5z1bE?si=Ko17TcMtX5cMVr1f",
    },
  ];

  final List<Map<String, String>> backExercises = [
    {
      "title": "Dumbbell Palm Rotational Bent Over Row exercise",
      "url": "https://youtu.be/xyi0gDhqQ5Y?si=_wH9xzCq0PleY9GD",
    },
    {
      "title": "Single Arm Dumbbell Row exercise",
      "url": "https://youtu.be/yaFLjkOPK9Y?si=aY8_6OnxOEmbkP5u",
    },
    {
      "title": "Incline Dumbbell Hammer Row exercise",
      "url": "https://youtu.be/Err7TfT3bag?si=KJ5jiapnQoj7qasq",
    },
    {
      "title": "Bent Over Dumbbell Row exercise",
      "url": "https://youtu.be/oldIH_CdFyk?si=bpmECkgfK6ubPaUu",
    },
  ];

  final List<Map<String, String>> shoulderExercises = [
    {
      "title": "Prone Incline Barbell Rear Delt Raise",
      "url": "https://youtu.be/iaGrU8O1E6E?si=S84Xm4z4aNdCeZ4N",
    },
  ];

  final List<Map<String, String>> armExercises = [];

  final List<Map<String, String>> footExercises = [];

  void _navigateToExercisePage(
      BuildContext context, List<Map<String, String>> exercises) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExerciseDetailView(exercises: exercises),
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
          SizedBox(
            height: 30,
          ),
          _buildExerciseCategory("Push", () {
            _navigateToExercisePage(context, chestExercises);
          }),
          _buildExerciseCategory("Bull", () {
            _navigateToExercisePage(context, backExercises);
          }),
          _buildExerciseCategory("Shoulder", () {
            _navigateToExercisePage(context, shoulderExercises);
          }),
          _buildExerciseCategory("Arm", () {
            _navigateToExercisePage(context, armExercises);
          }),
          _buildExerciseCategory("Foot", () {
            _navigateToExercisePage(context, footExercises);
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

class ExerciseDetailView extends StatelessWidget {
  final List<Map<String, String>> exercises;

  const ExerciseDetailView({required this.exercises, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Details'),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          String videoUrl = exercises[index]['url']!;
          String title = exercises[index]['title']!;
          String videoId = YoutubePlayer.convertUrlToId(videoUrl)!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
                progressIndicatorColor: TColor.kPrimaryColor,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
