import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {super.key, required this.id, required this.videoUrl, required this.looping, required this.autoplay});
  final int id;
  final String videoUrl;
  final bool looping;
  final bool autoplay;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  initPlayer() async {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    await videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      showControlsOnInitialize: false,
      autoPlay: widget.autoplay,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.black),
          ),
        );
      },
    );
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    _chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chewie(
              controller: _chewieController!,
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
