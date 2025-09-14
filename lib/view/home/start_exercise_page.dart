import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_app/view/home/profile_page.dart';
import 'package:workout_app/view/fitur/workout_plan.dart';

class StartExercisePage extends StatefulWidget {
  final List<WorkoutPlan> workoutlist;

  const StartExercisePage({super.key, required this.workoutlist});

  @override
  State<StartExercisePage> createState() => _StartExercisePageState();
}

class _StartExercisePageState extends State<StartExercisePage> {
  int currentIndex = 0;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _setupVideoController();
  }

  void _setupVideoController() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://vod.api.video/vod/viG6N1e0lSCkgSPk6v6kMAy/mp4/source.mp4',
      ),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToNextExercise() {
    if (currentIndex < widget.workoutlist.length - 1) {
      setState(() {
        currentIndex++;
        _controller.pause();
        _setupVideoController(); // reset video for next exercise
      });
    } else {
      Navigator.pop(context); // selesai semua latihan
    }
  }

  @override
  Widget build(BuildContext context) {
    final plan = widget.workoutlist[currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, color: Colors.black),
                  const Text(
                    'Good morning!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfilePage()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/img/img_avatar_1.png'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // WORKOUT CONTENT
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      plan.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),

                    const SizedBox(height: 16),

                    Text(
                      "${plan.setsReps}\n${plan.rest}",
                      style: const TextStyle(
                        color: Color(0xFF004D66),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E9E5B),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: goToNextExercise,
                      child: Text(
                        currentIndex < widget.workoutlist.length - 1
                            ? "Next Exercise"
                            : "Finish Workout",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
