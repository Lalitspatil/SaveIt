import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final String url;

  const VideoItem({super.key, required this.url});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void togglePlay() {
    if (controller.value.isPlaying) {
      controller.pause();
      isPlaying = false;
    } else {
      controller.play();
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: togglePlay,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
          if (!isPlaying)
            Icon(Icons.play_circle, size: 70, color: Colors.white),
        ],
      ),
    );
  }
}