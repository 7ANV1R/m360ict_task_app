import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_app/core/ui_helper.dart';
import 'package:task_app/data/model/video_model.dart';
import 'package:task_app/screen/widget/video_player.dart';
import 'package:task_app/util/datetime_formatter.dart';

import '../../core/icon_value.dart';

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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
      child: Container(
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
              style: textTheme.titleMedium!.copyWith(
                color: const Color(0xFF6C7A9C),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayerWidget(
                id: widget.video.id,
                videoUrl: widget.video.videoUrl,
                autoplay: false,
                looping: true,
              ),
            ),
            Row(
              children: [
                kHorizontalSpaceM,
                Image.asset(
                  kCommentIcon,
                  height: 18,
                  width: 18,
                  color: Colors.black,
                  fit: BoxFit.contain,
                ),
                kHorizontalSpaceXS,
                Text(
                  '10',
                  style: textTheme.labelLarge,
                ),
                kHorizontalSpaceM,
                Image.asset(
                  kHeartIcon,
                  height: 18,
                  width: 18,
                  color: Colors.black,
                  fit: BoxFit.contain,
                ),
                kHorizontalSpaceXS,
                Text(
                  '122',
                  style: textTheme.labelLarge,
                ),
                const Expanded(
                  child: kHorizontalSpaceL,
                ),
                Image.asset(
                  kShareIcon,
                  height: 18,
                  width: 18,
                  color: Colors.black,
                  fit: BoxFit.contain,
                ),
                kHorizontalSpaceS,
                Image.asset(
                  kSaveIcon,
                  height: 18,
                  width: 18,
                  color: Colors.black,
                  fit: BoxFit.contain,
                ),
                kHorizontalSpaceM,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
