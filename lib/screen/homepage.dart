import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_app/data/model/video_model.dart';
import 'package:task_app/screen/widget/video_card.dart';

import '../core/icon_value.dart';
import '../core/ui_helper.dart';
import '../data/provider/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoData = ref.watch(videoDataProvider);
    return Scaffold(
      body: videoData.when(
        data: (data) {
          return HomeView(videos: data);
        },
        error: (error, stackTrace) {
          return Center(
            child: Text('Oopss! $error'),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

class HomeView extends ConsumerWidget {
  const HomeView({super.key, required this.videos});
  final List<VideoModel> videos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
          style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(backgroundColor: kIconBGColor),
          icon: Image.asset(
            kCameraIcon,
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(backgroundColor: kIconBGColor),
            icon: Image.asset(
              kNotificationIcon,
              height: 24,
              width: 24,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: videos.length,
        itemBuilder: (context, index) => VideoCard(
          video: videos[index],
        ),
        separatorBuilder: (context, index) => kVerticalSpaceM,
      ),
    );
  }
}
