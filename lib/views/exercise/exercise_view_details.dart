import 'package:flutter/material.dart';
import 'package:musclemate/helpers/color_extension.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseDetailView extends StatelessWidget {
  final List<Map<String, String>> exercises;
  final String appBarTitle;

  const ExerciseDetailView({
    required this.exercises,
    required this.appBarTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("$appBarTitle Exercises"),
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
