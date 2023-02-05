import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_app/core/ui_helper.dart';
import 'package:task_app/data/model/video_model.dart';
import 'package:task_app/screen/widget/video_player.dart';
import 'package:task_app/util/datetime_formatter.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulHookConsumerWidget {
  const VideoCard({super.key, required this.video});
  final VideoModel video;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoCardState();
}

class _VideoCardState extends ConsumerState<VideoCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.video.caption,
            style: textTheme.titleMedium,
          ),
          Text(
            formatTime(widget.video.createdAt),
            style: textTheme.titleMedium,
          ),
          // VideoPlayerWidget(
          //   videoPlayerController: VideoPlayerController.network(widget.video.videoUrl),
          //   autoplay: false,
          //   looping: false,
          // ),
        ],
      ),
    );
  }
}
